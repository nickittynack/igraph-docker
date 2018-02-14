FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y build-essential
RUN apt-get install -y python-dev
RUN apt-get install -y python3-dev
RUN apt-get install -y python-cairo
RUN apt-get install -y python-gi-cairo
RUN apt-get install -y libxml2-dev
RUN apt-get install -y python-pip
RUN pip install --upgrade pip
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y pkg-config
RUN apt-get install -y libcairo2-dev libjpeg-dev libgif-dev
RUN pip3 install Pycairo
RUN pip3 install python-igraph
RUN apt-get install  -y ipython ipython-notebook
RUN pip3 install jupyter
RUN jupyter notebook --generate-config
COPY sample.py .
RUN apt-get install -y unzip
RUN apt-get install -y libtool
RUN apt-get install -y git
RUN apt-get install -y autotools-dev
RUN apt-get install -y automake
RUN apt-get install -y autoconf
RUN apt-get install -y bison
RUN apt-get install -y flex
ADD https://github.com/igraph/python-igraph/archive/master.zip .
RUN unzip master.zip
WORKDIR python-igraph-master
RUN python3 setup.py develop --c-core-url https://github.com/igraph/igraph/archive/master.tar.gz

WORKDIR /
# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]