---
title: RBuild Development Quickstart
layout: documentation

lang: en
---

RBuild Development Quickstart
=============================
This page provides a very brief introduction to rbuild writing. It does not attempt to cover many of
the details or problems that will be encountered by developers — rather, it gives some trivial
examples which may be of use when trying to grasp the basic idea of how rbuilds work.

For proper coverage of all the ins and outs, see [Rbuild Writing](/docs/packo/rbuild-writing.html).
The [General Concepts](/docs/packo/general-concepts.html) chapter will also be of use. 

Note that the examples used here, whilst based upon real tree rbuilds, have had several parts chopped
out, changed and simplified.

First rbuild
============
We'll start with an rbuild for the Exuberant Ctags utility, a source code indexing tool.

ctags.rbuild:

{% highlight ruby %}
Package.define('ctags') {
  tags 'application', 'development', 'utility'

  description 'Exuberant ctags generates tags files for quick source navigation.'
  homepage    'http://ctags.sourceforge.net'
  license     'GPL-2'

  maintainer 'meh. <meh@paranoici.org>'

  source 'sourceforge://ctags/ctags/#{package.version}/ctags-#{package.version}'

  before :configure do |conf|
    conf.enable 'tmpdir', '/tmp'

    conf.disable ['etags']
    conf.with    ['posix-regex']
    conf.without ['readlib']
  end

  after :install do |conf|
    package.do.doc 'FAQ', 'NEWS', 'README'
    package.do.html 'EXTENDING.html', 'ctags.html'
  end
}
{% endhighlight %}

ctags-5.8.rbuild

{% highlight ruby %}
Package.define('ctags', '5.8') {
  arch     'x86', 'x86_64'
  kernel   'linux', 'windows'
  compiler 'gcc'
  libc     'glibc'
}
{% endhighlight %}

Basic format
------------
As you can see, rbuilds are just **Ruby** scripts that are executed withing packo's library.
It's suggested to know at least the basics of Ruby, if you don't know it this is a good chance
to learn something new.

Usually you have at least two rbuilds, one that's general (ctags.rbuild) and one for the version
(ctags-5.8.rbuild), the latter inherits all the stuff from the former, you could put everything in
the same rbuild, but with more versions you'd have tons of repeated stuff without a good reason.

Rbuilds are indented using **two spaces**. See [Rbuild file format](/docs/packo/rbuild-format.html).

From now on the version specific rbuild won't be added if there's no good reason, just remember
that a version specific rbuild is always there with definitions about what it is compatible with.

Information variables
---------------------
Next, there are a series of variables. These tell Packø various things about the rbuild and package
in question.

The `description` variable is set to a *short* description of the package and its purpose.

The `homepage` is a link to the package's homepage (remember to include the `http://` part).

The `license` is the license used by the package source, in this case it's `GPL-2`
 (the GNU General Public License version 2).

The `maintainer` variable tells who to talk with in case of bugs in the rbuild.

The `source` tells Packø the address to use for downloading the source. Here `sourceforge://` is a
special notation meaning "use the sourceforge fetcher", stuff between #{} will be interpolated
at the right time, so `#{package.version}` will become `5.8` when interpolated. Remember to not use
string that gets interpolated when defined, check a Ruby reference to know which ones get interpolated.

Callbacks
---------
Next, we register a callback to be called before `:configure`, Packø will call this callback before
executing the configure stage. The passed `conf` variable is a Configuration object defined by the
`Building::Autotools` module.

You can stop the whole callback dispatching by calling `throw :halt` in the callback, in this way you
can override the default configure execution with something different.

`./configure`, `make` and `make install` are called appropiately by the `Building::Autotools` module,
all you have to do is set what's need in the `conf` object and when needed it will be converted to
something readable by the `configure` script.

The `do.doc` and `do.html` are helper functions for installing files into the relevant part of
`/usr/share/doc`.

Rbuilds can use other modules and callbacks (see [Rbuild Modules](/docs/packo/rbuild-modules.html)).
In all cases, Packø provides a reasonable default implementation which quite often does the *right thing*.
The was no need to do weird stuff for `:unpack`, for example you may need to `cd` into the right directory
if the name of the directory inside the archive isn't called like the archive.

Rbuild with files
=================
Sometimes rbuilds need some files, may it be for configurations, init scripts or whatever.

Packø has two ways to store files, one is by adding a directory called data in the same directory of
the rbuild, the other way is to embed the files in the rbuild.

If the files are small, like patches or short configuration examples it's suggested to use the
embedding facilities rather than having a data directory floating around.

{% highlight ruby %}
Package.define('sandbox') {
  tags 'application', 'system'

  description "Gentoo's sandbox utility for more secure package building"
  homepage    'http://www.gentoo.org/'
  license     'GPL-2'

  maintainer 'meh. <meh@paranoici.org>'

  source 'http://dev.gentoo.org/~vapier/dist/sandbox-#{package.version}.tar.xz'

  after :install do
    File.write("#{package.distdir}/etc/sandbox.d/09sandbox", package.filesystem['files/sandbox'])
    File.write("#{package.distdir}/etc/sandbox.d/10packo", package.filesystem['files/packo'])
  end
}

__END__
$$$

$$$ files/sandbox $$$

CONFIG_PROTECT_MASK="/etc/sandbox.d"

$$$ files/packo $$$

SANDBOX_READ="/var/lib/packo"
SANDBOX_WRITE="/var/lib/packo"

SANDBOX_READ="${HOME}/.packo"
SANDBOX_WRITE="${HOME}/.packo"
{% endhighlight %}

As you can see we have the usual informational variables and then a callback that refers to a
package.filesystem variable.

This variable is an [FFFS::FileSystem](/docs/packo/reference/FFFS::FileSystem.html) object and you can access the
files by path.

Files are defined after the `__END__` part, it should be pretty obvious how to use this feature by
reading the example.

Rbuild with dependencies
========================
In the ctags example, we didn't tell Packø about any dependencies. As it happens, that's ok, because
ctags only needs a basic toolchain to compile and run. However, life is rarely that simple.

Here's `application/system/detox`:

{% highlight ruby %}
Package.define('detox') {
  tags 'application', 'system'

  description 'Safely remove spaces and strange characters from filenames'
  homepage    'http://detox.sourceforge.net/'
  license     'BSD'

  dependencies << 'development/library/popt' << 'system/development/flex!' << 'system/development/bison!'

  source 'sourceforge://detox/detox/#{package.version}/detox-#{package.version}'

  before :configure do |conf|
    conf.with ['popt']
  end

  after :install do |conf|
    package.do.rm '/etc/detoxrc.sample'
    package.do.doc 'README', 'CHANGES'
  end
}
{% endhighlight %}

Again, you can see the rbuild various informational variables.

Again, we hook to *configure* and *compile*.

The dependencies variable is how Packø determines which packages are needed to build and run the package.
Dependencies can be specified to be needed to *build*, during *runtime*, or *both*.
The default is both, to specify it as build put a `!` at the end and `!!` for runtime.

Rbuild with patches
===================
Often we need to apply patches. This can be done in two ways, by adding a patches directory (in data/
or embedded), these patches are used by the module [Building::Patch](/docs/packo/reference/Building::Patch.html)
appropriately.

{% highlight ruby %}
Package.define('detox') {
  tags 'application', 'system'

  description 'Safely remove spaces and strange characters from filenames'
  homepage    'http://detox.sourceforge.net/'
  license     'BSD'

  dependencies << 'development/library/popt' << 'system/development/flex!' << 'system/development/bison!'

  source 'sourceforge://detox/detox/#{package.version}/detox-#{package.version}'

  before :configure do |conf|
    conf.with ['popt']
  end

  after :install do |conf|
    package.do.rm '/etc/detoxrc.sample'
    package.do.doc 'README', 'CHANGES'
  end
}

__END__
$$$

$$$ patches/Makefile.patch $$$

https://sourceforge.net/tracker/index.php?func=detail&aid=2166388&group_id=101612&atid=630105

--- Makefile.in	2008-10-14 16:37:22 +0000
+++ Makefile.in	2008-10-14 16:38:17 +0000
@@ -70,10 +70,10 @@
 #

 detox: ${detoxOBJS}
-	${CC} -o detox ${detoxOBJS} ${L_OPT}
+	${CC} ${LDFLAGS} -o detox ${detoxOBJS} ${L_OPT}

 inline-detox: ${inline-detoxOBJS}
-	${CC} -o inline-detox ${inline-detoxOBJS} ${L_OPT}
+	${CC} ${LDFLAGS} -o inline-detox ${inline-detoxOBJS} ${L_OPT}

 #
 # Special Source Compiles

$$$ patches/Makefile.2.patch $$$

https://sourceforge.net/tracker/index.php?func=detail&aid=2166387&group_id=101612&atid=630105

--- Makefile.in	2008-10-14 16:39:34 +0000
+++ Makefile.in	2008-10-14 16:38:51 +0000
@@ -131,7 +131,7 @@
    ${INSTALL} -m 644 detox.1 ${DESTDIR}${mandir}/man1
    ${INSTALL} -m 644 detoxrc.5 detox.tbl.5 ${DESTDIR}${mandir}/man5

-install-safe-config:
+install-safe-config: install-base
    @if [ ! -f ${DESTDIR}${sysconfdir}/detoxrc ]; then \
        ${INSTALL} -m 644 detoxrc ${DESTDIR}${sysconfdir}; \
    else \
@@ -148,12 +148,12 @@
        echo "${DESTDIR}${datadir}/detox/unicode.tbl exists, skipping"; \
    fi

-install-unsafe-config:
+install-unsafe-config: install-base
    ${INSTALL} -m 644 detoxrc ${DESTDIR}${sysconfdir}
    ${INSTALL} -m 644 iso8859_1.tbl ${DESTDIR}${datadir}/detox
    ${INSTALL} -m 644 unicode.tbl ${DESTDIR}${datadir}/detox

-install-sample-config:
+install-sample-config: install-base
    ${INSTALL} -m 644 detoxrc ${DESTDIR}${sysconfdir}/detoxrc.sample
    ${INSTALL} -m 644 iso8859_1.tbl ${DESTDIR}${datadir}/detox/iso8859_1.tbl.sample
    ${INSTALL} -m 644 unicode.tbl ${DESTDIR}${datadir}/detox/unicode.tbl.sample
{% endhighlight %}

For bigger sets of patches it's suggested to use archives, see
[Building::Patch](/docs/packo/reference/Building::Patch.html) for more informations.

Rbuild with features
====================
Now for some `features`. Here's `application/mail/client/sylpheed`.

{% highlight ruby %}
Package.define('sylpheed') {
  tags 'application', 'mail', 'client'

  description 'A lightweight email client and newsreader'
  homepage    'http://sylpheed.sraoss.jp/'
  license     'GPL-2', 'LGPL-2.1'

  maintainer 'meh. <meh@paranoici.org>'

  dependencies << 'misc/mime-types' << 'misc/network/curl' << 'misc/x11/shared-mime-info'

  features {
    ipv6 {
      before :configure do |conf|
        conf.enable 'ipv6', enabled?
      end
    }

    ssl {
      before :configure do |conf|
        conf.enable 'ssl', enabled?
      end
    }

    crypt {
      before :dependecies do |deps|
        deps << 'application/crypt/gpgme'
      end

      before :configure do |conf|
        conf.enable 'gpgme', enabled?

        if disabled?
          Do.cp 'ac/missing/gpgme.m4', 'ac/'
        end
      end
    }

    ldap {
      before :configure do |conf|
        conf.enable 'ldap', enabled?
      end
    }

    nls

    pda {
      before :dependencies do |deps|
        deps << 'application/pda/jpilot'
      end

      before :configure do |conf|
        conf.enable 'jpilot', enabled?
      end
    }

    spell {
      before :dependencies do |deps|
        deps << 'application/text/gtkspell'
      end

      before :configure do |conf|
        conf.enable 'gtkspell', enabled?
      end
    }

    xface {
      before :dependencies do |deps|
        deps << 'library/media/compface!'
      end

      before :configure do |conf|
        conf.enable 'compface', enabled?
      end
    }
  }

  before :configure do |conf|
    autotools.autoreconf

    htmldir = Path.clean("/usr/share/doc/sylpheed-#{package.version}")

    conf.with 'manualdir', "#{htmldir}/manual"
    conf.with 'faqdir',    "#{htmldir}/faq"

    conf.disable 'updatecheck'
  end

  after :install do |conf|
    package.do.doc 'AUTHORS', 'ChangeLog*', 'NEWS*', 'README*', 'TODO*'
  end
}
{% endhighlight %}

As you can see features have their own block and they can hook to callbacks like out of a feature.

When in a feature block you have few helper methods to work with the feature, like enabling it by default
or knowing if it's enabled or disabled. More details [here](/docs/packo/reference/Feature.html).

`conf.enable` is used to enable or disable a feature, it will then be transormed into `--enable-something`
or `--disable-something` as per `./configure`. More details [here](/docs/packo/reference/Building::Autotools.html#Configuration).
