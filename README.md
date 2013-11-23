This repository contains definitions and files necessary for recreating the images hosted on:

<a href="http://puppet-vagrant-boxes.puppetlabs.com">http://puppet-vagrant-boxes.puppetlabs.com</a>

## Environment setup

Install a copy of Packer, at least 0.4.0.

## Adding a new template

Create a new directory under `templates` for your distro, and populate it with the necessary items for packer.

Make sure the folder name follows the convention:

    <osdistro>-<derivative>-<version>-<arch>-<virtual-type>-<variant>

* osdistro: for example: centos, ubuntu, windows
* derivative: (optional) 
    * for ubuntu: svr, dtop (used to be server, desktop)
* version: 8, 2008, 1104
* arch: x64, i386

Examples:

    ubuntu-svr-1104-x64
    centos-58-i386
    windows-2008r2-x64
    centos-64-x64

## Building a box

Finally, follow the next steps for building a box.

Pick a box to build:

    $ cd templates/freebsd-92-x64
    $ packer --only=virtualbox -force template.json

## Publishing to S3

Now upload the box located in the current directory (ie. `freebsd-92-x64.box`) to the S3 bucket `puppet-vagrant-boxes`, and if you modified the index.html, upload that as well.

Once you've produced a new box you should modify html/index.html to add it so it can be accessed from the index on S3.

## Publishing to vagrantbox.es

If the image is new, or you changed the name, also update the site http://vagrantbox.es/, you do this by raising a PR on the repository below:

<http://github.com/garethr/vagrantboxes-heroku>
