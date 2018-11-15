# This dockerfile makes a snapshot of the development environment
FROM fdo_centos7_run

# Install build dependencies
RUN yum install -y wget \
&& wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
&& rpm -ivh epel-release-latest-7.noarch.rpm \
&& yum repolist \
&& yum update -y \
&& yum install -y redhat-lsb-core ccache gcc gcc-c++ bison curl-devel unixODBC-devel libcom_err-devel \ 
krb5-devel openssl-devel mysql-devel postgresql-devel xerces-c-devel xalan-c-devel gdal-devel \ 
cppunit-devel cmake ninja-build

# include the code
COPY fdo/ /usr/local/src/fdo

# include our last collected cache
COPY caches/x64/fdo/centos7/.ccache /root/.ccache

# remove intermediate files (to ensure a clean build later)
RUN rm -rf /usr/local/src/fdo/build

# since fdo is a submodule on the local machine
# git relocated .git/ to the parent repo, un-submodule it in the image
RUN rm /usr/local/src/fdo/.git
COPY .git/modules/fdo /usr/local/src/fdo/.git/


