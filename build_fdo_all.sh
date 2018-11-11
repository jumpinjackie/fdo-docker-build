#!/bin/bash
for $distro in ubuntu16 ubuntu14 centos7 centos6
do
    time ./docker/fdo/$distro/build/snap.sh 2>&1 | tee logs/fdo_$distro.log
    if [ "$?" -ne 0 ] ; then
        echo "ERROR building FDO for $distro"
        exit 1
    fi
done