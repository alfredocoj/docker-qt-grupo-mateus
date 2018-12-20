FROM ubuntu:latest

### configuracoes padroes do mateus

# atualização dos indices dos pacotes
RUN apt-get update -y
# compiladores do c++
RUN apt install build-essential -y
# driver para conectar ao sql server, postgresql
RUN apt-get install -y unixodbc unixodbc-dev freetds-dev freetds-bin tdsodbc postgresql-server-dev-all
# (stack trace do compilador do c++)
RUN apt-get install -y libdw1 libdw-dev
# (biblioteca para exibição de gráficos opengl para o qtcreator funcionar a compilação)
RUN apt-get install -y libgl1-mesa-dev

# (atulização dos indices dos pacotes)
RUN apt-get update -y

# removendo OpenJDK
RUN apt-get purge openjdk*

# Install basic software support
RUN apt-get update && \
    apt-get install --yes software-properties-common

# Add the JDK 8 and accept licenses (mandatory)
RUN add-apt-repository ppa:webupd8team/java && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

# Install Java 8
RUN apt-get update && \
    apt-get --yes --no-install-recommends install oracle-java8-installer

ADD . /wms
WORKDIR /wms

RUN ./gmcorewmscd/start
