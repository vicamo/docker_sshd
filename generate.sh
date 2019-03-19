#!/bin/bash
set -e

travisEnv=

for v in */*/; do
  v="${v%/}"
  suite=${v#*/}
  distro=${v%/*}
  sed "s/%DISTRO%/$distro/g; s/%SUITE%/$suite/g" Dockerfile.template > "$v/Dockerfile"
  if test ${#travisEnv} -ne 0; then
    travisEnv+='\n  - DISTRO='"$distro"' SUITE='"$suite";
  else
    travisEnv+='  - DISTRO='"$distro"' SUITE='"$suite";
  fi
done

travis="$(awk -v 'RS=\n\n' '($1 == "env:") { $0 = substr($0, 0, index($0, "matrix:") + length("matrix:"))"'"$travisEnv"'" } { printf "%s%s", $0, RS }' .travis.yml)"
echo "$travis" > .travis.yml
