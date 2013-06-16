This repository contains definitions and files necessary for recreating vagrant boxes suitable for running module tests with. If all you want to do is access some pre-built images, you can access to the produced vagrant boxes here:

<a href="http://puppet-vagrant-boxes.puppetlabs.com">http://puppet-vagrant-boxes.puppetlabs.com</a>

If you want to build non-hosted boxes, or contribute read on.

## Goals

This project hosts a series of Veewee definitions used to build the hosted boxes at: <a href="http://puppet-vagrant-boxes.puppetlabs.com">http://puppet-vagrant-boxes.puppetlabs.com</a>. In the future it will also host definitions we endorse as 'standard' but we are not allowed to host.

Ultimately we'd like to get to the point where we are hosting most OS/Distro revisions on our website, for the more popular Vagrant providers. Right now we only really have achieved this for Virtualbox and Fusion. In the future we'd like to support KVM, LXC and VSphere.

## Building The Boxes Yourself

These instructions only apply generally if you wish to build the box definitions from this project yourself manually. This could be because you want that level of assurance (ie. you don't trust our images), you might be building a box we are not allowed to host (which applies to proprietary non-OSS operating systems usually) or perhaps you are a developer on this project.

Ordinarily, you should prefer using the hosted variety by default.

### Environment setup

You'll need Ruby 1.9.3 and Bundler before you begin. You should also install a copy of Vagrant from the instructions provided here:

<http://downloads.vagrantup.com/>

Once you have vagrant installed, start by entering the directory where you have cloned this project:

    $ cd <path to repo>

*Optional* Create an RVM gemset:

    $ rvm --create --ruby-version use ruby-1.9.3@puppet-vagrant-boxes

Then install the bundle:

    $ bundle install

### Building a box

Pick a box to build:

    $ veewee vbox list

The build it:

    $ veewee vbox build centos-59-x64

At this point it will download necessary ISO's and start building a box.

Now validate the box:

    $ veewee vbox validate 'centos-58-x64'

And export the vm to a .box file:

    $ veewee basebox export 'centos-58-x64'

## Contributing to this Project as a community member

There are several ways someone might want to contribute, read the following before you do anything.

### We are not a set of custom Veewee templates

In most cases the common requirement is to include a new definition for an OS previously unsupported. Just remember the primary goal is to create boxes that have very little specialisation at this level, the standard veewee templates should be very rarely modified to keep it simple, and even then bug fix should always be feed back to upstream (ie. VeeWee). This holds for any bugs we find in the templates, and any new templates that are required. In short our goal here is not to fork VeeWee templates, but to provide a snapshot of the template at box build/publish time.

So in most cases, users should be focused on making sure their OS of choice is represented and working correctly in VeeWee. That is where most of the hard work is. Once this is done, the remaining work is around doing the build itself on the virtualisation platforms we support.

### So how do I get a new OS added?

So given this project is really relying on Veewee templates, if you want an OS added make sure Veewee supports it first - if it isn't supported, raise a patch against Veewee. The author is very welcome to contributors. Once this is done, the rest of the work is actually minimal - and if you like you don't even need to raise a patch, just raise a Github Issue here with the template name you are interested in and we'll add it when we can. As only Puppet Labs employees really have access to upload images, and we'll need to verify them anyway, its probably easier this way.

### But I really really want to provide a variation from the Veewee templates

Happy to discuss, raise a PR or issue :-).

### I have a definition I want to include, but its not an OS that can be hosted

In this case, raise a PR against the project. As long as the Veewee template matches the definition you have provided this is generally fine. This would generally apply to commercial non-OSS operating systems such as Solaris and Windows.

## Contributing/Building & Publishing as a PL Employee

So the process is still being refined, so bare with us.

### Adding a new definition

Get a list of available definitions:

    $ veewee vbox templates

Pick one, and define it using:

    $ veewee vbox define '<box_name>' '<template_name>'

Make sure <box_name> follows the convention:

    <osdistro>-<derivative>-<version>-<arch>-<virtual-type>-<variant>

* osdistro: for example: centos, ubuntu, windows
* derivative: (optiona) server, desktop
* version: 8, 2008, 1104
* arch: x64, i386
* virtual-type: vbox410, vmware50 (not sure quite how to differentiate these yet from fusion and other vmware products ...)
* variant (optional):
    * nocm: designates no configuration management tools were loaded

Examples:

    ubuntu-server-1104-x64-vbox410
    centos-58-i386-vbox410
    windows-2008r2-x64-vbox410
    debian-607-x64-vbox410-nocm

Naming caveats:

* The name becomes the hostname of the box ... so you have to be careful.
* Debian/Ubuntu doesn't like underscores in the name.
* A dot in the box name would create a subdomain, which is probably not desirable.

Once you've produced a new box you should modify html/index.html to add it so it can be accessed from the index on S3.

Finally, follow the next steps for building a box.

### Publishing to the website

Once you've built a box, you can upload the box located in the current directory (ie. `centos-58-x86_64.box`) to the S3 bucket `puppet-vagrant-boxes`, and if you modified the index.html, upload that as well. This is a CloudFront hosted service, so therefore all items are cached.

If the image is new, or you changed the name, also update the site http://vagrantbox.es/, you do this by raising a PR on the repository below:

<http://github.com/garethr/vagrantboxes-heroku>

### What, no automation?

We're working on it.
