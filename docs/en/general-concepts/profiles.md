---
title: Profiles
layout: documentation

lang: en
stub: true
---

Profiles
========
In Distrø and with packø configurations are handled by profiles, multiple profiles can be in use
at the same time.

A profile is nothing more than a directory with various files that packø reads and uses to set
itself up.

`config`
--------
The `config` file is a Ruby script, all the constants (the one that start with a capital letter) are
exported into the environment.

It's used to setup various things, like default `FEATURES`, `CFLAGS` and the like. The options set
in `config` can be overloaded by environment variables.

`packages`
----------
The `packages` file is basically the same as a `config` file, except its contents are applied only
to the packages that match the expression.

Example of `/etc/packo/packages`:
{% highlight ruby %}
! *-9999 # unmask all bleeding edge packages
MASK = false

! (ruby) # disable optimization for all Ruby packages
CFLAGS = "-O0"
{% endhighlight %}

`modules`
---------
`modules` is a directory which can contain scripts that are going to be loaded and evaluated in
the package instance context, you can theoretically do some stuff like that by accessing a variable
called `package` which contains the package instance in `packages` and `config`.

`features`
----------
`features` is a directory which contains default definitions for features, the files have to be named
ater the feature name they want to describe, this is useful to make some features default to adding
`description` and `dependencies`.
