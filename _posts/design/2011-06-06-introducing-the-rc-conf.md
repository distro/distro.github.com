---
title: Introducing the rc.conf
author: meh.

categories:
  - design

layout: post
---

One of the most important parts in a distribution is its configurability and it's ease of configuration.

In this subject [Arch Linux](http://archlinux.org) is, in my opinion, one of the best. The way they
unified all core configurations into the single `rc.conf` file is really elegant and simple, really
son of the KISS way.

Distrø aims to take the good parts out of everything, and in this way create something good.

Being as usual tied to Ruby, the configuration couldn't be anything but YAML, this is what I came out
with, **HIGHLY** _inspired_ by Arch's `rc.conf`.

{% highlight yaml %}
# /etc/rc.conf - Main Configuration for Distrø Linux
---

general:
  # available languages can be listed with the `local -a` command
  locale: en_US.UTF-8

  # set to "UTC" or "local", any other value will result in the hwclock untouched
  hwclock: local

  # timezones are found in /usr/share/zoneinfo
  timezone: Europe/Rome

  # keymaps are found in /usr/share/keymaps
  keymap: it

networking:
  # hostname of machine, should also be put in /etc/hosts
  hostname: distro

  # list of networks
  networks:
    # example for an automatic (dhcp) wired network
    # automatic:
    #   interface: eth0
    #   ip:        dhcp

    # example of a wireless network with static ip and routing
    # wireless:
    #   interface: wlan0
    #   ip:        192.168.0.2
    #   gateway:   192.168.0.1
    #   essid:     wireless
    #
    #   protection:
    #     type:       WPA2
    #     passphrase: 1234

system:
  devices:
    raid:  false # enables RAID
    btrfs: false # enables btrfs
    lvm:   false # enables LVM2

  # array of modules to load at boot, prefix with a - to blacklist
  modules: [-pcspkr]

  # prefix with a - to disable it
  # prefix with a @ to start it up in the background
  daemons: [syslog-ng, crond]
{% endhighlight %}

If you have any ideas related to this, don't hesitate to comment or come join us on
[IRC](/docs/en/contributing.html#irc).
