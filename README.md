# ubuntu-python3-pygame

This is a Packer recipe for building an Ubuntu Linux VM that hosts a
Python3 and pygame development environment. It publishes the VM to
[Atlas](http://atlas.hashicorp.com) as a
[Vagrant](http://www.vagrantup.com) box called
`ods94065/ubuntu-python3-pygame`.

The development evironment is a Ubuntu build based on the Vagrant box
`boxcutter/ubuntu1404-desktop`. It contains Mercurial and Git source
control tools, as well as the standard Python3 installation. It also
has pygame and all of its dependencies installed.

Currently, only [VirtualBox](http://www.virtualbox.org) is targeted.


## Using the Vagrant box

You'll need VirtualBox and Vagrant installed; follow the links above
to do so.

### OS X

Launch a Terminal and make a new directory to hold your Vagrant
environment. `cd` to this directory and run:

    vagrant init

This creates a `Vagrantfile` for you to edit. Edit this file and
change this line:

    config.vm.box = "base"

to this:

    config.vm.box = "ods94065/ubuntu-python3-pygame"

You may want to tweak some other settings as well. In particular, I
like to mount a directory that I can use to share information between the
host OS and the VM, so I add this configuration:

    config.vm.synced_folder "data", "/vagrant_data"

Once you've saved the file and are back in the Terminal, if you added
the synced folder configuration, create the data directory:

    mkdir data

Then launch the VM:

    vagrant up

Your VM starts off with one user named `vagrant` with a password of
`vagrant`.


## Building the Vagrant box

You'll need gmake, as well as the following environment variable:

   - `ATLAS_TOKEN`: the Atlas API token suitable for deploying the box
     to Atlas. (If you're setting up your own, you may need to alter the
     `atlas_user` variable defined in `packer.json`.)

You'll also want to make sure that `BUILD_VERSION`, defined in the
Makefile, is incremented appropriately.

Then just do this:

    make
