#!/usr/bin/env bash
ORIG=$(pwd)                                                                                                       
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"                                                           
ROOT="$(realpath $DIR/../../../..)"
PROJ="$ROOT/fdo/"
STAGE="$ROOT/artifacts"

#TODO: This should be sourced from a central place (as we fork this out to distro-specific builds)
FDO_VER=4.2.0.0
FDO_ARCH=amd64

COMPONENT=`basename $(dirname $(dirname $DIR))`
DISTRO=`basename $(dirname $DIR)`
THIS_DIR=`basename $DIR`
CONTAINER_NAME="${COMPONENT}_${DISTRO}_${THIS_DIR}"

indent(){
    sed 's/^/    /'
}

echo "Taking a 'develop' snapshot first (required for '$CONTAINER_NAME')"
"$DIR/../develop/snap.sh" | indent

cd "$DIR"
docker build . -t "$CONTAINER_NAME:latest"
if [ "$?" -ne 0 ] ; then
    exit 1
fi
echo "Copying SDK tarball to artifacts"
docker run --rm -it -v ${STAGE}:/artifacts $CONTAINER_NAME cp /usr/local/src/fdo/build/fdosdk.tar.gz /artifacts/fdosdk-${FDO_VER}-${DISTRO}-${FDO_ARCH}.tar.gz
if [ "$?" -ne 0 ] ; then
    exit 1
fi

echo "things to try:"
echo "docker run --rm -it $CONTAINER_NAME /bin/bash"
echo "docker run --rm -it $CONTAINER_NAME ls /usr/local/src/fdo/build"
echo

cd "$ORIG"
