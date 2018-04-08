FROM ubuntu

RUN apt-get update && \
    apt-get install tree sl sudo vim && \
    useradd user && \
    usermod -G sudo user

RUN echo root:root | /usr/sbin/chpasswd && \
    echo user:user | /usr/sbin/chpasswd

CMD ['/bin/bash']
