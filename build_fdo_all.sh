#!/bin/bash
for cpu in x64 x86
do
    for distro in ubuntu18 ubuntu16 ubuntu14 centos7
    do
        if [ -d ./docker/$cpu/fdo/$distro ];
        then
            echo "Starting FDO build for $distro ($cpu)"
            time ./docker/$cpu/fdo/$distro/build/snap.sh 2>&1 | tee logs/fdo_${distro}_${cpu}.log
            if [ "$?" -ne 0 ] ; then
                echo "ERROR building FDO for $distro ($cpu)"
                exit 1
            fi
        else
            echo "No such docker environment for $distro ($cpu). Skipping"
        fi
    done
done