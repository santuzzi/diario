#!/usr/bin/env bash

rm -rf html
mkdir html
for w in {00..52}; do
    if [ -r diario-$w.yaml ]; then
        ./format $w
    fi
done
cp *css *js html
mv *.html html