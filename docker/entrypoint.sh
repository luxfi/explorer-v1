#!/bin/sh
set -e

if [ -n "$BRAND_PACKAGE" ]; then
  BRAND_URL="https://cdn.jsdelivr.net/npm/${BRAND_PACKAGE}/brand.json"
  echo "Fetching brand.json from ${BRAND_URL}"
  # Try common static asset paths
  for dir in /app/priv/static /app/public /opt/app/priv/static; do
    if [ -d "$dir" ]; then
      wget -q -O "$dir/brand.json" "$BRAND_URL" && echo "Wrote brand.json to $dir" && break
    fi
  done
fi

exec "$@"
