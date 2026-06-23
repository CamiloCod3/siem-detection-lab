# School Approval Request

Hej,

Vi vill bygga ett isolerat SIEM Detection Lab som skolprojekt.

Syftet Ã¤r att trÃ¤na pÃ¥ Windows Event Logs, Sysmon, SIEM-logginsamling, detection engineering, incidentanalys, SOC-arbetsflÃ¶den och sÃ¤ker dokumentation.

## Planerad miljÃ¶

- Windows Server
- Windows Client
- SIEM Server
- Linux/Kali testmaskin

## Isolering

Vi planerar att anvÃ¤nda:

- Separat virtuell switch utan fysisk uplink
- Inga bridged adapters
- Inga kopplingar till skolans produktionsnÃ¤t
- Privat IP-range, exempelvis 10.50.10.0/24
- Ingen scanning mot skolans system
- Endast simulerade och ofarliga tester
- Snapshots innan tester

## GitHub

Vi vill dokumentera projektet pÃ¥ GitHub som portfolio-projekt.

Vi kommer inte publicera interna IP-adresser, domÃ¤nnamn, konton, lÃ¶senord, tokens, rÃ¥a eventloggar eller kÃ¤nsliga screenshots.

## BegÃ¤ran

Vi Ã¶nskar godkÃ¤nnande innan vi skapar eller kÃ¶r labbet pÃ¥ skolservern.

Mvh,
[Era namn]
