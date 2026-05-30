#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <dir>"
  exit 1
fi

find "$1" -type f -print0 | xargs -0 sed -i 's/\t/    /g'