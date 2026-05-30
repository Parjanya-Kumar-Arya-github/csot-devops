#!/bin/bash

awk 'NF > 0 {print $1}' "$1" | sort -u | wc -l