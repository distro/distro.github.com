---
title: Packo VS The World
layout: documentation

lang: en
---

Packø VS The World
==================
This section covers the differences between packø and other package managers.

So /g/, yesterday the thread went well so I'm back looking for more brainstorming.

What is the best package manager and why? What would you like to see in a package manager, both from the user point of view and the developer's.

I'm writing a package manager so I'm looking for ways to improve it.

So far the features are:
- apt-like dependencies (suggested yesterday)
- USE-flag-like feature choosing (both for binary and source repositories)
- capability to build directly from source
- virtual repositories (automagically wraps cpan/gem/whatever to keep track of packages installed through those)
- (this one may not be liked here, but I sincerely find it useful) ruby build scripts (like ebuilds, but really really really a lot better)
- database for packages/repositories/whatever implemented through an ORM, which means you can use multiple database backends (the default is sqlite)
- packages divided by tags instead of categories, with obvious search by tags with boolean operators
- designed from the start with usage with multiple repositories in mind, so it's super easy to manage repositories
- automatically create a binary repository from a source repository (useful for usage in a network, you can tell the package manager what features/configuration to use to build the packages you need so you don't have an internet connection as requirement, or well, it's always useful to have the chance to create your own repositories)
- (again, i know this won't be liked, but meh) everything is written in Ruby and it's designed like a library (like portage or pacman) so it's easy to extend and hack on it (no, it's not slow, at least it's not slower than portage, with Rubinius it will be even faster)

Planned features:
- keep the system synced package and configuration wise by using, for example, a postgresql database to store data, and then just throw a --sync command and it will sync everything
- web interface to manage the local package manager or a bunch of machines at the same time


TL;DR: package managers, best/wanted features and reasons.

- [Apt](/en/docs/packo/versus/apt.html)
- [Entropy](/en/docs/packo/versus/entropy.html)
- [Nix](/en/docs/packo/versus/nix.html)
- [Pacman](/en/docs/packo/versus/pacman.html)
- [Paludis](/en/docs/packo/versus/paludis.html)
- [Portage](/en/docs/packo/versus/portage.html)
- [YUM](/en/docs/packo/versus/yum.html)
