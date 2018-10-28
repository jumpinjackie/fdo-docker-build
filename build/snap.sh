#!/usr/bin/env bash
ORIG=$(pwd)                                                                                                       
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"                                                           
ROOT="$(dirname $DIR)"
PROJ="$ROOT/hello-cpp-linwin/"
STAGE="$ROOT/stage/"

indent(){
    sed 's/^/    /'
}

echo "Taking a 'develop' snapshot first (required for 'build')"
"$DIR/../develop/snap.sh" | indent

cd "$DIR"
docker build . -t "fdobuild:latest"

echo "things to try:"
echo "docker run --rm -it fdobuild /bin/bash"
echo

cd "$ORIG"
