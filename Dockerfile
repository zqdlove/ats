FROM centos:7.2

MAINTAINER Chuck 345804606@qq.com

#Time zone control
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# install required packages
RUN yum install -y glibc-headers gcc-c++ wget curl locales build-essential bzip2 \
    openssl-devel libxml2-devel libpcre3-devel tcl-devel perl tar make git iproute net-tools

# install ats-7.1.3
RUN groupadd tserver -g 11111 && \
    useradd tserver -u 11111 -g tserver && \
    wget http://mirror.bit.edu.cn/apache/trafficserver/trafficserver-7.1.3.tar.bz2 && \
    tar jxvf trafficserver-7.1.3.tar.bz2 && \
    cd trafficserver-7.1.3 && \
    ./configure --prefix=/opt/ats --with-user=tserver && \
    make -j 24 && \
    make install && \
    cd / && rm -rf trafficserver-7.1.3 trafficserver-7.1.3.tar.bz2

# install luajit
RUN wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz && \
    tar zxvf LuaJIT-2.0.5.tar.gz && \
    cd LuaJIT-2.0.5 && \
    make -j 20 && \
    make install PREFIX=/opt/luajit && \
    cd / && rm -rf LuaJIT-2.0.5 LuaJIT-2.0.5.tar.gz

# install ats-plugin

# file cache
RUN mkdir /opt/data -p && \
    chown tserver:tserver /opt/data -R

# To give permission
RUN chown tserver:tserver /opt/ats -R

# CMD
CMD /opt/ats/bin/traffic_cop

EXPOSE 80