FROM ubuntu:18.04

MAINTAINER XinglinHe

#更新apt-get环境
RUN apt-get update

COPY jdk-11.0.2 /root/jdk

ENV JAVA_HOME /root/jdk
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

#安装pip环境
RUN apt-get install -y python3-pip
#安装jupyter
RUN pip3 install jupyter

COPY ijava /root/ijava

RUN python3 /root/ijava/install.py

RUN mkdir object
RUN mkdir object/java
RUN mkdir object/python

#安装python的工具库

RUN jupyter notebook --generate-config

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

CMD jupyter notebook --allow-root





