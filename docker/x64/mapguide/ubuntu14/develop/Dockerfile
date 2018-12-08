# This dockerfile makes a snapshot of the development environment
FROM mapguide_ubuntu14_run_x64

# Install build dependencies
RUN apt-get install -y \
lsb-release build-essential libpng-dev libjpeg-dev libxslt-dev libfreetype6-dev libpcre3-dev openjdk-7-jdk \
ant libldap-dev libssl-dev libcurl4-openssl-dev libexpat-dev libmysqlclient-dev unixODBC-dev \
python-dev libpq-dev libcppunit-dev libxalan-c-dev libxerces-c-dev libgdal-dev \
libjsoncpp-dev libgd-dev libace-dev libjsoncpp-dev cmake ccache ninja-build libgeos++-dev

# include the code
COPY mapguide/ /usr/local/src/mapguide

# include our last collected cache
COPY caches/x64/mapguide/ubuntu14/.ccache /root/.ccache

# remove intermediate files (to ensure a clean build later)
RUN rm -rf /usr/local/src/mapguide/build

# since mapguide is a submodule on the local machine
# git relocated .git/ to the parent repo, un-submodule it in the image
RUN rm /usr/local/src/mapguide/.git
COPY .git/modules/mapguide /usr/local/src/mapguide/.git/


