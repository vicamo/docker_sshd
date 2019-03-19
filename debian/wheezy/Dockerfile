FROM debian:wheezy

LABEL maintainer="vicamo@gmail.com"

RUN apt-get update --quiet \
	&& apt-get install --quiet --no-install-recommends --yes \
		openssh-server \
	&& rm -rf /var/lib/apt/lists/* \
	&& (echo 'root:root' | chpasswd) \
	&& sed --in-place --regexp-extended \
		-e 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' \
		-e 's/UsePAM yes/#UsePAM yes/g' \
		/etc/ssh/sshd_config \
	&& mkdir /var/run/sshd /root/.ssh

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
