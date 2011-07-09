---
title: Documentaciòn Packø
layout: documentation

lang: es
---

Packø
=====
packø es un package manager inspirado por el freeBSD y el Portage de Gentoo, che tiene la ambición de ser mas flexible y de simple utilizo.

Después podrán empezar a probar algunas cosas.

    $ packo repository remote add https://github.com/distro/remotes/raw/master/official.yml
    $ packo repository add source/universe
    $ packo repository add binary/universe/linux/core2

Esto añade dos repositories y algunos paquetes.

    $ packo repository search "(library)"

Esto busca todos los paquetes que tienen library como tag.

Para tener mas información a propósito de los paquetes basta dar:

    $ packo repository info "(library)"


Esto dará muchas informaciones a propósito del paquete.

Pueden también hacer el build de paquetes en formato .pko.

    $ packo build package fluxbox

Esto efectuará el build de fluxbox.

Para tener una lista de las variables de ambiente de packo basta escribir:

    $ packo env show

Para instalar un paquete:

    $ packo install package

Esto builda el paquete y lo instala, o baja el binario instalándolo.

Si hay un file packo en local es suficiente escribir:

    $ packo install package.pko

Como instalar
---------------

Para instalar packo basta clonar el repo, buildar el gem e instalarlo.

    $ git clone git://github.com/distro/packo.git
    $ cd packo
    $ gem build *spec
    # gem install *gem

Y después instalar el adapter que se quiere utilizar. Para obtener una lista de adapter basta dar:

    $ gem list --remote "dm-.*-adapter"

Después modificar la variable de ambiente `PACKO_DATABASE` y packo está pronto para el utilizo.

A este punto es necesario instalar `sandbox` que es desarrollado por Gentoo, y `fakeroot` que es desarrollado por Debian.


Problemas comunes
---------------

*   Si aparece un grande mensaje de error a propósito de `sandbox` significa que provò ad acceder a algunos archivos a los cuales el acceso no era previsto,
    así sandbox killò el proceso para evitar daños, si tienes la seguridad de querer acceder a ese file, configurà
    `sandbox` para hacerlo. Lee la documentacion de `sandbox` para entender como.

*   Si no puedes instalar `sandbox` y `fakeroot` puedes lo mismo usar packo, solamente no usando la sintaxis protecta (packo `<command>`) si no usando
    `packo-<command>` que es la sintaxis no protecta. Sugiero de usar lo mismo `sandbox` y `fakeroot`, porque los paquetes podrían tener algún error, nunca se puede saber.

Es re lento :(
----------------

En realidad no lo es, es lento al comienzo porque tiene que pedir muchas cosas y los modelos tienen que ser controlados cuando pedido,
entonces la mayor parte del tiempo se pasa aquí. Probablemente voy a implementar un server/client para volver las cosas mas veloces.

La instalación no es lenta, sqlite es lento al momento de hacer el cache de las informaciones en el db. así que puedes elegir otro adaptador para hacerlo mas velozmente. Acordate que
sqlite es veloz en la selección, así que la selecciòn de los paquetes/archivos/otros será veloz, y los updates e instalaciones serán lentos,
elegí el adaptador que pueda satisfacer mas tus necesidades.

_Trabajé duramente para aumentar la velocidad, así que teóricamente ahora es mucho mas rápido en el data caching._
