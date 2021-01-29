FROM debian:stable-slim
MAINTAINER stivw <869862584@qq.com>

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf	
COPY tt-cron /etc/cron.d/tt-cron

RUN apt update && \
    apt install	-y python3  python3-pip git tzdata cron vim supervisor rsyslog&& \
    git clone https://github.com/744287383/AutomationTTnode.git &&\
    pip3 install urllib3  &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    dpkg-reconfigure --frontend noninteractive tzdata &&\
    chmod 0644 /etc/cron.d/tt-cron &&\
    crontab /etc/cron.d/tt-cron &&\
    touch /var/log/cron.log 


CMD ["/usr/bin/supervisord"]


