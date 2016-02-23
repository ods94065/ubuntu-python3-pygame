BUILD_VERSION = 0.1

BASE_VAGRANT_VENDOR = boxcutter
BASE_VAGRANT_DISTRO = ubuntu1404-desktop
BASE_VAGRANT_VERSION = 2.0.14
BASE_VAGRANT_BOX_PATH = $(HOME)/.vagrant.d/boxes/$(BASE_VAGRANT_VENDOR)-VAGRANTSLASH-$(BASE_VAGRANT_DISTRO)/$(BASE_VAGRANT_VERSION)/virtualbox/box.ovf
BASE_VAGRANT_BOX_NAME = $(BASE_VAGRANT_VENDOR)/$(BASE_VAGRANT_DISTRO)

export BUILD_VERSION
export BASE_VAGRANT_BOX_PATH

.PHONY: all build

all: build

build:
	packer build packer.json
