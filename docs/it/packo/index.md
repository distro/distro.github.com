---
title: Packø Documentation
layout: documentation

lang: en
---

Packø
=====
packø e' un package manager ispirato da freeBSD e dal Portage di Gentoo, che ambisce
ad essere piu' flessibile e di semplice utilizzo.

Poi potrete iniziare a provare alcune cose.

    $ packo repository remote add https://github.com/distro/remotes/raw/master/official.yml
    $ packo repository add source/universe
    $ packo repository add binary/universe/linux/core2

Questo aggiunge due repositories e alcuni pacchetti.

    $ packo repository search "(library)"

Questo cerca tutti i pacchetti che hanno library come tag.

Per avere piu' informazioni riguardo ai pacchetti basta fare:

    $ packo repository info "(library)"


Questo dara' molte informazioni riguardo al pacchetto.

Potete anche fare il build dei pacchetti in file .pko.

    $ packo build package fluxbox

Questo effettuera' il build di fluxbox.

Per avere una lista delle variabili d'ambiente di packo basta scrivere:

    $ packo env show

Per installare un pacchetto:

    $ packo install package

Questo builda il pacchetto e lo installa, o scarica il binario installandolo.

Se hai un file packo in locale e' sufficiente scrivere:

    $ packo install package.pko

Come installare
---------------

Per installare packo basta clonare la repo, buildare il gem e installarlo.

    $ git clone git://github.com/distro/packo.git
    $ cd packo
    $ gem build *spec
    # gem install *gem

E poi installare l'adapter da utilizzare, per avere una lista di adapter basta fare:

    $ gem list --remote "dm-.*-adapter"

Poi modificare la variabile di environment `PACKO_DATABASE` e packo e' pronto all'utilizzo.

A questo punto e' necessario installare `sandbox` che e' sviluppato da Gentoo,
e `fakeroot` che e' sviluppato da Debian.

Problemi comuni
---------------

*   Se appare un grosso messaggio d'errore riguardo a  `sandbox` significa che ha provato ad accedere ad alcuni files a cui l'accesso non era previsto,
    cosi' sandbox ha killato il processo per evitare danni, se hai la sicurezza di voler accedere a quel file, configura
    `sandbox` per farlo. Leggi la documentation di `sandbox` per capire come.

*   Se non puoi installare `sandbox` e `fakeroot` puoi comunque usare packo, solamente non utilizzando la sintassi protetta (packo `<command>`) ma usando
    `packo-<command>` che e' la sintassi non protetta. Suggerisco di usare `sandbox` e `fakeroot` comunque, perche' i pacchetti potrebbero avere qualche errore, non si puo' mai sapere.

E' lentissimo :(
----------------

Attualmente non lo e', e' lento alla partenza perche' deve richiedere un sacco di roba e i modelli devono essere controllati alla richiesta,
quindi la maggior parte del tempo e' spesa qui. Probabilmente implementero' un server/client per rendere le cose piu' veloci.

L'installazione non e' lenta, sqlite e' lento al momento di cachare le info nel db, quindi scegli un altro adattatore per farlo piu' velocemente, ricorda
che sqlite e' veloce nella scelta, quindi la scelta dei pacchetti/files/altro sara' veloce, e gli aggiornamenti/installazioni saranno lenti,
scegli l'adapter che meglio soddisfa le tue esigenze.

_Ho lavorato duro per aumentare la velocita', quindi teoricamente ora e' molto piu' veloce nel data caching._
