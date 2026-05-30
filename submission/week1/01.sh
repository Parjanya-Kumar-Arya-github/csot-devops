#!/bin/bash
set -euo pipefail

if [ -z "$1" ]; then
  echo "Usage: $0 <dir>"
  exit 1
fi

find "$1" -type f -size +1M -printf "%s\t%P\n" | sort -rn