---
title: Contribuire a Distrø
layout: documentation

lang: it
stub: true
---

Contribuzione
============
Vuoi essere coinvolto nello sviluppo di Distrø ma non sai da dove iniziare?

Beh, ci sono alcune parti che ne hanno realmente bisogno e che col tempo cambieranno, ma per ora e' solo l'inizio
quindi continuate la lettura.

Comunicazione
=============
La principale forma di comunicazione e'  [IRC](#irc)

IRC
---
Il channel e' `##distro` su `irc.freenode.net`.

Github
------
Tutto il codice appare su [github](http://github.com/distro), aprite un'issue se trovate qualcosa,
nessuno vi mordera' :)

Documentazione
==============
Uno dei principale bisogni ora e' quello di documentazione, suona sicuramente male parlare di documentazione
quando non si sa da dove partire, ma non temete! Joinate su  [IRC](#irc).

Per contribuire alla documentazione dovete forkare [questo](https://github.com/distro/distro.github.com),
fare i vostri cambiamenti e fare una pull request, cosi' i cambiamenti verranno visti e molto probabilmente accettati.

Scrittura
---------
Se vuoi puoi provare a capire come funzione packo, e scrivere della documentazione riguardo ad esso,
aprendo una issue o venendo su [IRC](#irc)

Traduzioni
----------
C'e' bisogno di traduzioni, semplicemente copiate la cartella `en/docs` in `<yourlanguage>/docs`
e iniziate a tradurre i contenuti, ricordate di mantenere i nomi dei file o andra' tutto a farsi fottere.

Idee
====
Hai alcune idee che vorresti vedere in una distribuzione, ma le altre sono troppo impegnate
con altre cose e se ne fregano di te? Beh, stiamo cercando buone idee e miglioramenti alla vita informatica,
vieni su [IRC](#irc) e fai una proposta, saremo felici di ascoltarla, e magari di renderla realta'.

Programmazione
==============
Se hai alcune conoscenze di programmazione (scrivere ebuilds/PKGBUILD sono conoscenze ;) puoi essere di grande aiuto.
Tutta Distrø e' Ruby, perche' Ruby e' 
**♥**{:style="color: red;"}.

Scrittura di Rbuild
-------------------
Essendo un giovane progetto con un nuovo package manager significa che mancano un sacco di pacchetti,
e' veramente facile scrivere rbuilds, quindi leggi il [quickstart](/docs/packo/quickstart.html) e inizia a scrivere rbuilds per i tuoi pacchetti preferiti.
Come al solito il coordinamento e' su [IRC](#irc) ma anche le issues sono gradite (e volute).

Per contribuire facilmente con le rbuilds, dovete forkare [questa](https://github.com/distro/source) repository
su github e lavorare sul multiverse branch.

Quando inizi a lavorare su una rbuild, apri una issue su quella repository cosi' tutti possono sapere che le rbuilds
sono in stato di lavorazione e in che stato si trovano.

Quando hai finito la tua rbuild, digerita (packo-build digest file.rbuild) (ogni versione deve essere digerita) 
manda una pull request, sara' testata il primo possibile da un user fidato.

Quando una rbuild e' testata e sicura, funziona e non e' dannosa, sara' inserita nello universe
branch.

Per diventare uno user fidato basta scrivere qualche rbuild, contribuire abbastanza ed essere presente su IRC, se non sei un coglione
sarai uno user fidato :)

Scrittura del package manager
-----------------------------
Se credi che il package manager manchi di qualcosa o possa essere migliorato nella pagina
[packø development](/docs/packo/development/index.html) vieni su [IRC](#irc) per iniziare a contribuire al package manager.

<p><center>
  <img src="/images/uncle_ditto.jpg"/>
</center></p>
