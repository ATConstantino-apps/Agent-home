#!/usr/bin/env bash
# Clone missing repos from repos.txt into repos/, and fast-forward the ones that exist.
set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST="${ROOT}/repos.txt"
DEST="${ROOT}/repos"
ORG="${GITHUB_ORG:-ATConstantino-apps}"
PROTOCOL="${CLONE_PROTOCOL:-https}"

usage() {
  cat <<EOF
Usage: $(basename "$0") [--https|--ssh]

Clone or update every repo listed in repos.txt into repos/<name>.

  --https   HTTPS (default). Uses whatever git credentials this machine already has.
  --ssh     git@github.com:ORG/name.git

Env:
  CLONE_PROTOCOL   https | ssh   (flag wins if both are set)
  GITHUB_ORG       GitHub owner  (default: ATConstantino-apps)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --ssh) PROTOCOL=ssh; shift ;;
    --https) PROTOCOL=https; shift ;;
    -h|--help) usage; exit 0 ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

case "$PROTOCOL" in
  https|ssh) ;;
  *)
    echo "CLONE_PROTOCOL must be https or ssh, got: $PROTOCOL" >&2
    exit 2
    ;;
esac

if [[ ! -f "$MANIFEST" ]]; then
  echo "Missing manifest: $MANIFEST" >&2
  exit 1
fi

mkdir -p "$DEST"

remote_url() {
  local name="$1"
  if [[ "$PROTOCOL" == "ssh" ]]; then
    printf 'git@github.com:%s/%s.git' "$ORG" "$name"
  else
    printf 'https://github.com/%s/%s.git' "$ORG" "$name"
  fi
}

# Access errors (private/missing) are skips so this script can run on a machine
# that only has a subset of repos. Real git failures (ff-only, corrupt dir) fail.
is_access_error() {
  local log="$1"
  grep -qiE 'repository not found|could not read Username|authentication failed|permission denied|could not access|remote error:.*not found' "$log"
}

cloned=0
updated=0
skipped=0
failed=0

while IFS= read -r raw || [[ -n "$raw" ]]; do
  name="${raw%%#*}"
  name="$(printf '%s' "$name" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
  [[ -z "$name" ]] && continue

  url="$(remote_url "$name")"
  dir="${DEST}/${name}"
  printf '==> %s\n' "$name"

  if [[ -d "$dir/.git" ]]; then
    logfile="$(mktemp)"
    if git -C "$dir" pull --ff-only >"$logfile" 2>&1; then
      echo "    updated (ff-only)"
      updated=$((updated + 1))
    else
      cat "$logfile" | sed 's/^/    /'
      if is_access_error "$logfile"; then
        echo "    skip: no access"
        skipped=$((skipped + 1))
      else
        echo "    fail: git pull --ff-only"
        failed=$((failed + 1))
      fi
    fi
    rm -f "$logfile"
  elif [[ -e "$dir" ]]; then
    echo "    fail: $dir exists but is not a git repo"
    failed=$((failed + 1))
  else
    logfile="$(mktemp)"
    if git clone -- "$url" "$dir" >"$logfile" 2>&1; then
      echo "    cloned"
      cloned=$((cloned + 1))
    else
      cat "$logfile" | sed 's/^/    /'
      if is_access_error "$logfile"; then
        echo "    skip: not found or no access ($url)"
        skipped=$((skipped + 1))
      else
        echo "    fail: git clone"
        failed=$((failed + 1))
      fi
    fi
    rm -f "$logfile"
  fi
done < "$MANIFEST"

echo
echo "cloned=$cloned updated=$updated skipped=$skipped failed=$failed"

if [[ "$failed" -ne 0 ]]; then
  exit 1
fi
exit 0
