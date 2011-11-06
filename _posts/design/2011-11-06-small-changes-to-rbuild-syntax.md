---
title: Small changes to RBuild syntax
author: meh.

categories:
  - design

layout: post
---

So yeah, been a while since I last posted or worked on Distrø, but I started working on it again.

As first thing I fixed a bit the RBuild syntax and the database models to suck a bit less.

The only difference now in writing rbuilds is that you don't have to use `Package.define` but just
write it as you would.

Old syntax:
{% highlight ruby %}
Package.define('package') {
	tags 'foo', 'bar'

	...
}
{% endhighlight %}

New syntax:
{% highlight ruby %}
name 'package'
tags 'foo', 'bar'

...
{% endhighlight %}

Way better, isn't it?

