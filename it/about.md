---
title: Informazioni Distrø
layout: default

lang: it
---

Distrø ha come obbiettivo quello di essere ** LA ** distribuzione.

Kernel agnostica, libc agnostica, compilatore agnostica.

I principali sistemi operativi interessati sono Linux, Windows e Mac OS.

Lo sviluppo sarà concentrato in un primo tempo sulla piattaforma Windows. (no efforts to make stuff work on Linux so it's implied).

Perchè Windows?
------------
La ragione è che ci sono numerose distribuzioni linux con ottimi package manager, mentre i proveri programmatori Windows sono lasciati a loro stessi con al massimo cygwin (utilizzabile dagli amministratori
di sistema), vista la situazione ho pensato che un package manager dovesse essere compatibile anche con Windows ed è per questo che abbiamo inziato da questa piattaforma.

Per farlo girare su Windows useremo cygwin, progetto davvero eccezionale, dando così tutta la potenza di packø anche agli utenti Windows.

Perché Mac OS?
-----------
Beh, come detto prima Linux già possiede dei package manager ben fatti, così preferisco come obbiettivo i sistemi che personalmente ne sono privati o che possiedono un sistema mal pensato (parere di meh).

I package manager che sono attualmente in circolazione per Mac OS mancano di flessibilità e spesso sono mal pensati, quindi credo che sarà una cosa buona anche per la soffisfazione dei macfags :)

Perché un'altra distro?
-------------------------
Perché non sono soddisfatto delle attuali distribuzioni, Gentoo in linea teorica è la perfezione, ma il suo difetto sta nell'implementazione pratica.

Stiamo usando prodotti che sono stati scritti 10/20 anni fa, che in questo periodo di tempo sono andati benissimo e hanno fatto realmente un qualcosa di importante e grande, ma oggi è necessario un qualcosa di nuovo e migliore.

Noi possiamo continuare a costruire un sistema layer su layer, ma in questo modo ci dimentichiamo del core che è realmente ciò che fa funzionare il tutto, quindi è meglio per me ripartire con le ultime tecnologie e i prodotti migliori che oggi ci possono essere offerti.

Così ho pensato di creare un qualcosa di realmente semplice da mantenere e sviluppare. Quindi usando il mio linguaggio di programmazione preferito, Ruby, ho iniziato a sviluppare Packø un package manager a mio parere davvero interessante.

Ed eccomi qui, solo davanti al codice, a costruire un qualcosa di utile prima di tutto a me stesso e poi a chi vorrà utilizzarlo.

Perché dovrei preoccuparmi di tutto questo?
-----------------------------
Non si dovrebbe, in realtà, utilizzate pure Ubuntu.
