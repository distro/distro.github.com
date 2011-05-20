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

So here's what I have in mind:

Long version of `/etc/init.d/lighttpd`:
{% highlight ruby %}
#! /usr/bin/packo-service

needs 'net'

start do
  CLI.warn 'lighttpd is already started' and next if started?

  daemon = Daemon.new('/usr/sbin/lighttpd') {|d|
    d.pid = config['pid'] || '/var/run/lighttpd.pid'
  }

  CLI.message 'Starting lighttpd...' do
    daemon.start('-f', config['configuration'] || '/etc/lighttpd/lighttpd.conf',
      save: false
    )  
  end
end

stop do
  CLI.warn 'lighttpd is already stopped' and next if stopped?

  daemon = Daemon.pid(config['pid'] || '/var/run/lighttpd.pid')
    
  CLI.message 'Stopping lighttpd...' do
    (daemon.stop || daemon.stop(force: true)) && OS::Process.kill('php-cgi', :KILL)
  end
end

status do
  daemon = Daemon.pid(config['pid'] || '/var/run/lighttpd.pid')

  if daemon
    puts "started"
  else
    puts "stopped"
  end
end
{% endhighlight %}

Shorthand version of `/etc/init.d/lighttpd`:
{% highlight ruby %}
#! /usr/bin/packo-service

needs 'net'

this.is name: 'lighttpd',
  command: "lighttpd -f '#{config['configuration'] || '/etc/lighttpd/lighttpd.conf'}'"

after :stop do
  OS::Process.kill('php-cgi', :KILL)
end
{% endhighlight %}

`/etc/conf.d/lighttpd`:
{% highlight yaml %}
configuration: /etc/lighttpd/lighttpd.conf
pid:           /var/run/lighttpd.pid
{% endhighlight %}

Making it clear for everyone, this doesn't mean you're forced to write your own init files in Ruby,
the init just uses the shebang for interpreting it, so you can use `/bin/sh` or whatever you want to,
the example above is just a proof that packo gives facilitations to write init files in Ruby.

In short, gonna support only sysvinit for now with Ruby init.d scripts and YAML conf.d configurations.
