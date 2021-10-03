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

USER ctfd

RUN sudo mkdir -p /opt/CTFd \
 && sudo chown ctfd:ctfd CTFd \
 && curl -L https://github.com/CTFd/CTFd/archive/refs/tags/3.4.0.tar.gz \
  | tar zxv -C /opt/CTFd --strip-components 1 \
 && sudo ln -s /usr/bin/python3 /usr/bin/python \
 && cd /opt/CTFd \
 && ./prepare.sh 

RUN echo $PATH

WORKDIR /opt/CTFd

ENTRYPOINT ./docker-entrypoint.sh
