#!/bin/zsh

set -e

mkdir down || true
cd down
wget -N `cat ../lists`
cd ..
cat down/* > joined
cat joined | dos2unix | grep -v "^#" |rev | cut -d" " -f 1 | cut -d$'\t' -f 1 | rev | sort | grep -ve '^$' | uniq > joined_clean

