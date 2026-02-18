### Introduction

Ce document regroupe l’analyse des standards identifiés comme
potentiellement adaptés pour la mise en œuvre, de la « traçabilité des
dispositifs médicaux implantables en établissement de santé » relative à
la [spécification fonctionnelle](specifications_fonctionnelles.html) :

- Le standard HL7 FHIR R4 (*Fast Healthcare Interoperability
  Resources*). Pour le besoin d’interopérabilité « Traçabilité des
  dispositifs médicaux implantables en établissement de santé », les
  ressources FHIR suivantes sont notamment analysées :

  - AdverseEvent

  - AuditEvent

  - Bundle

  - Communication

  - CommunicationRequest

  - EventDefinition

  - SearchParameter

- Les profils IHE ATNA, RESTful ATNA, mACM / ACM, PLT, SOLE ;

- Le standard DICOM ;

- Le standard GS1 ;

- Le standard Syslog.

L’analyse de ces standards ci-dessus n’est pas détaillée dans ce document car elle est disponible dans le document [« Etude Normes & Standards généricisation : gestion des traces »](N&S TDE). Pour rappel, cette étude Normes & Standards propose de se baser sur une version « générique » de la gestion des traces du profil ATNA.

<div class="figure">
    <img src="contexte.png" alt="contexte" title="contexte" style="width:100%;">
</div>

En complément de cette [étude](N&S TDE), le présent document comprend l’analyse des standards suivants, spécifiques au métier de la gestion des dispositifs médicaux :

- Profil IHE MEMDMC

- Profil IHE MEMLS

- Profil IHE PMDT

Après un rappel synthétique du contexte en section 2, une description de chaque standard est présentée.

Un tableau de synthèse reprend ces éléments afin d’en faciliter la comparaison ainsi qu’une analyse métier et technique sont fournis en section 4 et 5.

A noter que cette étude se base sur le document « Organismes et Standards » \[5\] qui présente une description des organismes
producteurs de standards ainsi que la manière dont ces standards sont gérés.

### Presentation synthetique

Cette étude s’insère dans le cadre du besoin d’interopérabilité « Traçabilité des Dispositifs Médicaux Implantables en Etablissement de Santé » (cf. [spécification fonctionnelle](specifications_fonctionnelles.html)).

Ce besoin d’interopérabilité concerne la mise en œuvre d’un mécanisme qui permet de gérer la traçabilité des dispositifs médicaux implantables (DMI) tout au long de leur cycle de vie :

- Commander un DMI

- Réceptionner un DMI

- Implanter un DMI

- Etc.

Cette gestion du cycle de vie des dispositifs médicaux implantables ne fait pas partie de cette étude normes et standards ; elle se limite à la gestion des traces produites lors de ce cycle de vie.

Il s’agit de fournir un mécanisme de création et de consultation des traces associées à un dispositif médical implantable de sa dispensation sà son implantation, en passant par sa commande, la réception dans la pharmacie d’un établissement de soin et son transfert dans l’unité de soin implantant ce dispositif. Les cas d’utilisation métier sont donc
(cf. [spécification fonctionnelle](specifications_fonctionnelles.html)) :

- Tracer (Créer des traces)

- Consulter une trace

- Rechercher des traces

Dans son processus de production des volets du CI-SIS, l’ANS a choisi de mutualiser certains « services » en les rendant « génériques ». C’est le cas de la gestion des traces.

Un volet générique « généricisation : gestion des traces » a donc été élaboré comprenant :

- Une étude métier

- Une étude normes et standards

- Une spécification technique

Ce document consiste donc à vérifier si ce volet générique est instanciable dans le cas de la traçabilité des dispositifs médicaux implantables en établissement de santé et s’il n’existe pas des normes et standards plus appropriés pour spécifier techniquement ce volet.

### Les standards

#### Le volet "Généricisation : gestion de traces"

##### Introduction

Les documents suivants spécifient fonctionnellement et techniquement le volet « généricisation : gestion des traces » :

- Etude métier

- Etude normes et standards

- Spécification technique

Ce volet spécifie quels sont les acteurs, les transactions et les flux à implémenter pour gérer des traces d’un point de vue « générique ».

L’étude métier « traçabilité des dispositifs médicaux implantables en établissement de santé’ » a identifié les besoins suivant de gestion des traces :

- Tracer (créer des traces)

<div class="figure" style="text-align: center;">
    <img src="creerTrace.png" alt="Créer des traces" title="Tracer" style="width:50%;">
</div>

- Rechercher des traces

<div class="figure" style="text-align: center;">
    <img src="rechercherTrace.png" alt="Rechercher des traces" title="Rechercher des traces" style="width:50%;">
</div>

- Consulter une trace

<div class="figure" style="text-align: center;">
    <img src="consulterTrace.png" alt="Consulter une trace" title="Consulter une trace" style="width:50%;">
</div>

En mappant les acteurs et les transactions sur le profil générique « généricisation : gestion des traces », nous pouvons en déduire que ce volet est « instanciable » dans le cas métier de gestion de la « traçabilité des dispositifs médicaux implantables en établissement de santé » :

<table style="width:100%;">
<colgroup>
<col style="width: 49%" />
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th>Volet « traçabilité des dispositifs médicaux implantables en établissement de santé »</th>
<th>Volet « généricisation : gestion des traces »</th>
</tr>
</thead>
<tbody>
<tr>
<td>Acteur « source de traçabilité »</td>
<td>Acteur « Event reporter »</td>
</tr>
<tr>
<td>Acteur « Gestionnaire de traçabilité »</td>
<td>Acteur « Event Repository »</td>
</tr>
<tr>
<td>Acteur « Consommateur »</td>
<td>Acteur « Event Consumer »</td>
</tr>
<tr>
<td>Flux 22 « Transmission trace »</td>
<td>Transaction ITI-20 : record audit trail event</td>
</tr>
<tr>
<td>Flux 23 « RechercheTraces »</td>
<td><p>Transaction ITI-81 : Retrieve ATNA Audit Event</p>
<p>Transaction ITI-82 : Retrieve Syslog Event</p></td>
</tr>
<tr>
<td>Flux 24 « ReponseRechercheTraces »</td>
<td><p>Transaction ITI-81 : Retrieve ATNA Audit Event</p>
<p>Transaction ITI-82 : Retrieve Syslog Event</p></td>
</tr>
<tr>
<td>Flux 25 « ConsulterTrace »</td>
<td><p>Transaction ITI-81 : Retrieve ATNA Audit Event</p>
<p>Transaction ITI-82 : Retrieve Syslog Event</p></td>
</tr>
<tr>
<td>Flux 26 « ReponseConsulterTrace »</td>
<td><p>Transaction ITI-81 : Retrieve ATNA Audit Event</p>
<p>Transaction ITI-82 : Retrieve Syslog Event</p></td>
</tr>
</tbody>
</table>

##### Spécification des flux à partir du volet "généricisation : gestion des traces"

###### Tracer

Ce scénario décrit la demande « Tracer » (Création d’une trace), à partir du volet générique.

1)  En utilisant Syslog

<div class="figure" style="text-align: center;">
    <img src="tracerSyslog.png" alt="Tracer Syslog" title="Tracer Syslog" style="width:50%;">
</div>

2)  En utilisant HL7 FHIR

Dans le cas de la transmission d’une seule trace

<div class="figure" style="text-align: center;">
    <img src="transmissionTrace.png" alt="Transmission trace" title="Transmission trace" style="width:50%;">
</div>

Dans le cas de la transmission de plusieurs traces

<div class="figure" style="text-align: center;">
    <img src="transmissionTraces.png" alt="Transmission traces" title="Transmission traces" style="width:50%;">
</div>

###### Rechercher des traces

Ce scénario décrit la demande « Rechercher des traces », à partir du volet générique.

1)  En utilisant Syslog

<div class="figure" style="text-align: center;">
    <img src="rechercheTraceSyslog.png" alt="Recherche trace syslog" title="Recherche trace syslog" style="width:50%;">
</div>

2)  En utilisant HL7 FHIR

<div class="figure" style="text-align: center;">
    <img src="rechercheTrace.png" alt="Recherche trace" title="Recherche trace" style="width:50%;">
</div>

###### Consulter une trace

Ce scénario décrit la demande « Consulter une trace », à partir du volet générique.

1)  En utilisant Syslog

<div class="figure" style="text-align: center;">
    <img src="consulterTraceSyslog.png" alt="Consulter trace syslog" title="Consulter trace syslog" style="width:50%;">
</div>

2)  En utilisant HL7 FHIR

<div class="figure" style="text-align: center;">
    <img src="consulterTraceFHIR.png" alt="Consulter trace" title="Consulter trace" style="width:50%;">
</div>

##### Conclusion

Le mapping des acteurs / transactions et la description des flux spécifiés montrent que la démarche de concrétisation du volet générique « généricisation des traces » dans le contexte métier « traçabilité des dispostifs médicaux implantables en établissement de santé » est appropriée. Ce volet peut donc être utilisé pour spécifier techniquement le volet « traçabilité des dispositifs médicaux implantables en établissement de santé ».

#### Le domaine Device

Le cadre technique IHE « Device » a pour objectif de spécifier des profils en lien direct avec la gestion des équipements mobiles (pacemaker, pompe à infusion, oxymètre de pouls, etc.).

Ces profils peuvent répondre à différents besoins : gestion, communication, monitoring, observation, etc. Ces différents profils peuvent émettre des traces. Par contre, à l’heure d’aujourd’hui, il n’existe pas de volet dédié à la gestion des traces de dispositifs médicaux implantables en établissement de santé.

#### Profil IHE MEMDMC

[IHE MEMDMC](https://wiki.ihe.net/index.php/MEM-DMC) : le profil MEMDMC – « Medical Equipment Management Device Management Communication » définit un profil de communication pour envoyer différentes informations sur un device (identification,
information sur la version du matériel, du logiciel et du device, statut batterie et alimentation) en l’absence de moyens d’observation patient, de gestion d’alertes ou de notifications d’événements.

MEMDMC définit deux acteurs : « DMIR - Device Management Information Reporter » et « DMIC – Device Management Information Consumer ». L’acteur DMIR peut aussi être un acteur dans différents profils et agir comme un acteur DEC DOR, ACM AR ou IPEC DOR. L’acteur DMIC peut être considéré comme un « CMMS – Computerized Maintenance Management System » ou un « CEMS - Clinical Equipment Management System » et il peut aussi être un acteur dans différents profils et agir comme un DEC DOC, ACM AM
ou IPEC DOC. MEMDMC spécifie une transaction « DMIO Device Management Information Observation – PCD-15 ». Cette transaction est spécifiée en HL7 et est déclenchée sur l’événement trigger « ORU^R01^ORU_R01 ». Le message HL7 correspondant est un message « Observation ».

Le profil MEMDMC se focalise sur l’envoi de données provenant du device, indépendamment du fait que ce device soit associé à un patient. Ces données sont nécessaires pour la gestion de l’équipement.

Ce profil est plutôt utilisé pour monitorer des informations provenant de l’équipement plutôt que de gérer des informations de traçabilité, notamment lors de la gestion du cycle de vie du device. Il n’est donc pas adapté pour adresser le besoin de gérer les traces des Dispositifs Médicaux Implantables.

#### Le profil MEMLS

[IHE MEMLS](https://wiki.ihe.net/index.php/MEM-LS): le profil MEMLS – « Medical Equipment Management Location Services » définit un profil de communication pour envoyer des informations de localisation d’équipements et de personnes en l’absence
d’observations patients, d’alertes ou de notifications d’événements.

MEMLS définit deux acteurs : « LOR – Location Observer Reporter » et « Location Observer Consumer ». L’acteur LOR peut être vu comme un service de localisation (« Location Services system »), en lien direct avec les systèmes de localisation sous-jacent (RFID – Radio Frequency Identification ou RTLS – Real Time Location Services). Il peut agir aussi comme un acteur DEC DOR, ACM AR ou IPEC DOR. L’acteur LOC peut être aussi acteur DEC DOC, ACM AM ou IPEC DOC. MEMLS spécifie une transaction « RLO Report Location Observation – PCD-16 ». Cette transaction est spécifiée en HL7 et est déclenchée sur l’événement trigger « ORU^R01^ORU_R01 ». Le message HL7 correspondant est un message « Observation ».

Le profil MEMLS se focalise sur l’envoi de données de localisation d’un équipement et/ou d’une personne.

Ce profil est plutôt utilisé pour envoyer des informations de localisation plutôt que de gérer des informations de traçabilité,
notamment lors de la gestion du cycle de vie du device. Il n’est donc pas adapté pour adresser le besoin de gérer les traces des Dispositifs Médicaux Implantables.

#### Le profil PMDT

[IHE PMDT](https://wiki.ihe.net/index.php/Point-of-Care_Medical_Device_Tracking_(PMDT)) : le profil PMDT – « Point of care Medical Device Tracking » définit un profil basé sur HL7 FHIR (STU3) pour collecter des informations provenant d’un dispositif médical en vue d’une utilisation ultérieure.

PMDT définit trois acteurs : «  Medical Device Reporter », « Medical Device Server » et « Medical Device Requester » et cinq transactions « Register Medical Device PCC-50 », « Start Point-of-care Device Procedure PCC-52 », « Complete Point-of-care Device Procedure PCC-53 », « Search Medical Device PCC-51 » et « Search Point-of-care Device Procedure PCC-54 ».

Ce profile PMDT se base sur les standards suivants :

- [Harmonization Pattern for UDI](http://wiki.hl7.org/images/2/24/Harmonization_Pattern_for_Unique_Device_Identifiers_20141113.pdf)

- [UDI Format by FDA-Accredited Issuing Agency Version 1.2](https://www.fda.gov/media/96648/download)

- Clinical terminology consistent with ONC Health IT certified EHR systems (LOINC, SNOMED-CT, RxNorm)

La transaction « Register Medical Device » est spécifiée par une requête « http PUT » de la ressource « Device ». Cette ressource doit inclure la ressource « Patient » pour identifier le patient associé à l’enregistrement au niveau de l’unité de soin.

La transaction « Search Medical Device » est spécifiée par une requête « http GET » de la ressource « Device ». La réponse est soit « vide », soit l’ensemble des devices qui répondent aux critères de recherche, sous forme de bundle.

La transaction « Start Point-of-care Device Procedure » est spécifiée par une requête « http PUT » de la ressource « Procedure ».

La transaction « Complete Point-of-care Device Procedure » est spécifiée par une requête « http PUT » pour la mise à jour de la ressource avec le statut « completed ». La ressource « Procedure » doit indiquer si c’est une procédure « opération », « monitoring » ou « traitement ».

La transaction « Search Point-of-care Device Procedure » est spécifiée par une requête « http GET » de la ressource « Procedure ». La réponse est soit une erreur http « bad request » soit l’ensemble des procédures qui répondent aux critères de recherche, sous forme de bundle.

En résumé, ce profil PMDT spécifie la création/modification/recherche de deux ressources :

- Device

- Procedure

Ce profil fait aussi référence à d’autres ressources :

- Patient : obligatoire

- Practionner : optionnel

- Organization : optionnel

Ce profil est plutôt utilisé pour enregistrer les actions réalisées lors de la gestion de dispositifs médicaux et non pas pour gérer les traces liées à ces actions. Néanmoins, les actions de gestion de traces peuvent être déclenchées par les différentes requêtes spécifiées dans ce profil et le « corps » (partie utile) de la trace peut être la ressource manipulée (« tracer la création d’un device », « tracer la création / modification d’une procédure », etc.).

### Comparaison des standards presentes

Les nouveaux profils analysés dans ce document n’apportant d’éléments permettant de les choisir pour répondre au besoin d’interopérabilité de « traçabilité des dispositifs médicaux implantables en établissement de santé », il n’est pas nécessaire de compléter la « comparaison des standards » par rapport à celle présente dans le chapitre 4 du document
 [« Etude Normes et Standards – généricisation : gestion des traces »](N&S TDE).

### Synthese et conclusion

Ce paragraphe présente la synthèse de l’étude normes et standards pour le volet « Traçabilité des dispositifs médicaux implantables en établissement de santé ».

#### Le volet "généricisation : gestion des traces"

La démarche de l’ANS de proposer un volet générique « généricisation : gestion des traces » avec la concrétisation lors de la prise en compte de besoins métier de traçabilité comme la traçabilité des dispositifs médicaux implantables est très pertinente et adaptée à cette étude normes et standards.

Il sera possible de spécifier techniquement le volet « traçabilité des dispositifs médicaux implantables en établissement de santé » de la façon suivante : pour chaque trace générée lors du cycle de vie du dispositif médical implantable, spécifier le format de la partie utile de la trace.

Par exemple, pour le flux métier « Flux 13a – TracabilitéRefusDMI », il faudra spécifier techniquement « les informations de traçabilité de refus de l’utilisation du DMI au bloc opératoire », i.e. ce qui est décrit dans le chapitre 6.22 du document [spécification fonctionnelle](specifications_fonctionnelles.html).

Détail du flux :

- la classe Evenement dont les attributs sont définis par :

  - typeEvenement correspondant au code 'NCO' ou 'PER' de la nomenclature TRE_254.

  - identifiantEvt correspond à la valeur d'identification du Flux 13.

  - dateOccurence correspond à la date/heure à laquelle le flux a été généré.

  - dateDeclaration correspond à la date/heure à laquelle le flux a été transmis.

  - source correspond au service utilisateur.

- la classe ActeurTrace dont les attributs sont définis par :

  - emetteur le service utilisateur.

  - récepteur le gestionnaire DMI.

- la classe TraceNonStructuree avec :

  - contenu porte les informations métiers du Flux 13 encodé en binaire.

- la classe TraceStructuree est formée par :

  - l'ensemble des classes correspondant au contenu structuré du Flux 13

#### Les profils IHE MEMDMC, MEMLS et PMDT

Ces trois profils sont orientés métier, dans la gestion des équipements médicaux ; ils peuvent générer des traces mais ils ne spécifient pas la gestion des traces à proprement parler. Ces profils pourront donc faire appel au volet « traçabilité des dispositifs médicaux implantables en établissement de santé ».

#### Conclusion

En conclusion, le volet générique « généricisation : gestion des traces » semble bien approprié pour permettre la spécification technique du volet « traçabilité des dispositifs médicaux implantables en établissement de santé ».
