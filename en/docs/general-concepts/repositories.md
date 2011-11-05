---
title: Repositories
layout: documentation

lang: en
stub: true
---

Repositories
============
Distrø and packø are designed to easily support multiple repositories from different sources
and types.

All of this because I believe that everyone should be able to easily create alternatives and
completely different distributions from the same technology.

Obviously the choices of the package manager aren't changeable, which means you have to like Ruby
or deal with it.

There are three types of repositories, each one with their special capabilities.

Source repositories
-------------------
Source repositories are the base of Distrø and they're pretty similar to Gentoo trees.

When installing from a source repository the package gets compiled and transformed into an
installable package (usually a `.pko`).

The binary package is then installed like it was coming from a binary package.

Binary repositories
-------------------
Binary repositories get generated from source repositories and usually have only limited sets
of features/flavor and just a single version.

To install from a binary repository you have to specify the binary flavor or specify to install
a package from a specific repository.

Multiple binary repositories can easily co-exist if you specify as default `REPOSITORY` the
default binary repository you're using, for example if you use the stable core2 repository
you can add the unstable core2 repository and install only few selected packages from that
repository without moving everything to unstable when you update.

Virtual repositories
--------------------
A virtual repository is a Ruby script that states how to look for packages, dependencies and how to
install and uninstall a package.

Virtual repositories are really useful for wrapping other package managers to use by packo, for example
CPAN or gem, usually other package managers have to create by hand ebuilds/whatever for every wanted
gem, with packø you can simply add the virtual/gem repository and install packages through gem
transparently, dependencies and such are then coordinated by packø in an automagical way.

The official Distrø repositories
================================
Made clear that everyone can do their own repositories Distrø obviosly has some *official* repositories
which are developed and checked by trusted people and developers.

The binary repositories are based off the main source repository which has two branches.

The `universe` branch is the set of rbuilds checked by trusted users or developers.

The `multiverse` branch which keeps not yet checked rbuilds contributed by untrusted users.

The checks of `multiverse` packages are made as soon as possible, keep in mind that some packages
could be not accepted. Having a package rejected doesn't mean we hate you or anything, it's just
that maybe the project is dead or seen as useless by the trusted userbase. We'll be glad to help
you in creating your own repository and we'll happily link it in [this](/repositories.html) list.
