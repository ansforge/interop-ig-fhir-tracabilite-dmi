### Construction des flux

La construction des flux se base sur le supplément RESTful ATNA. Cela
consiste en la construction de requêtes et de réponses HTTP de l’API
REST de FHIR.

<div class="figure">
    <img src="diagramme_sequence_flux.png" alt="Diagramme de séquence des flux" title="Diagramme de séquence des flux" style="width:100%;">
</div>

<p style="text-align: center;">
Diagramme de séquence des flux
</p>

A noter que si l’implémentation est basée sur le profil ATNA, la
construction des flux consiste en la construction des requêtes ou des
réponses syslog (pour la transmission de trace) et HTTP (pour la
consultation et la recherche de trace).

#### Flux de transmission des traces

Les flux transmettant les informations de traçabilité d’un évènement
sont les suivants :

- Flux 22 – TransmissionTrace 

- Flux 1c - TracabiliteDemande

- Flux 2a - TracabiliteReponse

- Flux 5 - TracabiliteLivraisonValide

- Flux 5a – TracabiliteLivraisonRejet

- Flux 5c – TracabiliteEntreeStockDMI

- Flux 5d – TracabiliteReceptionDMI 

- Flux 5e – TracabiliteRejetDMI 

- Flux 6a – TracabiliteSortieStock 

- Flux 7 – TracabiliteDelivranceSU 

- Flux 9 – TracabiliteTransportDMI 

- Flux 11 – TracabiliteEntreStock 

- Flux 12 – TracabiliteReceptionSU 

- Flux 13a – TracabiliteRefusDMI 

- Flux 14 – TracabiliteEchecPose 

- Flux 15 -TracabilitePose 

- Flux 16a – TracabiliteReassortDMI 

- Flux 18 – TracabiliteFacturationDMI 

- Flux 27 – TracabiliteCommande

- Flux 28 – TracabiliteRejetDMI

- Flux 30 - TracabiliteSortieStockSU

Ils sont construits selon les exigences de la transaction IHE ITI-20[^5]
« Record Audit Event » dans sa version HL7 FHIR où une seule trace est
transmise à la fois : « Send Audit Resource Request Message - FHIR Feed
Interaction ».

Ce flux se base sur l’interaction « create »[^6] de l’API REST de FHIR.
Il s’agit d’une requête HTTP POST dont le corps de la requête est une
ressource Bundle suivant le profil DMI_BundleTransmissionTraces :

<table style="width:100%;">
<colgroup>
<col style="width: 99%" />
</colgroup>
<thead>
<tr>
<th><p>POST [base]/Bundle</p>
<p>Où [base] est le point de contact FHIR défini par le Gestionnaire de
trace.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

Si la transaction a été correctement effectuée et donc que la création
du cercle de soins est correctement effectuée, un code HTTP 200 *ok* est
retourné[^7]. Un Bundle de type transaction-response doit être renvoyé
dans le corps de la réponse[^8]. Ce dernier doit contenir les ressources
telles qu’elles ont été créées par le gestionnaire ou, a minima, les
identifiants logiques des ressources ayant été attribués par le
gestionnaire (dans Bundle.entry.fullUrl et/ou Bundle.entry.resource.id).

Sinon, un code HTTP 500 *Internal Server Error* est retourné avec une
ressource OperationOutcome contenant le détail des erreurs et
avertissements résultant du traitement des entrées du Bundle.
