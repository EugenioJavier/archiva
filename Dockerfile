FROM java:7u65

ENV VERSION 2.2.0


# Descarga de fihero de instalación, descompresión y ubicación, borrado de fichero de instalación instalación de mysql

RUN curl -sSLo /apache-archiva-$VERSION-bin.tar.gz http://archive.apache.org/dist/archiva/$VERSION/binaries/apache-archiva-$VERSION-bin.tar.gz \
  && tar --extract --ungzip --file apache-archiva-$VERSION-bin.tar.gz --directory / \
  && rm /apache-archiva-$VERSION-bin.tar.gz && mv /apache-archiva-$VERSION /opt/archiva \
  && curl -sSLo /opt/archiva/lib/mysql-connector-java-5.1.35.jar http://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar


ADD data_dirs.env /data_dirs.env
ADD init.bash /init.bash
ADD jetty_conf /jetty_conf

# Creación de usuario archiva y gestión de permisos
RUN useradd -d /opt/archiva/data -m archiva &&\
  cd /opt && chown -R archiva:archiva archiva &&\
  cd / && chown -R archiva:archiva /jetty_conf &&\
  chmod 755 /init.bash &&\
  sync && /init.bash &&\
  sync && rm /init.bash


ADD run.bash /run.bash
RUN chmod 755 /run.bash

# estableciendo usuario archiva
USER archiva

# un volumen para los datos
VOLUME ["/archiva-data"]

# exponemos los puertos habituales de archiva
EXPOSE 8080/tcp 8443/tcp

ENTRYPOINT ["/run.bash"]
