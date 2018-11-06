# This dockerfile makes a snapshot of the development environment
FROM fdo_centos6_run

# Install build dependencies. Ninja has to be fetched and installed separately
RUN yum install -y wget \
&& wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
&& rpm -ivh epel-release-6-8.noarch.rpm  \
&& yum repolist \
&& yum update -y \
&& yum install -y redhat-lsb-core gcc gcc-c++ automake libtool bison unixODBC-devel libcom_err-devel \ 
krb5-devel openssl-devel mysql-devel postgresql-devel cmake unzip \
&& wget https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip \
&& unzip ninja-linux.zip -d /usr/local/bin

# include the code
COPY fdo/ /usr/local/src/fdo

# remove intermediate files (to ensure a clean build later)
RUN rm -rf /usr/local/src/fdo/build && rm -rf /usr/local/src/fdo/build_thirdparty

# since fdo is a submodule on the local machine
# git relocated .git/ to the parent repo, un-submodule it in the image
RUN rm /usr/local/src/fdo/.git
COPY .git/modules/fdo /usr/local/src/fdo/.git/


