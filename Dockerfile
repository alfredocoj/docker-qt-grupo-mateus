FROM vcatechnology/linux-mint:18.2

# LIBS PRE-REQUISITOS
RUN apt-get -y update && apt-get -y install libdw-dev \
  libxcb-xinerama0-dev \
  libgl1-mesa-dev \
  libgl1-mesa-glx \
  libglib2.0-0 \
  libnss3-dev \
  unixodbc \
  unixodbc-dev \
  freetds-dev \
  freetds-bin \
  tdsodbc \
  postgresql-server-dev-all \
  sudo \
  ubuntu-sdk \
  mcedit iputils-ping

RUN useradd -G root developer

# USUARIO
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer

ENV DIR_PROJETO_QT release/wms_cd

ADD . $HOME/

WORKDIR $HOME

CMD ["ls","-la"]

COPY qt/odbcinst.ini /etc/
COPY qt/odbc.ini /etc/

#RUN qmake $HOME/qt/sqldrivers/odbc/odbc.pro && make && make install

EXPOSE 9093
