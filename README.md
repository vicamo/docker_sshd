# sshd

Dockerized SSH service, built on top of official [Ubuntu](https://registry.hub.docker.com/_/ubuntu/) and [Debian](https://registry.hub.docker.com/_/debian/) images.

## Image tags

- vicamo/sshd:precise
- vicamo/sshd:trusty
- vicamo/sshd:xenial
- vicamo/sshd:bionic
- vicamo/sshd:cosmic
- vicamo/sshd:disco
- vicamo/sshd:wheezy
- vicamo/sshd:jessie
- vicamo/sshd:stretch
- vicamo/sshd:buster
- vicamo/sshd:sid

## Installed packages

Base:

- Ubuntu
  - [Precise (12.04) minimal](http://packages.ubuntu.com/precise/ubuntu-minimal)
  - [Trusty (14.04) minimal](http://packages.ubuntu.com/trusty/ubuntu-minimal)
  - [Xenial (16.04) minimal](http://packages.ubuntu.com/xenial/ubuntu-minimal)
  - [Bionic (18.04) minimal](http://packages.ubuntu.com/bionic/ubuntu-minimal)
  - [Cosmic (18.10) minimal](http://packages.ubuntu.com/cosmic/ubuntu-minimal)
  - [Disco (19.04) minimal](http://packages.ubuntu.com/disco/ubuntu-minimal)
- Debian
  - [Wheezy (7)](https://packages.debian.org/wheezy/)
  - [Jessie (8)](https://packages.debian.org/jessie/)
  - [Stretch (9)](https://packages.debian.org/stretch/)
  - [Buster (10)](https://packages.debian.org/buster/)
  - [Sid](https://packages.debian.org/sid/)

Image specific:
- [openssh-server](https://help.ubuntu.com/community/SSH/OpenSSH/Configuring)

Config:

  - `UsePAM no`
  - exposed port 22
  - default command: `/usr/sbin/sshd -D -e`

## Run example

```bash
$ sudo docker run --detach --publish-all --name sshd vicamo/sshd:trusty
$ sudo docker logs sshd
Server listening on 0.0.0.0 port 22.
Server listening on :: port 22.
$ sudo docker port sshd 22
  0.0.0.0:49154

$ sudo docker exec --interactive --tty sshd adduser vicamo
Adding user `vicamo' ...
Adding new group `vicamo' (1000) ...
Adding new user `vicamo' (1000) with group `vicamo' ...
Creating home directory `/home/vicamo' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for vicamo
Enter the new value, or press ENTER for the default
        Full Name []:
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y

$ ssh vicamo@localhost -p 49154
vicamo@localhost's password:
vicamo@682308528aa1:~$
```

## Issues

If you run into any problems with this image, please check (and potentially file new) issues on the [vicamo/docker_sshd](https://github.com/vicamo/docker_sshd/issues) repo, which is the source for this image.
