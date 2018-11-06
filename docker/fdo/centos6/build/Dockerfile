# This dockerfile executes the build, it starts from the dev environment
FROM fdo_centos6_develop

# These are the build steps
RUN THIRDPARTY_BUILD_DIR=/usr/local/src/fdo/build_thirdparty \
&& BUILD_DIR=/usr/local/src/fdo/build \
&& cd /usr/local/src/fdo/ \
&& ./cmake_bootstrap.sh --working-dir $THIRDPARTY_BUILD_DIR --all-internal --build 64 \
&& ./cmake_build.sh --build 64 --thirdparty-working-dir $THIRDPARTY_BUILD_DIR --cmake-build-dir $BUILD_DIR \
--ninja --with-sdf --with-shp --with-sqlite --with-ogr --with-gdal --with-wfs --with-wms --with-genericrdbms \
&& cd $BUILD_DIR \
&& ninja package \
&& mv fdosdk*.tar.gz fdosdk.tar.gz