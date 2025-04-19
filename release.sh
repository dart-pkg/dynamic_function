#! /usr/bin/bash
set -uvx
set -e
dart pub get
./do-analyze.sh
./do-test.sh
dart pub publish
git add .
git commit -m.
git push

