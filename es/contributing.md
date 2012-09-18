---
title: Contribuir a Distrø
layout: documentation

lang: es
stub: true
---

Contribución
============
Quieres involucrarte en el desarrollo de Distrø pero no sabes de donde comenzar?

Bueno, hay algunas parte que realmente lo necesitan y que con el tiempo cambiarán, pero por ahora es solo el comienzo así que sigan la lectura

Comunicación
=============
La principal forma de comunicación es [IRC](#irc)

IRC
---
El channel es `#distro` en `irc.freenode.net`.

Github
------
Todo el código viene publicado en [github](http://github.com/distro), abran una issue si encuentran algo, nadie los va a morder:)

Documentación
==============
Una de las principales necesidades ahora es el de la documentación. Resulta seguramente feo hablar de documentación cuando no se sabe de donde comenzar, pero no teman! Joinen en  [IRC](#irc).

Para contribuir a la documentación tienen que forkar [esto](https://github.com/distro/distro.github.com),
hacer vuestras modificaciones y hacer una pull request, así las modificaciones vendrán vistas y muy probablemente aceptadas.

Escritura
---------
Si quieres puedes probar a entender como funciona packo, y escribir documentación a propósito, abriendo una issue o joinando en [IRC](#irc)

Traducciones
----------
Hay necesidad de traducciones, simplemente basta copiar la directory `en/docs` en `<yourlanguage>/docs`
y comenzar a traducir los contenidos, acordándose de mantener los nombres originales de los files, si no se joderà todo.

Ideas
====
Hay algunas ideas que querrías ver en una distribución, pero las otras están muy ocupadas y no te dan bola? Bueno, estamos buscando buenas ideas y mejorías a la vida informática, ven en [IRC](#irc) y haz una propuesta, estaremos felices de escucharla, y en caso de volverla realidad.

Programación
==============
Si tienes algunos conocimientos de programación (escribir ebuilds/PKGBUILD son conocimientos ;) puedes ser de gran ayuda.
Toda Distrø es Ruby, porque Ruby es 
**♥**{:style="color: red;"}.

Escritura de Rbuild
-------------------
Siendo un proyecto joven con un nuevo package manager significa que faltan muchos paquetes. Es verdaderamente facil escribir rbuilds, así que lee el [quickstart](/docs/packo/quickstart.html) y comienza a escribir rbuilds para tus paquetes preferidos.
Como siempre el coordinamiento es en [IRC](#irc) pero nos gustan (y queremos) las issues.

Para contribuir facilmente con las rbuilds tienen que forkar [esta](https://github.com/distro/source) repository
en github y trabajar sobre el branch multiverse.

Cuando empiezas a trabajar sobre una rbuild, abre una issue sobre esa repository asì todos pueden saber que las rbuilds están en estado de preparación y en que condición se encuentran.

Cuando terminaste tu rbuild, digerida (packo-build digest file.rbuild) (cada version tiene que venir digerida) manda una pull request, serà testada lo antes posible por un user de confianza.

Cuando una rbuild viene testada y es segura, funciona y no crea daños, verrà inserida en el branch universe.

Para volverce un user de confianza basta escribir algunas rbuild, contribuir bastanta y ser presente en IRC. Si no sos un pelotudo, seras un user de confianza :)

Escritura del package manager
-----------------------------
Si crees que al package manager falte algo o que pueda ser mejorado en la pagina [packø development](/docs/packo/development/index.html) ven en [IRC](#irc) para comenzar a contribuir al package manager.

<p><center>
  <img src="/images/uncle_ditto.jpg"/>
</center></p>
