#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
MANIFEST="$ROOT_DIR/manifest.tsv"
OUT_DIR="$ROOT_DIR/raw"
LOG_DIR="$ROOT_DIR/logs"
SUCCESS_LOG="$LOG_DIR/downloaded.tsv"
FAIL_LOG="$LOG_DIR/failed.tsv"
mkdir -p "$OUT_DIR" "$LOG_DIR"
: > "$SUCCESS_LOG"
: > "$FAIL_LOG"
url_to_pdf(){
  local u="$1"
  if [[ "$u" =~ arxiv\.org/abs/([0-9]+\.[0-9]+) ]]; then echo "https://arxiv.org/pdf/${BASH_REMATCH[1]}.pdf"; return; fi
  if [[ "$u" =~ arxiv\.org/pdf/([0-9]+\.[0-9]+)(\.pdf)? ]]; then echo "https://arxiv.org/pdf/${BASH_REMATCH[1]}.pdf"; return; fi
  if [[ "$u" =~ openreview\.net/forum\?id=([^&]+) ]]; then echo "https://openreview.net/pdf?id=${BASH_REMATCH[1]}"; return; fi
  echo "$u"
}
slugify(){ tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g;s/^-+//;s/-+$//;s/-+/-/g'; }
{ read -r _; while IFS=$'\t' read -r page_id year short_name title url status notion_url; do
  slug=$(printf '%s' "$short_name" | slugify)
  [[ -z "$slug" ]] && slug=$(printf '%s' "$title" | slugify | cut -c1-40)
  file="$OUT_DIR/${year}__${slug}__${page_id}.pdf"
  pdf_url=$(url_to_pdf "$url")
  if curl -L --fail --silent --show-error "$pdf_url" -o "$file"; then
    echo -e "$page_id\t$file\tOK\t$pdf_url" >> "$SUCCESS_LOG"
  else
    rm -f "$file"
    echo -e "$page_id\tFAILED\t$pdf_url\t$title" >> "$FAIL_LOG"
  fi
 done; } < "$MANIFEST"
echo "done"
