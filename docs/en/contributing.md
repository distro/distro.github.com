---
title: Contributing to Distrø
layout: documentation

lang: en
stub: true
---

Contributing
============
So you want to get involved in the development of Distrø but don't know from where to start?

Well, there are some places that need some love, with time they'll change, but for now it's just
at the beginning, so just keep reading.

Communication
=============
The main form of communication is on [IRC](#irc)

IRC
---
The main IRC channel is `##distro` on `irc.freenode.net`.

Github
------
All the coding happens on [github](http://github.com/distro), open an issue if you find anything,
you won't get biten :)

Documentation
=============
One of the main needs right now is documentation, sure sounds weird working on documentation
when you don't even know from where to start, but fear not! Just come hang out on [IRC](#irc).

To contribute to the documentation you should fork [this](https://github.com/distro/distro.github.com),
make your changes and open a pull request, then the changes can be reviewed and most probably merged.

Writing
-------
If you want you can start understanding how to use packo and write some documentation about it,
or howtos or whatever, just open an issue or come into [IRC](#irc)

Translating
-----------
Translations are needed, to do it simply copy the `docs/en` directory to `docs/<yourlanguage>`
and start translating the contents, remember to keep the file names the same or stuff will go deeply
wrong.

Ideas
=====
You've got some ideas that you'd like to see in a distribution but other distros are too busy
with other stuff to care about you? Well, we're looking for good ideas and improvements to the
computer life, come to [IRC](#irc) and propose what you have, we'll be glad to listen, and maybe
make it real.

Coding
======
If you've got some coding knowledge (writing ebuilds/PKGBUILD counts as coding knowledge ;) you
can be of huge help. All the stuff of Distrø is Ruby driven, because Ruby is
**♥**{:style="color: red;"}.

Rbuild writing
--------------
Being a young project with a new package manager this means tons of packages are missing,
it's really easy to write rbuils, so head to the [quickstart](/docs/packo/quickstart.html) and
start writing rbuilds for your favourite packages. As usual coordination on [IRC](#irc) or through
issues is advised (and wanted).

To easily contribute rbuilds you should fork [this](https://github.com/distro/source) repository
on github and work on the multiverse branch.

When you start working on an rbuild open an issue on that repository so everyone knows what rbuilds
are being worked on and in what state they are.

When you have done your rbuild, digested it (packo-build digest file.rbuild) (every version has to be
digested) send a pull request, it will be merged as soon as possible and checked by a trusted user.

When an rbuild is checked and made sure it's working and not dangerous it will be moved in the universe
branch.

To become a trusted user just write enough rbuilds, contribute enough and be present on IRC, if you
aren't a dick you will become trusted :)

Package manager writing
-----------------------
If you think the package manager misses a feature or a module head to the
[packø development](/docs/packo/development/index.html) page and come to [IRC](#irc) to start
contributing to the package manager.
