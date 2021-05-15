FROM ruby:3

# sqlite3
RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq --no-install-recommends install sqlite3=3.* && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	mkdir -p /root/db

# nodejs, yarn
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
  apt-get install -y nodejs && \
  npm install -g yarn

## Rails
ENV MAKE="make --jobs 8"
RUN gem install rails --version '~> 6.1'
