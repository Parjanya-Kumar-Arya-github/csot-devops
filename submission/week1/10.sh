#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <dir>"
  exit 1
fi

du -k "$1" 2>/dev/null | sort -rn | head -n 10