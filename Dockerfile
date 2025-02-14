FROM ubuntu:24.04
MAINTAINER sion.lv "595652979@qq.com"

#依赖安装
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get install -y libsqlite3-dev python3 python3-pip python3-dev curl unzip wget vim python3-pyqt5 git libmysqlclient-dev fonts-wqy-zenhei pipx
#RUN pip install click jupyter pandas numpy flask matplotlib lxml h5py mkl bokeh pyecharts Flask-SQLAlchemy pytdx mysql-connector-python tables akshare GitPython --break-system-packages
RUN pip install click jupyter pandas numpy flask matplotlib lxml h5py bokeh pyecharts Flask-SQLAlchemy pytdx mysql-connector-python tables akshare GitPython --break-system-packages
#Ta-Lib 
COPY build_talib.sh \
 ta-lib-0.4.0-src.tar.gz  /
RUN  cd / && sh build_talib.sh

#hikyuu编译
RUN mkdir /hikyuu
RUN echo $(ls -l )
RUN echo $(pwd)
COPY  ./hikyuu /hikyuu/
#COPY src.patch /hikyuu/
WORKDIR /hikyuu
#RUN cd /hikyuu && patch -p0 xmake.lua < src.patch
RUN echo $(ls -a)
RUN echo $(pwd)
# #xmake安装
RUN curl -fsSL https://xmake.io/shget.text | bash 

RUN source ~/.xmake/profile && export XMAKE_ROOT=y && python3 setup.py install -j8
RUN echo $(cd /usr/local/lib/python3.10/dist-packages/matplotlib/mpl-data/&&ls -a)
RUN echo $(cd /usr/local/lib/python3.10/dist-packages/matplotlib/mpl-data/&&pwd)
RUN echo $(cd / && find . |grep matplotlib)
#运行环境
EXPOSE 8888
#ENV LD_PRELOAD=/lib/x86_64-linux-gnu/libstdc++.so.6:$LD_PRELOAD
ENV LD_PRELOAD=/lib/aarch64-linux-gnu/libstdc++.so.6:$LD_PRELOAD
# 安装中文字体
COPY font.sh / 
RUN cd / && sh font.sh

# 配置密码
#COPY token.sh / 
#RUN cd / && sh token.sh


