FROM ruby:2.7.1

# Buster is EOL: point apt at archive.debian.org, drop dead nodesource (use distro nodejs)
RUN sed -i "s|deb.debian.org|archive.debian.org|g; s|security.debian.org|archive.debian.org|g; /buster-updates/d" /etc/apt/sources.list &&\
  apt-get -o Acquire::Check-Valid-Until=false update -qq &&\
  apt-get install -y build-essential libpq-dev nodejs &&\
  rm -rf /var/lib/apt/lists/* &&\
  useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app
USER app

COPY --chown=app:app Gemfile Gemfile.lock $HOME/wedding/
WORKDIR $HOME/wedding
RUN bundle

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

COPY --chown=app:app . $HOME/wedding/
