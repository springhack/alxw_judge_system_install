FROM ubuntu:16.04
COPY . /alxw_install
WORKDIR /alxw_install
RUN apt-get update -y
RUN apt-get install -y lsb-release sudo git python
RUN /bin/bash /alxw_install/Install.sh
CMD /bin/bash /alxw_install/Run.sh
EXPOSE 80
