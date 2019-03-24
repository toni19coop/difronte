# dipersona
Dipersona è un progetto che mette in rete cooperative di comunità, cooperative sociali, provider di servizi alla persona e tecnologici per fornire ai beneficiari dei servizi di cura un sistema di comunicazione e check-in. Per più info: https://mdq.19.coop/di-persona/

## Il Progetto 
### beneficiari
Il servizio individua come primi beneficiari i grandi anziani, gli anziani soli, i disabili, che sono raggiunti con regolarità da un operatore peer che funge da antenna in relazione alle situazioni di vulnerabilità sociale ed interfaccia con i servizi; i secondi beneficiari sono neet, disoccupati, disabili lievi che trovano lavoro nel recupero di hw obsoleto per l’infrastrutturazione del sistema di contatto diretto con la prima categoria di beneficiari

- Servizi di videoconferenza per raggiungere in audio video le case dei beneficiari
- Ad orari concordati il pc di contatto si accende aprendo l’interfaccia all’utilizzo (bios configurato per accensione ad orario predeterminato usando la funzionalità rtc alarm)
- Il contatto è un anziano peer che conosce il beneficiario e svolge un ruolo da caregiver a distanza
- Eventualmente, vengono coinvolti servizi specialistici – direttamente dal beneficiario, o indirettamente dal social caregiver

### relazioni
La Cooperativa di Comunità attinge per i servizi professionalizzati da una o più Cooperative Sociali del territorio, che entrano come soci (è ammesso che personalità giuridiche facciano parte delle Coop di Comunità).

- La / le Coop Sociali con il loro intervento integrano l’azione dei Servizi Socio-assistenziali, che ne ricavano un risparmio, reimpiegabile sulle dotazioni di partenza del progetto
- I Servizi regolano l’azione di intervento della/e Coop Sociali
- La / le Coop Sociali, che hanno accesso a nuovi profitti nell’ambito della nuova porzione di mercato che si apre loro, restituiscono alla Coop di Comunità sotto forma di lavoro per i beneficiari delle azioni di recupero del HW obsoleto

### catena di valori ed economia circolare

Il progetto estrae valore economico per sostenersi nel tempo da due fonti:

1. la prima è quella derivante dal risparmio per il sistema dei servizi (sia sociali sia di infrastruttura digitale) 
2. la seconda è quella derivante dai profitti associati al recupero delle macchine obsolete 
3. la terza (stavamo scherzando!) è quella derivante dall’offerta di nuovi servizi specialistici 

Il recupero dei rifiuti informatici è insieme il punto di partenza di due percorsi: 
1. il primo porta alla realizzazione del hw necessario al sistema di videoconferenza 
2. il secondo invece porta alla creazione di lavoro per la produzione di hw ricondizionato per utilizzi diversificati 

## flusso ##
1. recupero harware "obsoleto" - laptop o desktop completi e funzionanti tra 5 e 10 anni di vita
2. ricondizionamento hardware recuperato - check hardware, manutenzione, riparazione, installazione: il vecchi terminali vengono installati dall'operatore (Lubuntu 18.04 LTS nei test - installazione minimale, in rete via Wi-Fi o ethernet)
3. configurazione e deploy terminali - il sistema di configurazione dei terminali è semi-automatizzato, può essere quindi portato a termine da un non-professionista formato
  - inserimento anagrafica terminale/utente sul gestore WP
  - copia e lancio script post-installazione
  - 
4. consegna terminali e formazione
5. comunicazioni sporadiche e periodiche tra beneficiari e caregiver

## tecnologie
 - https://lubuntu.me/ - distro di riferimento per l'installazione su hardware vecchio: leggera, performante, standard, facile da installare come qualsiasi ubuntu, altrettanto piena di driver e autoconfigurazioni audio-video
 - https://jitsi.org/ - set di tool per il videoconferencing basato su webrtc, installabile on premises https://jitsi.19.coop
 - https://www.wireguard.com/ - software VPN leggero, performante e adatto all'automazione
 - https://wordpress.org/ - gestore e monitor delle connessioni costruito su WP
 - https://www.gnu.org/software/bash/ - il sistema di configurazione post-installazione è allo stato attuale uno script in bash. Solido, antico, hacker.
