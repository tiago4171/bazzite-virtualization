#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this install extra packages to monitor hardware performance
rpm-ostree install tmux btop iotop sysstat

# Install @virtualization group of packages
rpm-ostree install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-manager virt-viewer virt-top

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable libvirtd.service
