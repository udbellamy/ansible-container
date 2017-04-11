FROM docker.io/debian:stretch
RUN apt-get -y update
RUN apt-get install vim -y
RUN apt-get install -y python-yaml python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools python-pkg-resources git python-pip
RUN apt-get install -y python-requests
ENV ANSIBLE_HOST_KEY_CHECKING=False
RUN mkdir -p /root/.ssh
ADD id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN apt-get install -y ansible
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
WORKDIR /infra
