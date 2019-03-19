FROM debian:jessie

LABEL maintainer="vicamo@gmail.com"

RUN apt-get update --quiet \
	&& apt-get install --quiet --no-install-recommends --yes \
		openssh-server \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir /var/run/sshd

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D", "-e"]
