---
title: Packages
layout: documentation

lang: en
stub: true
---

Packages
========
In Distrø packages have various variables, like `description`, `homepage`, `license` and such,
these variables are used by packo to help you find the packages you want to install.

Tags
----
Having tags instead of categories makes searching and definition a lot easier, just think about
the fact that for example, you can mask all packges made by GNU, and use in this way bsd alternatives
or something else.

You can apply various configuration to packages with certain tags, in this way configuration
becomes super easy.

Features
--------
Features are similiar to Gentoo USE flags, they specify (who would know) features for a package,
for example if a package can be installed with a gtk interface you can set the gtk feature (in
the environment or in your profile) and it will be installed with it.

Each package has a set of enableable features and packages can define what features can be enabled
at the same time to not get broken packages.

Flavor
------
The flavor of a package is somewhat similar to features, but it's a general change to the package,
for example there are some default flavors that can be set, `vanilla` means the package has no
additional patches and contains what it would contain with a standard installation, then you can
set `documentation` to enable the documentation, or it will be stripped from the package, same
goes for `headers`. Then there's the `debug` flavor that adds debug symbols to the package.

Every package can set different flavors, for example `rubinius-9999` has the flavor `hydra` which
uses the hydra branch instead of master.
