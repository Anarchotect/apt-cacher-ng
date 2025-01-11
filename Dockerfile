FROM debian:bookworm-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y install apt-cacher-ng

COPY acng.conf /etc/apt-cacher-ng/acng.conf
COPY remap /usr/bin/

RUN remap docker        'https://download.docker.com/linux/debian'
RUN remap gitlab        'https://packages.gitlab.com/gitlab/gitlab-ce/debian'
RUN remap gitlabrunner  'https://packages.gitlab.com/runner/gitlab-runner/debian'
RUN remap googlecloud   'https://packages.cloud.google.com/apt'
RUN remap terraform     'https://apt.releases.hashicorp.com'
RUN remap signal        'https://updates.signal.org/desktop/apt'
RUN remap slack         'https://packagecloud.io/slacktechnologies/slack/debian'
RUN remap sublime       'https://download.sublimetext.com'
RUN remap wine          'https://dl.winehq.org/wine-builds/debian'
RUN remap postgresql    'https://apt.postgresql.org/pub/repos/apt'
RUN remap pgadmin       'https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/bookworm'

EXPOSE 3142

COPY entrypoint /srv/
WORKDIR /srv/
ENTRYPOINT ["/srv/entrypoint"]
