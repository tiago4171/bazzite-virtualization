#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this install extra packages to monitor hardware performance and @virtualization packages
rpm-ostree install \
  tmux \
  htop \
  btop \
  iotop \
  libvirt-daemon-config-network \
  libvirt-daemon-kvm \
  qemu-kvm \
  virt-manager \
  virt-viewer \
  virt-top && \
# Compositor and extras
rpm-ostree install \
  picom \
  papirus-icon-theme \
  sassc \
  adw-gtk3-theme \
  gtk-murrine-engine && \
  


#### Example for enabling a System Unit File
systemctl enable libvirtd.service
