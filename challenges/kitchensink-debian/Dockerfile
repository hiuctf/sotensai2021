FROM debian:11-slim

ENV PATH=$PATH:/usr/local/go/bin

RUN apt update \
 && apt install -y \
      software-properties-common \
      gnupg \
      build-essential \
      git \
      curl \
      wget

#RUN add-apt-repository -y ppa:longsleep/golang-backports
RUN apt update && apt install -y \
      # c/c++
      #build-essential \
      # ruby
      ruby \
      #autoconf \
      #bison \
      #libssl-dev \
      #libyaml-dev \
      #libreadline6-dev \
      #zlib1g-dev \
      #libncurses5-dev \
      #libffi-dev \
      #libgdbm6 \
      # or libbgdm5
      #libgdbm-dev \
      #libdb-dev \
      # python
      python2 \
      python3 \
      #libreadline-dev \
      #libncursesw5-dev \
      #libsqlite3-dev \
      #tk-dev \
      #libc6-dev \
      #libbz2-dev \
      #zlib1g-dev \
      # java
      default-jre \
      default-jdk \
      # nodejs
      nodejs \
      # rust
      # golang
 && curl -o - -sL https://golang.org/dl/go1.17.1.linux-amd64.tar.gz \
  | tar zxvf - -C /usr/local/
      

#RUN git clone https://github.com/rbenv/ruby-build.git \
# && PREFIX=/usr/local/ ./ruby-build/install.sh
#RUN ruby-build 3.0.2 /usr/local/ruby-3.0.2
#RUN ls /usr/local/ruby-3.0.2/bin
#RUN ln -s /usr/local/bin/ruby3 /usr/local/ruby-3.0.2/bin/ruby

RUN ruby --version

#RUN mkdir python397 && cd python397 \
# && curl -sL -o - https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tgz \
#  | tar xvzf - --strip-components 1 \
# && ./configure --enable-optimizations \
# && make \
# && make install

RUN python3.9 --version
RUN go version
