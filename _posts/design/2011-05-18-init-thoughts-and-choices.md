---
title: "<code>init</code>: thoughts and choices"
author: meh.

categories:
  - design

layout: post
---

This is a really important choice to make, I sincerely don't like much sysvinit and the normal
procedure for services and such. Having *executables* in `/etc` is really really ugly.

So I've been looking around for some good alternatives, [runit](http://smarden.org/runit/) seemed
to be a possible choice, and I think someday it will be between the supported choices, but at this
point it would be too hard and useless to support it.

Being Distrø surrounded by Ruby I want init scripts to be written in Ruby as well. This may sound
like an ugly idea but I sincerely think that openrc is even more complex than going with Ruby.
All that ugly bash, bleah.

So here's what I have in mind, simple example, reduced:

`/etc/init.d/lighttpd`:
{% highlight ruby %}
#! /usr/bin/env ruby
require 'packo/service'

Packo::Service.define {
  needs 'net'

  start do
    CLI.message 'Starting lighttpd...' do 
      Daemon.new('/usr/sbin/lighttpd') {|d|
        d.pid = config['pid']
      }.start('-f', config['configuration'] || '/etc/lighttpd/lighttpd.conf',
        save: false
      )  
    end
  end

  stop do
    CLI.message 'Stopping lighttpd...' do
      Daemon.pid(config['pid']).stop && Daemon.kill('php-cgi', :KILL)
    end
  end
}
{% endhighlight %}

`/etc/conf.d/lighttpd`:
{% highlight yaml %}
configuration: /etc/lighttpd/lighttpd.conf
pid:           /var/run/lighttpd.pid
{% endhighlight %}

Somehow it's segfaulting when using the stop though, will investigate tomorrow and finish this blog post.

Sleep for now.
