# This dockerfile executes the build, it starts from the dev environment
FROM fdodev

# These are the build steps
RUN BUILD_DIR=/usr/local/src/fdo/build  \
&& mkdir $BUILD_DIR \ 
&& cd $BUILD_DIR \
&& cmake .. -DWITH_SDF=TRUE -DWITH_SHP=TRUE -DWITH_SQLITE=TRUE -DWITH_WFS=TRUE -DWITH_WMS=TRUE -DWITH_OGR=TRUE -DWITH_GDAL=TRUE -DWITH_GENERICRDBMS=TRUE \
&& make \
&& make package