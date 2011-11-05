---
title: Packø Documentation
layout: documentation

lang: en
---

Packø
=====
packø is a package manager inspired by FreeBSD ports and Gentoo Portage which aims
to be even more flexible and easy to work with.

How to install
--------------
To install packo just clone the repo, build the gem and install it.

    $ git clone git://github.com/distro/packo.git
    $ cd packo
    $ gem build *spec
    # gem install *gem

And then install the adapter you want to use, to get a list of adapters do

    $ gem list --remote "dm-.*-adapter"

Then modify the `PACKO_DATABASE` env variable and you're ready to use packo.

At this point you should install `sandbox` which is developed by Gentoo devs
and `fakeroot` which is developed by Debian devs.

How to setup
------------

    $ packo repository remote add https://github.com/distro/remotes/raw/master/official.yml
    $ packo repository add source/universe
    $ packo repository add binary/universe/linux/core2

This adds two repositories and gives you some packages.

How to use
----------

    $ packo repository search "(library)"

This searches all packages that have library as tag.

To get more informations about packages do

    $ packo repository info "(library)"

This will give a lot of information about the package.

You can also build packages into .pko files.

    $ packo build package fluxbox

This will build fluxbox.

To get a list of packø's environment variables just do:

    $ packo env show

To install a package just do:

    $ packo install package

It should build and install the package or download the binary package and install it.

If you have a local .pko file you can install it directly:

    $ packo install package.pko

Problems?
=========

Common problems
---------------
* If you get a huge error message about `sandbox` it means it tried to access some place it wasn't supposed
  to, so sandbox killed the process to prevent damages, if you're sure you wanted it to access that place configure
  `sandbox` to be able to do so. Read `sandbox`'s documentation to know how.

* If you can't install `sandbox` and `fakeroot` you can use packo anyway, just don't use the protected syntax (packo `<command>`) but use
  `packo-<command>` which is the unsecure way. I suggest getting `sandbox` and `fakeroot` anyway because packages could do something harmful by mistake or on purpose, you can never know.

It's slow as hell :(
--------------------
Actually it isn't, it's slow at starting because it has to require lot of stuff and the models have to be checked when required,
so majority of the time is spent there. I'll probably implement a server/client thingy to speed things up.

Installation isn't slow, sqlite is slow at changing data in the db (mainly related to deletetion), so choose another adapter
and you'll get it fast, remember that sqlite is fast at selecting, so searches of packages/files/whatever will be fast and
updates/installations will be slow, choose the adapter that better suits your needs.

_I've worked hard on improving speed so theoretically now it's a lot faster with all the data changing, as long as the 
adapter supports transactions._
