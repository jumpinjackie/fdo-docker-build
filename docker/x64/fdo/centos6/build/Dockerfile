# This dockerfile executes the build, it starts from the dev environment
FROM fdo_centos6_develop_x64

# These are the build steps
RUN THIRDPARTY_BUILD_DIR=/usr/local/src/fdo/build_thirdparty \
&& ccache -s \
&& . scl_source enable devtoolset-7 \
&& cd /usr/local/src/fdo/ \
&& ./cmake_bootstrap.sh --working-dir $THIRDPARTY_BUILD_DIR --all-internal --build 64 \
&& ccache -s

# NOTE: We have to use standard make here as ninja wants to try to build internal thirdparty library
# targets again?
RUN THIRDPARTY_BUILD_DIR=/usr/local/src/fdo/build_thirdparty \
&& ccache -s \
&& . scl_source enable devtoolset-7 \
&& BUILD_DIR=/usr/local/src/fdo/build \
&& mkdir -p $BUILD_DIR/artifacts \ 
&& cd /usr/local/src/fdo/ \
&& ./cmake_build.sh --build 64 --thirdparty-working-dir $THIRDPARTY_BUILD_DIR --cmake-build-dir $BUILD_DIR \
--with-sdf --with-shp --with-sqlite --with-ogr --with-gdal --with-wfs --with-wms --with-genericrdbms \
&& ccache -s \
&& cd $BUILD_DIR \
&& make package \
&& mv fdosdk*.tar.gz $BUILD_DIR/artifacts