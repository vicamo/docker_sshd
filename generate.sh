#!/bin/bash
set -e

travisEnv=

for v in */; do
  v="${v%/}"
  sed "s/%VERSION%/$v/g" Dockerfile.template > "$v/Dockerfile"
  if test ${#travisEnv} -ne 0; then
    travisEnv+='\n  - SUITE='"$v";
  else
    travisEnv+='  - SUITE='"$v";
  fi
done

travis="$(awk -v 'RS=\n\n' '($1 == "env:") { $0 = substr($0, 0, index($0, "matrix:") + length("matrix:"))"'"$travisEnv"'" } { printf "%s%s", $0, RS }' .travis.yml)"
echo "$travis" > .travis.yml
