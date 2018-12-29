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

#RUN apt install unixodbc unixodbc-dev --install-suggests tdsodbc unixodbc-bin

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
#ENV HOME /home/developer


ENV HOME /home

ADD . $HOME/

WORKDIR $HOME

#RUN sudo apt install -y ./msodbcsql17_17.2.0.1-1_amd64.deb

COPY /qt/odbcinst.ini /etc/
COPY /qt/odbc.ini /etc/

#RUN qmake $HOME/qt/sqldrivers/odbc/odbc.pro && make && make install

EXPOSE 9093

#ADD build.sh /build.sh
#ADD start.sh /start.sh
#CD /var/lib/jenkins/workspace/WMSHomologacaoRelease/release/wms_cd/
#RUN qmake CONFIG+=release /gmcore_wms.pro
#RUN make

#CMD ["cp","start.sh release/"]

#CMD ["cd", "release/"]

#CMD ["bash", "start.sh"]
