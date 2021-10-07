FROM ubuntu

RUN apt update \
 && apt install -y --no-install-recommends\
      python3-dev \
      libssl-dev \
      libffi-dev \
      sudo \
      curl \
      python3 \
      python3-pip \
      build-essential \
 && useradd -m ctfd \
 && gpasswd -a ctfd sudo \
 && echo "%ctfd ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# ↑あまりいいとは思えないsolution

# root以外で実行する時もUSER rootの時にENV PATH通さないと動かなかった
ENV PATH $PATH:/home/ctfd/.local/bin

RUN mkdir -p /usr/local/ctfd \
 && chown ctfd:ctfd /usr/local/ctfd \
 && mkdir -p /etc/ctfd/ \
 && mkdir -p /var/lib/ctfd

USER ctfd

RUN curl -L https://github.com/CTFd/CTFd/archive/refs/tags/3.4.0.tar.gz \
  | tar zxv -C /usr/local/ctfd --strip-components 1 \
 && sudo ln -s /usr/bin/python3 /usr/bin/python \
 #&& mv /usr/local/ctfd/CTFd/ctfd.db    /var/lib/CTFd/ \
 && cd /usr/local/ctfd \
 && ./prepare.sh 

RUN sudo mv /usr/local/ctfd/CTFd/config.ini /etc/ctfd/config.ini \
 && sudo ln -s /var/lib/ctfd/ctfd.db /usr/local/ctfd/CTFd/ctfd.db \
 && sudo ln -s /etc/ctfd/config.ini /usr/local/ctfd/CTFd/config.ini \
 && sudo chown ctfd:ctfd /etc/ctfd \
 && sudo chown ctfd:ctfd /var/lib/ctfd 

RUN echo $PATH

WORKDIR /usr/local/ctfd

ENTRYPOINT ./docker-entrypoint.sh
