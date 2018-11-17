# This dockerfile makes a snapshot of the development environment
FROM fdo_ubuntu18_run_x64

# Install build dependencies
RUN apt-get install -y \
lsb-release ccache build-essential bison lintian dos2unix libssl-dev libcurl4-openssl-dev libexpat-dev libmysqlclient-dev \
unixodbc-dev libpq-dev libcppunit-dev libxalan-c-dev libxerces-c-dev libgdal-dev cmake ninja-build

# include the code
COPY fdo/ /usr/local/src/fdo

# include our last collected cache
COPY caches/x64/fdo/ubuntu16/.ccache /root/.ccache

# remove intermediate files (to ensure a clean build later)
RUN rm -rf /usr/local/src/fdo/build

# since fdo is a submodule on the local machine
# git relocated .git/ to the parent repo, un-submodule it in the image
RUN rm /usr/local/src/fdo/.git
COPY .git/modules/fdo /usr/local/src/fdo/.git/


