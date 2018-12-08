# This dockerfile executes the build, it starts from the dev environment
FROM mapguide_ubuntu14_develop_x64

# These are the build steps

# 1. Internal thirdparty
RUN BUILD_DIR=/usr/local/src/mapguide/build \
&& OEM_BUILD_DIR=/usr/local/src/mapguide/build_oem \
&& ccache -s \
&& mkdir -p $OEM_BUILD_DIR \
&& mkdir -p $BUILD_DIR \
&& cd /usr/local/src/mapguide/MgDev \
&& ./cmake_bootstrap.sh --oem-working-dir $OEM_BUILD_DIR --build 64 --with-ccache --have-system-xerces \
&& ccache -s

# 2. Add FDO sdk this should've been copied to the same directory by snap.sh
ADD fdosdk.tar.gz /usr/local/fdo-4.2.0

# 3. Add atomic.h (needed to build DWF Toolkit)
ADD atomic.h /usr/include/asm/

# 4. Main build
RUN BUILD_DIR=/usr/local/src/mapguide/build \
&& OEM_BUILD_DIR=/usr/local/src/mapguide/build_oem \
&& ccache -s \
&& cd /usr/local/src/mapguide/MgDev \
&& ./cmake_build.sh --oem-working-dir $OEM_BUILD_DIR --cmake-build-dir $BUILD_DIR --ninja \
&& ccache -s \
&& cd $BUILD_DIR \
&& ninja install

# 5. Tar the installation
RUN BUILD_DIR=/usr/local/src/mapguide/build \
&& mkdir -p $BUILD_DIR/artifacts \
&& cd /usr/local/mapguideopensource-3.3.0 \
&& tar -zcf $BUILD_DIR/artifacts/mapguideopensource-3.3.0.0-ubuntu14-amd64.tar.gz *