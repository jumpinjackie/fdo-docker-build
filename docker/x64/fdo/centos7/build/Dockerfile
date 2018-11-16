# This dockerfile executes the build, it starts from the dev environment
FROM fdo_centos7_develop_x64

# These are the build steps
RUN BUILD_DIR=/usr/local/src/fdo/build \
&& ccache -s \
&& mkdir $BUILD_DIR \ 
&& mkdir $BUILD_DIR/artifacts \ 
&& cd $BUILD_DIR \
&& cmake -G Ninja .. -DWITH_SDF=TRUE -DWITH_SHP=TRUE -DWITH_SQLITE=TRUE -DWITH_WFS=TRUE -DWITH_WMS=TRUE -DWITH_OGR=TRUE -DWITH_GDAL=TRUE -DWITH_GENERICRDBMS=TRUE \
&& ninja-build \
&& ccache -s \
&& ninja-build package \
&& mv fdosdk*.tar.gz $BUILD_DIR/artifacts