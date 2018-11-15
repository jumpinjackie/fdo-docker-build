# This dockerfile makes a snapshot of the development environment
FROM fdo_centos6_run

# Install build dependencies. Ninja has to be fetched and installed separately
# NOTE: Normal gcc/g++ is too old here (FDO now uses bits of the C++11 std library). 
# We have to use the community-provided Developer Toolset package: 
# https://www.softwarecollections.org/en/scls/rhscl/devtoolset-7/
RUN yum install -y wget centos-release-scl \
&& wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
&& rpm -ivh epel-release-6-8.noarch.rpm  \
&& yum repolist \
&& yum update -y \
&& yum install -y redhat-lsb-core ccache devtoolset-7 automake libtool bison unixODBC-devel libcom_err-devel \ 
krb5-devel mysql-devel postgresql-devel cmake unzip

# include the code
COPY fdo/ /usr/local/src/fdo

# include our last collected cache
COPY caches/x64/fdo/centos6/.ccache /root/.ccache

# remove intermediate files (to ensure a clean build later)
RUN rm -rf /usr/local/src/fdo/build && rm -rf /usr/local/src/fdo/build_thirdparty

# since fdo is a submodule on the local machine
# git relocated .git/ to the parent repo, un-submodule it in the image
RUN rm /usr/local/src/fdo/.git
COPY .git/modules/fdo /usr/local/src/fdo/.git/


