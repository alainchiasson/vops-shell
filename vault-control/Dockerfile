FROM almalinux:latest as almalinux-cache

RUN dnf install -y yum-utils

RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

FROM almalinux-cache

RUN dnf install -y jq vault python3 procps-ng ncurses
RUN python3 -m pip install yq

RUN setcap cap_ipc_lock= /usr/bin/vault

RUN version=$(curl -S "https://api.github.com/repos/FalcoSuessgott/vops/releases/latest" | jq -r '.tag_name[1:]') && \
    curl -OL "https://github.com/FalcoSuessgott/vops/releases/latest/download/vops_${version}_linux_amd64.rpm" && \
    dnf install -y vops_${version}_linux_amd64.rpm

WORKDIR /workdir

COPY vops.yaml .
COPY scripts /usr/local/bin

CMD [ "tail", "-f", "/dev/null"]