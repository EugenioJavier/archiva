FROM ubuntu:14.04
MAINTAINER Javier Cabezas y Eugenio González <eugeniofidel@gmail.com>

ENV VERSION 2.2.0

#
# instalamos java, descargamos el fichero de instalación de archiva, lo descomprimimos y lo ubicamos en la carpeta /opt
#
RUN sudo apt-get update \
	&& sudo apt-get -y install openjdk-7-jre-headless \
	&& sudo apt-get -y install wget \
	&& wget -c http://www.reverse.net/pub/apache//archiva/binaries/apache-archiva-$VERSION-bin.tar.gz \
	&& tar xfv apache-archiva-$VERSION-bin.tar.gz \
    && sudo mv apache-archiva-$VERSION-bin.tar.gz /opt/

#
# Nos colocamos en el directorio donde está el ejecutable que lanza archiva
#
WORKDIR [/opt/apache-archiva-$VERSION-bin.tar.gz/bin/]

#
# Iniciamos Achiva
#

CMD["archiva console"]

