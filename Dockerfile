FROM debian:bookworm-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y install apt-cacher-ng

RUN echo 'https://download.docker.com/linux/debian' > /etc/apt-cacher-ng/backends_docker
RUN echo 'Remap-docker: http://fake.docker.com ; file:backends_docker' >> /etc/apt-cacher-ng/acng.conf

RUN echo 'https://packages.gitlab.com/gitlab/gitlab-ce/debian' > /etc/apt-cacher-ng/backends_gitlab
RUN echo 'Remap-gitlab: http://fake.gitlab.com ; file:backends_gitlab' >> /etc/apt-cacher-ng/acng.conf

RUN echo 'https://packages.gitlab.com/runner/gitlab-runner/debian' > /etc/apt-cacher-ng/backends_gitlab-runner
RUN echo 'Remap-gitrun: http://fake.gitlab-runner.com ; file:backends_gitlab-runner' >> /etc/apt-cacher-ng/acng.conf

RUN echo 'https://packages.cloud.google.com/apt' > /etc/apt-cacher-ng/backends_google
RUN echo 'Remap-google: http://fake.googlecloud.com ; file:backends_google' >> /etc/apt-cacher-ng/acng.conf

RUN echo 'https://apt.releases.hashicorp.com' > /etc/apt-cacher-ng/backends_hashicorp
RUN echo 'Remap-hashi: http://fake.hashicorp.com ; file:backends_hashicorp' >> /etc/apt-cacher-ng/acng.conf

RUN echo 'https://updates.signal.org/desktop/apt' > /etc/apt-cacher-ng/backends_signal
RUN echo 'Remap-signal: http://fake.signal.com ; file:backends_signal' >> /etc/apt-cacher-ng/acng.conf

RUN echo 'https://packagecloud.io/slacktechnologies/slack/debian' > /etc/apt-cacher-ng/backends_slack
RUN echo 'Remap-slack: http://fake.slack.com ; file:backends_slack' >> /etc/apt-cacher-ng/acng.conf

RUN echo 'https://download.sublimetext.com' > /etc/apt-cacher-ng/backends_sublime
RUN echo 'Remap-sublime: http://fake.sublimetext.com ; file:backends_sublime' >> /etc/apt-cacher-ng/acng.conf

RUN echo 'https://dl.winehq.org/wine-builds/debian' > /etc/apt-cacher-ng/backends_wine
RUN echo 'Remap-wine: http://fake.wine.com/ ; file:backends_wine' >> /etc/apt-cacher-ng/acng.conf

RUN echo 'Port: 3142' >> /etc/apt-cacher-ng/acng.conf
RUN echo 'ForeGround: 1' >> /etc/apt-cacher-ng/acng.conf

EXPOSE 3142

ENTRYPOINT /usr/sbin/apt-cacher-ng -c /etc/apt-cacher-ng
