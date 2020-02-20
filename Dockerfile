# 루비 베이스 이미지
FROM gomicorp/rails:6.0.2.1


RUN yum install -y wget tar gzip gcc make && \
    wget https://www.sqlite.org/2019/sqlite-autoconf-3270100.tar.gz && \
    tar xvfz sqlite-autoconf-3270100.tar.gz && \
    cd sqlite-autoconf-3270100 && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    mv /usr/bin/sqlite3 /usr/bin/sqlite3_old && \
    ln -s /usr/local/bin/sqlite3 /usr/bin/sqlite3
#작업디렉토리 변경
WORKDIR /app

#gem 설치
COPY Gemfile ./
RUN bundle install && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
