---
title: packø can build packages for Arch Linux's pacman
author: meh.

categories:
  - random

layout: post
---

Yep, it's still under testing/development, but it works, you can build packages with packø and then
install them through pacman.

In the last few days I improved a lot the packaging modules, which means soon you'll be able to
also create `.deb` and `.rpm` packages.

The dependency renaming can be done through distro transforms, transforms are a new feature in
packø that lets you execute external code on the `RBuild::Package`, in this case renaming
the packages to work with a distro's package system (to be compatible with dependency name and such).

This feature, and the opposite (install deb/rpm/pkg with packø) is one of the feature I wanted since
I stared writing packø. Installation still needs to be written, but at least this is a beginning.

To create a package for Arch Linux just pass the `-e pkg` options to `packo build package` and it
will create a package that works with pacman, if you also want to fix dependencies and such, clone
the [transforms repo](http://github.com/distro/transforms) and add `-t /path/to/the/arch/transform.rm`
to the build command.
