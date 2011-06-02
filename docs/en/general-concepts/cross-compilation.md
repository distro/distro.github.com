---
title: Cross compilation
layout: documentation

lang: en
---

Cross compilation
=================
Cross compilation has to be easy as pie.

Being distro a programmer-friendly distribution it has to simplify package creation for different architectures and operating systems.

At the moment what I'm going towards is this:

    CROSS=1 LIBC=newlib ARCH=i686 KERNEL=windows packo build binutils

This would create binutils which targets 32 bit windows, removing CROSS would create a package that works on that system.

With that thing in mind we should be able to create packages for all the operating systems and archs we want to support.
