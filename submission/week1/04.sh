#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <dir>"
  exit 1
fi

find "$1" -type f -name '*.txt' -print0 | while IFS= read -r -d '' file; do
    mv "$file" "${file%.txt}.md"
done