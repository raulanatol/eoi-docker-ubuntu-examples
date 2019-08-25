FROM ubuntu

RUN apt-get update && \
    apt-get install -y tree sl sudo vim && \
    useradd -m user && \
    usermod -G sudo user

RUN echo root:root | /usr/sbin/chpasswd && \
    echo user:user | /usr/sbin/chpasswd

CMD ['/bin/bash']
