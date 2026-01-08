# Specifications Techniques - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* **Specifications Techniques**

## Specifications Techniques

### INTRODUCTION

Ce document présente les spécifications techniques d’interopérabilité de mise en œuvre du volet « Traçabilité des Dispositifs Médicaux Implantables en Établissement de santé ».

Sa production est basée sur l’étude métier et l’étude des normes et standards de ce volet (**cf. [1] et** [2]).

Ce volet est une instance du volet générique [« Traçabilité d’événements »](https://esante.gouv.fr/volet-tracabilite-devenements) qui s’appuie sur le profil ATNA (Audit Trail and Node Authentication) et plus particulièrement le supplément RESTful ATNA[1](#fn:1) défini par IHE (Integrating the Healthcare Entreprise).

#### Lectorat cible

Ce document s’adresse aux maîtrises d’œuvre des systèmes d’information qui implémentent des fonctionnalités de traçabilité des Dispositifs Médicaux Implantables (DMI) en établissement de santé.

L’hypothèse est faite que le lecteur est familier au standard HL7 FHIR R4 et au profil IHE ATNA.

#### Standards utilisés

Ces spécifications techniques se basent sur le supplément RESTful ATNA qui vise à ajouter des interfaces HL7 FHIR R4 aux acteurs impliqués dans ce profil IHE.

Ces spécifications font ainsi référence à la ressource « AuditEvent » de FHIR et au profilage de cette ressource : TDE_AuditEvent ainsi qu’aux spécifications de l’API REST FHIR.

A noter qu’il est possible de se baser sur le profil ATNA qui utilise le protocole Syslog pour la transmission et une API HTTP REST pour la recherche et la consultation. Il est préconisé d’utiliser le message DICOM[2](#fn:2) « AuditMessage » pour véhiculer les messages de sécurité mais l’implémentation n’est pas limitée à ce seul format.

##### Ressources utilisées

La principale ressource HL7 FHIR utilisée et son niveau de maturité (NM) sont les suivants :

* AuditEvent (NM 3)

Diverses ressources sont référencées par la ressource AuditEvent afin de représenter le contenu véhiculé dans la trace :

* Practionner (NM 3),
* PractionnerRole (NM 2),
* Device (NM 2),
* Organization (NM 3),
* Patient (NM N),
* SupplyRequest (NM 1),
* DeviceRequest (NM 1),
* SupplyDelivery (NM 1),
* Procedure (NM 3),
* Invoice (NM 0),
* Bundle (NM N),
* Binary (NM N).

##### Profils utilisés

Le tableau ci-dessous liste les profils utilisés pour les ressources mentionnées dans ce document, y compris les profils définis spécifiquement pour le volet Traçabilité des Dispositifs Médicaux Implantables en Établissement de santé (préfixe DMI). Pour les ressources non mentionnées dans ce tableau, le profil à utiliser est celui défini par HL7 FHIR.

| | | | |
| :--- | :--- | :--- | :--- |
| AuditEvent | TDE_AuditEvent | 1.0 | Profil défini dans le volet générique « Traçabilité d’événements » |
| Patient | [DMI_Patient](https://simplifier.net/frenchprofiledfhirar/frpatient) | 1.0 | Profil créé dans le cadre de ce volet étendant le profil français « FrPatient » publié par Interop’Santé |
| Practitioner | DMI_Practitioner | 1.0 | Profil créé dans le cadre de ce volet étendant le profil « FrPractitionner» publié par Interop’Sante |
| PractitionerRole | [DMI_PractitionerRole](https://simplifier.net/modelisationdesstructuresetdesprofessionnels/practitionerroleprofessionalrolerass) | 1.0 | Profil créé dans le cadre de ce volet étendant le profil « PractitionnerRoleProfessionalRoleRASS » de l’annuaire national représentant un professionnel |
| Organization | DMI_Organization_EJ | 1.0 | Profil créé dans le cadre de ce volet étendant le profil « FrOrganization ». Ce profil est utilisé pour représenter le fabricant et les distributeurs des DM. |
| DMI_OrganizationInterne | 1.0 | Profil créé dans le cadre de ce volet permettant de représenter l’organisation interne (Service utilisateur). | |
| Device | DMI_Device | 1.0 | Profil créé dans le cadre de ce volet permet de représenter une instance physique d’un dispositif médical. |
| DeviceDefinition | DMI_DeviceDefinition | 1.0 | Profil créé dans le cadre de ce volet permet de représenter un modèle de dispositif médical. |
| SupplyRequest | DMI_SupplyRequestEnteteDemande | 1.0 | Profil créé dans le cadre de ce volet permet de transporter les informations général d’une demande de dispositif médical. |
| DMI_SupplyRequestEnteteCommande | 1.0 | Profil créé dans le cadre de ce volet permet transporter les informations générales d’une commande de dispositif médical. | |
| DMI_SupplyRequestEnteteReponse | 1.0 | Profil créé dans le cadre de ce volet permet de transporter les informations générales de la réponse à une demande de création ou de mise à jour de DMI. | |
| DeviceRequest | DMI_DeviceRequest | 1.0 | Profil créé dans le cadre de ce volet permettant d’effectuer une commande, demande, et la réponse à une demande de dispositif médical |
| SupplyDelivery | DMI_SupplyDeliveryEnteteLivraison | 1.0 | Profil créé dans le cadre de ce volet permet de représenter l’entête des informations de livraison de dispositifs médicaux. |
| DMI_SupplyDeliveryLigne | 1.0 | Profil créé dans le cadre de ce volet permet de représenter une ligne de livraison, de délivrance, de transport et de réception de dispositifs médicaux. | |
| DMI_SupplyDeliveryEnteteDelivrance | 1.0 | Profil créé dans le cadre de ce volet permet de représenter l’entête des informations de la délivrance de dispositifs médicaux. | |
| DMI_SupplyDeliveryTransport | 1.0 | Profil créé dans le cadre de ce volet permet de représenter les informations de transports des dispositifs médicaux. | |
| DMI_SupplyDeliveryEnteteReceptionDMI | 1.0 | Profil créé dans le cadre de ce volet permet de représenter l’entête des informations de réception des dispositifs médicaux. | |
| DMI_SupplyDeliveryReceptionUnitaire | 1.0 | Profil créé dans le cadre de ce volet permet de représenter les informations de réception d’un dispositif médical. | |
| Procedure | DMI_Procedure | 1.0 | Profil créé dans le cadre de ce volet permet représenter l’l’intervention clinique ou chirurgicale implantant un dispositif médical. |
| Invoice | DMI_Invoice | 1.0 | Profil créé dans le cadre de ce volet permet de représenter la facturation de dispositifs médicaux. |
| Bundle | DMI_BundleRequest | 1.0 | Profil créé dans le cadre de ce volet permet de transmettre au serveur l’ensemble des ressources permettant une commande, une demande et la réponse à la demande d’un DMI |
| DMI_BundleDelivery | 1.0 | Profil créé dans le cadre de ce volet permet de transmettre au serveur l’ensemble des ressources permettant la réception, la délivrance et la livraison d’un DMI | |
| DMI_BundleTransmissionTraces | 1.0 | Profil créé dans le cadre de ce volet permet de transmettre l’ensemble des ressources au serveur | |

#### Utilisation

Les spécifications d'interopérabilité présentées dans ce volet ne présagent pas des conditions de leur mise en œuvre dans le cadre d'un système d'information partagé. Il appartient à tout responsable de traitement de s'assurer que les services utilisant ces spécifications respectent les cadres et bonnes pratiques applicables à ce genre de service (ex : cadre juridique, bonnes pratiques de sécurité, ergonomie, accessibilité …). Il est à noter que les contraintes de sécurité concernant les flux échangés ne sont pas traitées dans ce document. Celles-ci sont du ressort de chaque responsable de l’implémentation du mécanisme qui est dans l’obligation de se conformer au cadre juridique en la matière. L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S[3](#fn:3)) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport[4](#fn:4) du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS).

1. **CONTENU STRUCTURE DES FLUX**

#### Correspondance entre objets métier et objets du standard HL7 FHIR

Dans cette section, une mise en correspondance est faite entre :

Les objets métier identifiés à l’issue de l’étude métier,

Les ressources et éléments, du standard HL7 FHIR,

Pour chaque objet métier, les tableaux ci-après reprennent l’ensemble des éléments métier identifiés dans l’étude métier du cas d’usage. Pour chaque attribut de chaque classe métier, la ressource FHIR et plus particulièrement l’élément de cette ressource sera identifié pour véhiculer l’information.

Ce travail concerne les flux structurés énumérés ci-dessous :

Flux 22 – TransmissionTrace : pour transmettre les informations de traçabilité d’un évènement.

Divers flux dérivent de ce flux général de transmission de traces :

Flux 1c - TracabiliteDemande: enregistrement de la demande ou de la suppression de la demande de DMI.

Flux 2a - TracabiliteReponse: Ce flux permet au service utilisateur d’avoir des informations sur le traitement de leur demande.

Flux 27 – TracabiliteCommande : enregistrement de la commande d’un DMI auprès du gestionnaire de traçabilité

Flux 5 - TracabiliteLivraisonValide: Ce flux permet au gestionnaire de réception de tracer la conformité de la totalité de la commande de DMI par rapport aux bons de livraison dans le gestionnaire de traçabilité.

Flux 5a – TracabiliteLivraisonRejet : Ce flux permet au gestionnaire de réception de tracer l'incohérence de la livraison avec les bons de réception des DMI dans le gestionnaire de traçabilité..

Flux 5c – TracabiliteEntreeStockDMI : Ce flux permet au gestionnaire de réception de tracer l'entrée au stock au sein de l'établissement du nouveau DMI dans le gestionnaire de traçabilité.

Flux 5d – TracabiliteReceptionDMI :Ce flux permet au gestionnaire de réception de tracer la réception du DMI au sein de l'établissement dans le gestionnaire de traçabilité.

Flux 5e – TracabiliteRejetDMI : Ce flux permet au gestionnaire de réception de tracer l'incohérence de la livraison avec les bons de réception des DMI dans le gestionnaire de traçabilité.

Flux 6a – TracabiliteSortieStock : Ce flux permet au gestionnaire de DMI de tracer la sortie du stock de la PUI du (des) DMI délivrés.

Flux 7 – TracabiliteDelivranceSU :Ce flux permet au service utilisateur de tracer la délivrance du (des) DMI au service utilisateur..

Flux 9 – TracabiliteTransportDMI : enregistrement du transport du (des) DMI délivrés au service utilisateur.

Flux 11 – TracabiliteEntreStock : enregistrement de l’entrée en stock du (des) DMI au sein du service utilisateur.

Flux 12 – TracabiliteReceptionSU : enregistrement de la réception du (des) DMI au sein du service utilisateur.

Flux 13a – TracabiliteRefusDMI : enregistrement du refus d’utiliser le DMI durant l’opération.

Flux 14 – TracabiliteEchecPose : enregistrement de l’échec de la pose du DMI durant l’opération.

Flux 15 -TracabilitePose : Ce flux permet au service utilisateur de tracer l'acte de pose du DMI chez le patient.

Flux 16a – TracabiliteReassortDMI : enregistrement du réassort en DMI.

Flux 18 – TracabiliteFacturationDMI : enregistrement du paiement de la facture du DMI.

Flux 28 – TracabiliteRejetDMI : Ce flux permet au gestionnaire de réception du service utilisateur de tracer la cause du rejet de la réception du DMI dans le gestionnaire de traçabilité.

Flux 30 – TracabiliteSortieStockSU : Ce flux permet au service utilisateur de tracer la sortie du stock du service utilisateur du (des) DMI. Flux 23 - RechercheTraces : pour la recherche de traces concernant un ou plusieurs évènements selon une liste de critères de recherche défini.

Flux 24 – ReponseRechercheTraces : pour obtenir le résultat de la recherche de traces.

Flux 25 – ConsulterTrace : pour la demande de consultation d’une trace d’un évènement en particulier.

Flux 26 – ReponseConsulterTrace : Ce flux porte les informations répondant à la requête du Flux 25.

##### Flux 22 : TransmissionTrace

Ce flux permet à la source de traçabilité de transmettre les informations de traçabilité du DMI pour un évènement au gestionnaire de traçabilité.

Il correspond au « Flux 1 -TransmissionTrace » du volet « Traçabilité des événements » avec la ressource profilée TDE_AuditEvent :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | identifiant [0..1] : Identifiant | AuditEvent | id [0..1] id |
| SourceTrace [1..1] | identifiant [0..1] : Identifiant | source[1..1].observer[1..1]. identifier [0..*] IdentifierReference (PractitionerRole|Practitioner| Organization|Device|Patient|RelatedPerson) | |
| Événement [1..1] | typeEvenement [0..1] Code | type [1..1] Coding**TRE R254-TypeEvenement** | |
| sousTypeEvenement [0..1] Code | subtype [0..1] Coding**N’est pas utilisé dans le context de ce volet.** | | |
| occurence [0..1] DateHeure | period[0..1].start [1..1] dateTime | | |
| declaration [0..1] DateHeure | recorded [1..1] instant | | |
| description [0..1] Texte | outcomeDesc [0..1] string | | |
| ActeurEvenement [0..2] | identifiant [1..1] Identifiant | agent[1..2].who[1..1].Reference (PractitionerRole|Practitioner|Organization| Device|Patient|RelatedPerson) | |
| role [1..1] Code | agent[1..2].role [0..*] CodeableConcept | | |
| ObjetEvenement [0..*] | type [0..1] Code | entity[0..*].type [0..1] Coding | |
| contenu [0..1] ObjetBinaire | entity[0..*].what [0..1] reference “Any”ou entity[0..*].detail [0..*] BackBoneElement | | |

Tableau 2 Mise en correspondance des contenus métiers/standard du flux 22

Le contenu de l’évènement (ObjetEvenement) varie en fonction du cas d’utilisation. Il sera détaillé dans les flux suivants.

Le contenu peut être structuré et ainsi transporter les classes des objets métiers. Le contenu peut aussi être non-structuré et ainsi transporter les informations métiers encodés en binaire.

Si possible il faut privilégier l’utilisation d’un contenu structuré.

##### Flux 1c – TracabiliteDemande

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1]**ObjetBinaire[1](#fn1) | entity[0..*].what [0..1] Reference (Bundle) | | |
| Demande [1..1] | EntêteDemande [1..1] | Bundle[2](#fn2) | Entry [0..*] BackboneElement |
| LigneDemande [1..*] | | | |
| EntêteDemande [1..1] | reference : [1..1] Identifiant | SupplyRequest[3](#fn3) | identifier [0..*] Identifier |
| natureDemande : [0..1] Texte | category [0..1] codeableConcept | | |
| quantiteTotale : [0..1] Numerique | quantity [1..1] Quantity | | |
| dateDem : [0..1] Date | authoredOn [0..1] dateTime | | |
| supprDemande : [0..1] boolean | status [0..1] code | | |
| motifSuppr : [0..1] Texte | text [0..1] Narrative | | |
| Type événement [0..1] : Code | Item [1..1].itemCodeableConcept CodeableConceptTRE_R254-TypeEvenement | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| Professionnel [1..1][4](#fn4) | Requester[0..1] Reference(Practitioner) | | |
| OrganisationInterne [1..1][5](#fn5) | deliverTo[0..1]Reference (Organization) | | |
| LigneDemande [1..*] | IdLigneAssocieeEntete [0..1] | DeviceRequest[6](#fn6) | groupIdentifier [0..1] Identifier |
| EnteteDemandeAssociee [1..1] | basedOn [0..1] Reference (SupplyRequest) | | |
| DispositifMedical [1..1][7](#fn7) | Subject [1..1] Reference ([Patient](http://hl7.org/fhir/patient.html)|[Group](http://hl7.org/fhir/group.html)|[Location](http://hl7.org/fhir/location.html)|[Device](http://hl7.org/fhir/device.html)) | | |
| TypeLigneDemande [1..1] | Intent [1..1] Code | | |
| dateUtilisation [0..1] Date | OccurenceDateTime [0..1] Date | | |
| Metadonne : [1..1] Metadonnee | meta [0..1] Meta | | |
| NomDispositifDemande [1..1] | code [1..1].codeCodeableConcept.textString | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1] :**ObjetBinaire[8](#fn8) | entity[0..*].detail [0..1].valueBase64Binary [1..1] base64Binary  | | |

-------

1. Le contenu de l’ObjetEvenement est une demande. Cet élément est décrit dans une partie spécifique « Demande ».[↩︎](#fnref1)
1. Suit le profil DMI_BundleRequest[↩︎](#fnref2)
1. Suit le profil DMI_SupplyRequestEnteteDemande[↩︎](#fnref3)
1. Le détail du professionnel est décrit dans une partie spécifique « [7.11 Professionnel ](#classe-dispositifmedical)».[↩︎](#fnref4)
1. Le détail de l’organisationInterne est décrit dans une partie spécifique « [7.5 OrganisationInterne ](#classe-dispositifmedical)» .[↩︎](#fnref5)
1. Pour chaque occurrence de l’élément LigneDemande on va créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest[↩︎](#fnref6)
1. Le détail du dispositif médical est décrit dans une partie spécifique « [7.1 DispositifMedical ](#classe-dispositifmedical)» .[↩︎](#fnref7)
1. Le contenu de l’ObjetEvenement est le contenu non structuré de la demande.[↩︎](#fnref8)

Tableau 3 : Mise en correspondance des contenus métiers/standard du flux 1c

##### Flux 2a - TracabilitéReponse

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1]**ObjetBinaire[1](#fn1) | entity[0..*].what [0..1] Reference (Bundle) | | |
| Reponse [1..1] | EntêteReponse [1..1] | Bundle[2](#fn2) | Entry [0..*] BackboneElement |
| DetailReponse [1..*] | | | |
| EntêteReponse [1..1] | reference : [1..1] Identifiant | SupplyRequest[3](#fn3) | identifier [0..*] Identifier |
| dateDem : [0..1] Date | authoredOn [0..1] dateTime | | |
| quantiteTotale : [0..1] Numerique | quantity [1..1] Quantity | | |
| infoCompl : [0..1] Texte | text [0..1] Narrative | | |
| TypeEvenement [1..1] Code | Item [1..1].itemCodeableConcept CodeableConceptTRE_R254-TypeEvenement | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| DetailReponse [1..*] | IdDetailReponseAssocieEnteteReponse [0..1] | DeviceRequest[4](#fn4) | groupIdentifier [0..1] Identifier |
| EntêteReponseAssociee [0..1] | basedOn [0..1] Reference (SupplyRequest) | | |
| NomDispostifDemande [1..1] | code [1..1].codeCodeableConcept.textString | | |
| TypeDetailReponse [1..1] | Intent [1..1] Code | | |
| dateDelivrance : [0..1] Date | occurenceDateTime [0..1] dateTime | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| DispositifMedical [1..1][5](#fn5) | Subject [1..1] Reference ([Patient](http://hl7.org/fhir/patient.html)|[Group](http://hl7.org/fhir/group.html)|[Location](http://hl7.org/fhir/location.html)|[Device](http://hl7.org/fhir/device.html)) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] ObjetBinaire**[6](#fn6) | entity[0..*].detail [0..1]. valueBase64Binary  [1..1] base64Binary  | | |

-------

1. Le contenu de l’ObjetEvenement est une « Reponse ». Cet élément est décrit dans une partie spécifique « Reponse ».[↩︎](#fnref1)
1. Suit le profil DMI_BundleRequest[↩︎](#fnref2)
1. Suit le profil DMI_SupplyRequestEnteteReponse[↩︎](#fnref3)
1. Pour chaque occurrence de l’élément DetailReponse on va créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest[↩︎](#fnref4)
1. La ligne est décrite dans une partie spécifique « [7.1 DispositifMedical ](#classe-dispositifmedical)» .[↩︎](#fnref5)
1. Le contenu de l’ObjetEvenement est le contenu non structuré de la « Reponse ».[↩︎](#fnref6)

Tableau 4 : Mise en correspondance des contenus métiers/standard du flux 2a

##### Flux 27 – TracabiliteCommande

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace », précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement, ObjetEvenement.

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] ObjetBinaire**[1](#fn1) | entity[0..*].what [0..1] Reference (Bundle) | | |
| Commande [1..1] | EntêteCommande [1..1] | Bundle[2](#fn2) | Entry [0..*] BackboneElement |
| Ligne [1..*] | | | |
| EntêteCommande [1..1] | refCommande : [1..1] Identifiant | SupplyRequest[3](#fn3) | identifier [0..*] Identifier |
| type : [0..1] Code | category [0..1] CodeableConcept | | |
| quantiteTotale : [0..1] Numerique | quantity [1..1] Quantity | | |
| date : [0..1] DateHeure | authoredOn [0..1] dateTime | | |
| TypeEvenement [1..1] Code | Item [1..1].itemCodeableConcept CodeableConceptTRE_R254-TypeEvenement | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| **OrganisationInterne [0..1]**[4](#fn4) | deliverTo[0..1] Reference(Organization) | | |
| **Professionnel [0..1]**[5](#fn5) | Requester[0..1] Reference(Practitioner) | | |
| LigneCommande [1..*] | IdLigneAssocieeEnteteCommande [0..1] | DeviceRequest[6](#fn6) | groupIdentifier [0..1] Identifier |
| EnteteCommandeAssociee [1..1] | basedOn [0..1] Reference (SupplyRequest) | | |
| DispositifMedical [1..1][7](#fn7) | Subject [1..1] Reference ([Patient](http://hl7.org/fhir/patient.html)|[Group](http://hl7.org/fhir/group.html)|[Location](http://hl7.org/fhir/location.html)|[Device](http://hl7.org/fhir/device.html)) | | |
| TypeLigneCommande [1..1 | Intent [1..1] Code | | |
| dateUtilisation : [0..1] Date | Occurrence [0..1].occurenceDateTime dateTime | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| DispostifCommande [1..1] | code[1..1].codeReference Reference(Device) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1]:**ObjetBinaire[8](#fn8) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] base64Binary | | |

-------

1. Le contenu de l’ObjetEvenement est une commande. Cet élément est décrit dans une partie spécifique « Commande ».[↩︎](#fnref1)
1. Suit le profil DMI_BundleRequest[↩︎](#fnref2)
1. Suit le profil DMI_SupplyRequestEnteteCommande[↩︎](#fnref3)
1. Le détail de l’organisation interne est décrit dans une partie spécifique « 7.5 OrganisationInterne ».[↩︎](#fnref4)
1. Le détail du professionnel est décrit dans une partie spécifique « [7.11 Professionnel ](#classe-dispositifmedical)».[↩︎](#fnref5)
1. Pour chaque occurrence de l’élément LigneCommande on va créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest[↩︎](#fnref6)
1. Le détail du dipositif médical est décrit dans une partie spécifique « [7.1 DispositifMedical ](#classe-dispositifmedical)».[↩︎](#fnref7)
1. Le contenu de l’ObjetEvenement est le contenu non structuré de la commande.[↩︎](#fnref8)

Tableau 5 : Mise en correspondance des contenus métiers/standard du flux 27

##### Flux 5 – TracabiliteLivraisonValide

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] Objet binaire**[1](#fn1) | entity[0..*].what [0..1] Reference (Bundle) | | |
| Livraison [1..1] | EnteteLivraison [1..1] | Bundle[2](#fn2) | Entry [0..*] BackboneElement |
| LigneLivraison [1..*] | | | |
| EnteteLivraison [1..1] | referenceCommande : [1..1] Identifiant | SupplyDelivery[3](#fn3) | basedOn [0..*] Reference (SupplyRequest) |
| quantiteTotale : [0..1] Numerique | suppliedItem[0..1].quantity [0..1] SimpleQuantity | | |
| dateLivraison : [1..1] DateHeure | occurrenceDateTime [0..1] dateTime | | |
| livraisonConforme : [0..1] boolean | status [0..1] code | | |
| motifRejet : [0..1] Texte | text [0..1] Narrative | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| **Professionnel [1..1]**[4](#fn4) | Receiver [0..*] Reference(Practitioner | PractitionerRole) | | |
| **OrganisationInterne [1..1]**[5](#fn5) | **Extension : DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)** | | |
| LigneLivraison [1..*] | ReferenceCommandeAssociee [1..1] | SupplyDelivery[6](#fn6) | basedOn[0..*] Reference (SupplyRequest) |
| ReferenceEntêteLivraison [1..1] | Part of [0..*] Reference (SupplyDelivery) | | |
| dateLivraison : [1..1] DateHeure | occurrenceDateTime [0..1] dateTime | | |
| livraisonConforme : [0..1] boolean | status [0..1] code | | |
| motifRejet : [0..1] Texte | text [0..1] Narrative | | |
| **DispositifMedical [1..*]**[7](#fn7) | suppliedItem[0..1].itemReference [0..1] Reference(Medication | Substance | Device) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : Objet binaire [0..1]**[8](#fn8) | entity[0..*].detail [0..1]. valuebase64Binary  | | |

-------

1. Le contenu de l’ObjetEvenement est une livraison. Cet élément est décrit dans une partie spécifique « Livraison ».[↩︎](#fnref1)
1. Suit le profil DMI_BundleDelivery[↩︎](#fnref2)
1. Suit le profil DMI_SupplyDeliveryEntêteLivraison[↩︎](#fnref3)
1. Le détail du professionnel est décrit dans une partie spécifique « [7.11 Professionnel ](#classe-dispositifmedical)».[↩︎](#fnref4)
1. Le détail de l’organisation interne est décrit dans une partie spécifique « 7.5 OrganisationInterne ».[↩︎](#fnref5)
1. Pour chaque occurrence de l’élément LigneLivraison on va créer une ressource SupplyDelivery suivant le profil DMI_SupplyDeliveryLigne[↩︎](#fnref6)
1. Le détail du dispositif médical est décrit dans une partie spécifique « 7.1 DispositifMedical ».[↩︎](#fnref7)
1. Le contenu de l’ObjetEvenement est le contenu non structuré de la « Livraison ».[↩︎](#fnref8)

Tableau 6 : Mise en correspondance des contenus métiers/standard du flux 5

##### Flux 5a - TracabiliteLivraisonRejet

Ce flux reprend les mêmes éléments que le flux 5 (cf Tableau 6).

##### Flux 5c – TracabiliteEntreeStockDMI

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1]ObjetBinaire**[1](#fn1) | entity[0..*].what [0..1] Reference (SupplyDelivery) | | |
| ReceptionUnitaire [1..1] | StatutReception [1..1] | SupplyDelivery[2](#fn2) | Cet élément est décrit dans une partie spécifique « StatutReception ». |
| **Professionnel [1..1]**[3](#fn3) | Receiver [0..*] Reference(Practitioner | PractitionerRole) | | |
| **OrganisationInterne [1..1]**[4](#fn4) | **Extension : DMI_ReferenceOrganisationInterne[1..1] Reference (Organization)** | | |
| **DispositifMedical [1..1]**[5](#fn5) | suppliedItem[0..1].itemReference [0..1] Reference(Medication | Substance | Device) | | |
| StatutReception [1..1] | receptionConforme : [1..1] boolean | statut [0..1] code | |
| motifRejet : [0..1] Texte | text [0..1] Narrative | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu: [0..1] ObjetBinaire**[6](#fn6) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |

-------

1. Le contenu de l’ObjetEvenement est l’ensemble des éléments Cet élément est décrit dans une partie spécifique « ReceptionUnitaire ».[↩︎](#fnref1)
1. Suit le profil DMI_SupplyDeliveryReceptionUnitaire[↩︎](#fnref2)
1. Le détail du professionnel est décrit dans une partie spécifique « [7.11 Professionnel ](#classe-dispositifmedical)».[↩︎](#fnref3)
1. Le détail de l’organisation interne est décrit dans une partie spécifique « 7.5 OrganisationInterne ».[↩︎](#fnref4)
1. Le détail du dispositif médical est décrit dans une partie spécifique « 7.1 DispositifMedical ».[↩︎](#fnref5)
1. Le contenu de l’ObjetEvenement est le contenu non structuré de la « ReceptionUnitaire ».[↩︎](#fnref6)

##### Flux 5d – TracabiliteReceptionDMI

Ce flux reprend les mêmes éléments que le flux 5c (cf 7Tableau 7).

##### Flux 5e – TracabiliteRejetDMI 

Ce flux reprend les mêmes éléments que le flux 5c (cf [Tableau 7](#_Flux_5c_–)).

##### Flux 6a – TracabiliteSortieStock 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] ObjetBinaire**[1](#fn1) | entity[0..*].what [0..1] Reference (Bundle) | | |
| Délivrance [1..1] | EntêteDelivrance [1..1] | Bundle[2](#fn2) | Entry [0..*] BackboneElement |
| LigneDelivrance [1..*] | Entry [0..*] BackboneElement | | |
| EntêteDelivrance [1..1] | referenceDelivrance : [1..1] Identifiant | SupplyDelivery[3](#fn3) | identifier [0..*] Identifier |
| dateDelivrance : [0..1] Date | occurrenceDateTime [0..1] dateTime | | |
| quantiteDelivree : [0..1] Numerique | suppliedItem[0..1].quantity [0..1] SimpleQuantity | | |
| informationComplementaire : [0..1] Texte | text [0..1] Narrative | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| OrganisationInterne [1..1][4](#fn4) | Extension : DMI_ReferenceOrganisationInterne[1..1]Reference (Organization) | | |
| LigneDelivrance [1..*] | Cet élément est décrit dans une partie spécifique « LigneDelivrance ». | | |
| LigneDelivrance [1..*] | ReferenceDemandeAssociee [1..1] | SupplyDelivery[5](#fn5) | basedOn[0..*] Reference (SupplyRequest) |
| ReferenceEntêteDelivrance [1..1] | Part of [0..*] Reference(SupplyDelivery) | | |
| dateDelivrance : [1..1] DateHeure | occurrenceDateTime [0..1] dateTime | | |
| informationComplementaire : [0..1] Texte | text [0..1] Narrative | | |
| **DispositifMedical [1..1]**[6](#fn6) | suppliedItem[0..1].itemReference [0..1] Reference(Medication | Substance | Device) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1]ObjetBinaire**[7](#fn7) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |

-------

1. Le contenu de l’ObjetEvenement est une délivrance. Cet élément est décrit dans une partie spécifique « Delivrance ».[↩︎](#fnref1)
1. Suit le profil DMI_BundleDelivery[↩︎](#fnref2)
1. Suit le profil DMI_SupplyDeliveryEnteteDelivrance[↩︎](#fnref3)
1. Le détail de l’organisation interne est décrit dans une partie spécifique « [7.5 OrganisationInterne ](#classe-dispositifmedical)».[↩︎](#fnref4)
1. Pour chaque occurrence de l’élément LigneDelivrance on va créer une ressource SupplyDelivery suivant le profil DMI_SupplyDeliveryLigne[↩︎](#fnref5)
1. Le détail du dispositif médical est décrit dans une partie spécifique « [7.1 DispositifMedical ](#classe-dispositifmedical)».[↩︎](#fnref6)
1. Le contenu de l’ObjetEvenement est le contenu non structuré de la délivrance.[↩︎](#fnref7)

Tableau 8 : Mise en correspondance des contenus métiers/standard du flux 6a

##### Flux 7 – TracabiliteDelivranceSU 

Ce flux reprend les mêmes éléments que le flux 6a (cf [Tableau 8](#flux-6a-tracabilitesortiestock)).

##### Flux 9 – TracabiliteTransportDMI 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1]ObjetBinaire**[1](#fn1) | entity[0..*].what [0..1] Reference (SupplyDelivery) | | |
| Transport [1..1] | referenceTransport : [1..1] Identifiant | SupplyDelivery[2](#fn2) | **Extension(Complex) : DMI_transport[0..1].refTransport [1..1] Identifier** |
| referenceDelivrance : [1..1] Identifiant | **Extension(Complex) : DMI_transport[0..1].refDelivery [1..1] Identifier** | | |
| dateDelivrance : [0..1] Date | occurence [0..1].occurenceDateTime dateTime | | |
| quantiteTransportee : [0..1] Numerique | suppliedItem [0..1].quantity SimpleQuantity | | |
| IncidentTransport : [0..1] boolean | **Extension(Complex) : DMI_transport[0..1].incident [0..1] code** | | |
| detailIncident : [0..1] Texte | **Extension(Complex) : DMI_transport[0..1].detailIncident [0..1] string** | | |
| informationComplementaire : [0..1] Texte | **Extension(Complex) : DMI_transport[0..1].text [0..1] string** | | |
| metadonnee : [1..1] Metadonnee | **Extension(Complex) : DMI_transport[0..1].meta [1..1] Meta** | | |
| Professionnel [1..1][3](#fn3) | Receiver [0..*] Reference (Practitionner, PractitionnerRole) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1] : Objet binaire**[4](#fn4) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |

-------

1. Le contenu de l’ObjetEvenement est un transport. Cet élément est décrit dans une partie spécifique « Transport ».[↩︎](#fnref1)
1. Suit le profil DMI_SupplyDeliveryTransport[↩︎](#fnref2)
1. Le détail du professionnel est décrit dans une partie spécifique « [7.11 Professionnel ](#classe-dispositifmedical)».[↩︎](#fnref3)
1. Le contenu de l’ObjetEvenement est le contenu non structuré du transport.[↩︎](#fnref4)

Tableau 9 : Mise en correspondance des contenus métiers/standard du flux 9

##### Flux 11 – TracabiliteEntreStock 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] Objet binaire**[1](#fn1) | entity[0..*].what [0..1] Reference (Bundle) | | |
| ReceptionDMI [1..1] | EntêteReceptionDMI [1..1] | Bundle[2](#fn2) | Entry [0..*] BackboneElement |
| LigneReceptionDMI [1..*] | Entry [0..*] BackboneElement | | |
| EntêteReceptionDMI [1..1] | referenceReception : [1..1] Identifiant | SupplyDelivery[3](#fn3) | identifier [0..*] Identifier |
| referenceDelivrance : [1..1] Identifiant | basedOn [0..1] Reference (SupplyDelivery) | | |
| quantiteReceptionnee : [0..1] Numerique | suppliedItem[0..1].quantity [0..1] SimpleQuantity | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| **OrganisationInterne [1..1]**[4](#fn4) | **Extension : DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)** | | |
| **Professionnel [1..1]**[5](#fn5) | receiver [0..*] Reference(Practitioner | PractitionerRole) | | |
| LigneReceptionDMI [1.*] | Cet élément est décrit dans une partie spécifique “LigneReceptionDMI” | | |
| LigneReceptionDMI [1..*] | ReferenceDemandeAssociee [1..1] | SupplyDelivery[6](#fn6) | basedOn[0..*] Reference (SupplyRequest) |
| ReferenceEntêteReceptionDMI [1..1] | Part of [0..*] Reference(SupplyDelivery) | | |
| dateReceptionSU [1..1] DateHeure | Occurrence [0..1].occurenceDateTime dateTime | | |
| receptionConforme : [1..1] boolean | Status [0..1] code | | |
| motifRejet : [0..1] Texte | text [0..1] Narrative | | |
| Metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| **DispositifMedical [1..1]**[7](#fn7) | suppliedItem[0..1].itemReference [0..1] Reference(Medication | Substance | Device) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu[0..1] Objet binaire**[8](#fn8) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |

-------

1. Le contenu de l’ObjetEvenement est la réception du DMI. Cet élément est décrit dans une partie spécifique « ReceptionDMI ».[↩︎](#fnref1)
1. Suit le profil DMI_BundleDelivery[↩︎](#fnref2)
1. Suit le profil DMI_SupplyDeliveryEntêteReceptionDMI[↩︎](#fnref3)
1. Le détail de l’organisation interne est décrit dans une partie spécifique « [7.5 OrganisationInterne ](#classe-dispositifmedical)».[↩︎](#fnref4)
1. Le détail du professionnel est décrit dans une partie spécifique « [7.11](#classe-dispositifmedical)Professionnel».[↩︎](#fnref5)
1. Pour chaque occurrence de l’élément LigneReceptionDMI on va créer une ressource SupplyDelivery suivant le profil DMI_SupplyDeliveryLigne[↩︎](#fnref6)
1. Le détail du dispositif médical est décrit dans une partie spécifique « [7.1 DispositifMedical ](#classe-dispositifmedical)».[↩︎](#fnref7)
1. Le contenu de l’ObjetEvenement est le contenu non structuré de la réception.[↩︎](#fnref8)

Tableau 10 : Mise en correspondance des contenus métiers/standard du flux 11

##### Flux 12 – TracabiliteReceptionSU 

Ce flux reprend les mêmes éléments que le flux 11 (cf Tableau 10).

##### Flux 28- TracabiliteRejetDMI

Ce flux reprend les mêmes éléments que le flux 11 (cf Tableau 10).

##### Flux 15 -TracabilitePose

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1]**ObjetBinaire[1](#fn1) | entity[0..*].what [0..1] Reference (Procedure) | | |
| InterventionMedicale [1..1] | idIntervention : [1..1] Identifiant | Procedure[2](#fn2) | identifier [0..*] Identifier |
| numSejour : [0..1] Identifiant | identifier [0..*] Identifier | | |
| typeIntervention : [0..1] Code | category [0..1] CodeableConcept | | |
| dateIntervention : [1..1] DateHeure | performedDateTime [0..1] dateTime | | |
| emplacementDMI : [1..1] Texte | bodySite [0..*] CodeableConcept | | |
| poseConforme : [1..1] Boolean | Complication [0..*] CodeableConcept | | |
| motifEchec : [0..1] Texte | | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| Professionnel : [1..1][3](#fn3) | performer[0..*].actor [1..1] Reference([Practitioner](https://hl7.org/FHIR/practitioner.html)|[PractitionerRole](https://hl7.org/FHIR/practitionerrole.html)) | | |
| OrganisationInterne : [1..1][4](#fn4) | performer [0..*].onBehalfOf Reference (Organization) | | |
| DispositifMedical : [1.1].[5](#fn5) | focalDevice[0..*].manipulated [1..1] Reference(Device) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] Objet binaire**[6](#fn6) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |

-------

1. Le contenu de l’ObjetEvenement est une intervention médicale. Cet élément est décrit dans une partie spécifique « InterventionMedicale ».[↩︎](#fnref1)
1. Pour l’élément InterventionMedicale on va créer une ressource Procedure suivant le profil DMI_Procedure[↩︎](#fnref2)
1. Le détail du professionnel est décrit dans une partie spécifique «7.11 Professionnel ».[↩︎](#fnref3)
1. Le détail de l’organisation interne est décrit dans une partie spécifique «7.5 OrganisationInterne ».[↩︎](#fnref4)
1. Le détail du dispositif médical est décrit dans une partie spécifique « 7.1 DispositifMedical».[↩︎](#fnref5)
1. Le contenu de l’ObjetEvenement est le contenu non structuré de l’intervention médicale.[↩︎](#fnref6)

##### Flux 13a – TracabiliteRefusDMI 

Ce flux reprend les mêmes éléments que le flux 15 (cf [Tableau 1](#flux-15--tracabilitepose)1).

##### Flux 30 – TracabiliteSortieStockSU

Ce flux reprend les mêmes éléments que le flux 15 (cf [Tableau 1](#flux-15--tracabilitepose)1).

##### Flux 14 – TracabiliteEchecPose 

Ce flux reprend les mêmes éléments que le flux 15 (cf [Tableau 1](#flux-15--tracabilitepose)1).

##### Flux 16a – TracabiliteReassortDMI 

Ce flux reprend les mêmes éléments que le flux 27 (cf Tableau 5).

##### Flux 18 – TracabiliteFacturationDMI 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau 2](#flux-22-transmissiontrace) | Cf[Tableau 2](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1]**ObjetBinaire[1](#fn1) | entity[0..*].what [0..1] Reference (Invoice) | | |
| Facture [1..1] | refFacture : [1..1] Identifiant | Invoice[2](#fn2) | identifier [0..*] Identifier |
| facture : [0..1] ObjetBinaire | **Extension : DMI_Facture [0..1] Reference (Binary)** | | |
| typeFacture : [0..1] Code | type [0..1] CodeableConcept | | |
| refCommande : [1..1] Identifiant | identifier [0..*] Identifier | | |
| dateEmission : [0..1] Date | date [0..1] dateTime | | |
| instructionPaiement : [0..1] Texte | paymentTerms [0..1] markdown | | |
| montantTotal : [0..1] Numerique | totalNet [0..1] Money | | |
| Devise [0..1] code | totalNet[0..1].currency [0..1] code | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| **Ligne : [1.*]**[3](#fn3)**.** | L’élément ligne est décrit dans une partie spécifique “Ligne” | | |
| Ligne [1..*] | dateAchat : [1..1] Date | Invoice | lineItem[0..*].chargeItemReference[1..1].occurenceDateTime[0..1] |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| DispositifMedical : [1..1][4](#fn4) | lineItem [0..*].chargeItem [1..1].chargeItem.productReference [0..1] | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] Objet binaire**[5](#fn5) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |

-------

1. Le contenu de l’ObjetEvenement est une facture. Cet élément est décrit dans une partie spécifique « Facture ».[↩︎](#fnref1)
1. Pour l’élémentFacture on va créer une ressource Invoice suivant le profil DMI_Invoice[↩︎](#fnref2)
1. Cet élément est décrit dans une partie spécifique « Ligne ».[↩︎](#fnref3)
1. Le détail du dispositif médical est décrit dans une partie spécifique « [7.1](#classe-dispositifmedical)DispositifMedical».[↩︎](#fnref4)
1. Le contenu de l’ObjetEvenement est le contenu non structuré de la facture.[↩︎](#fnref5)

##### Flux 23 - RechercheTraces

Ce flux intervient lorsque le consommateur effectue une recherche de traces d’un ou de plusieurs DMI se trouvant dans l’établissement de santé auprès du gestionnaire de traçabilité en précisant les critères de sa recherche.

Il correspond au « Flux 4 -RechercheTraces » du volet « Traçabilité des évènements ».

Ci-dessous les critères de recherches. Les critères apparaissant **en italique et en rouge** correspondent à des paramètres de recherche créés pour répondre au besoin :

| | | | |
| :--- | :--- | :--- | :--- |
| Ressource | Paramètre identifié dans le volet « Généricisation : Traçabilité des évènements  » | Paramètre supplémentaire identifié par ce volet | |
| Evenement/typeEvenement | AuditEvent | type : token |  |
| Evenement/declaration | date : date |  | |
| Evenement/sousTypeEvenement | subtype : token |  | |
| ActeurEvenement/identifiant | agent : reference |  | |
| agent-name : string |  | | |
| altId : token |  | | |
|  | patient : reference | | |
| ActeurEvenement/role | agent-role : token |  | |
| DispositifMedical/support/IUD-ID | Device |  | Device-udi-di : String |
| DispositifMedical/support/identifiantHRF |  | 
|
|
: String | |
| DispositifMedical/referenceFabricant |  | manufacturer: String | |
| DispositifMedical/support/IUD-IPNumLot |  | **DMI_Device_lotNumber : string** | |
| DispositifMedical/support/IUD-IPNumSerie |  | **DMI_Device_serialNumber : string** | |
| DispositifMedical/codeEMDN |  | **DMI_Device_definition-type : token** | |
| Patient/identite/matriculeINS | Patient |  | **DMI_Patient_INS : token** |

##### Flux 24 – ReponseRechercheTraces

Il s’agit du résultat de la recherche de traces retourné par le gestionnaire de traçabilté. La recherche de traces retourne une ressource Bundle de type SearchSet contenant les ressources AuditEvent correspondant aux critères de recherche fournis par le consommateur.

Il correspond au « Flux 5 -ReponseRechercheTraces » du volet « Traçabilité des évènements ».

##### Flux 25 – ConsulterTrace

Ce flux intervient lorsque le consommateur demande à consulter la trace d’un évènement auprès du gestionnaire de traçabilité.

Il correspond au « Flux 2 -ConsultationTrace » du volet « Traçabilité des évènements » :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace | identifiant [0..1] : Identifiant | AuditEvent | id [1..1] id |

Tableau 15 : Mise en correspondance des contenus métiers/standards du flux 25

##### Flux 26 – ReponseConsulterTrace

Il s’agit du résultat de la demande de consultation de la trace d’un évènement retourné par le gestionnaire de traçabilité. Le corps de la réponse est la ressource AuditEvent identifiée lors de la demande.

Il correspond au « Flux 3 - ReponseConsultationTrace » du volet « Traçabilité des évènements ».

### Contenu FHIR des flux structurés

Cette section décrit les ressources FHIR identifiées dans la section précédente et identifie les profils applicables.

Ressource « Audit Event » :

Les flux de traçabilité sont basés sur la ressource « AuditEvent » telle que spécifiée dans le volet « Traçabilité d’événements».

Cette ressource décrit les données liées à un évènement de sécurité ainsi que les données de traçabilité en vue de maintenir un référentiel de traces de sécurité.

Ressources représentant l’objet de l’évènement :

La ressource « AuditEvent » porte l’objet de l’évènement à travers l’élément « entity » qui peut faire référence à plusieurs ressources :

* Ressource « Patient »

La ressource Patient représente la personne prise en charge. Pour ce volet, le profil DMI_Patient étendant le profil FrPatient d’Interop’Santé doit être utilisé. Dans l’étude métier (annexe 1.12), seules les informations minimales d’identification et du patient sont mentionnées, cependant, les autres éléments de la ressource peuvent aussi être utilisés.

Profil DMI_Patient étendant le profil FrPatient vient modifier plusieurs attributs :

* Passer la cardinalité de « Identifier » à [1..*] pour véhiculer l’identité INS du patient
* Passer la cardinalité de « Telecom » à [1..*] et changer le binding de « telecom.system » vers la TRE_R200-CanalCommunication
* Modifier le binding de « Address.type » vers la [TRE_R35-TypeVoie](https://mos.esante.gouv.fr/NOS/TRE_R35-TypeVoie/TRE_R35-TypeVoie.pdf)
* Passer la cardinalité de « Meta » à [1..1]
* Ressource « Device» et « DeviceDefinition »


  Device décrit une instance physique de DM. Cette ressource porte des informations caractérisant cette instance particulière (numéro de lot, numéro de série, date d'expiration, etc.).


  DeviceDefinition décrit un modèle de DM. Cette ressource porte des informations plus générales partagées par l'ensemble des instances d'un même modèle (classe de risque, stérilité, etc.).


  La ressource Device peut référencer la ressource DeviceDefinition.


  Afin de répondre aux besoins non couverts dans la version R4 de FHIR, des évolutions sur ces deux ressources ont été discutées dans le cadre d'un groupe de travail piloté par Interop'Santé/PHAST/ANS. Ces évolutions ont été proposées à HL7 afin d'être intégrées dans la prochaine version de FHIR (R5). Il s'agit notamment de l'ajout d'un élément DeviceDefinition.classification ou encore de la modification de l'élément DeviceDefinition.property


  La ressource Device suit le profil DMI_Device dont le mapping est présenté en annexe 1.5

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Device | DMI_MarquageCE | Extension | [0..1] |  |  |
| DMI_IPIdLogiciel | Extension | [0..1] |  |  | |
| Identifier | Identifier | [0..*] |  |  | |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| Definition | Reference (DeviceDefinition) | [0..1] |  |  | |
| udiCarrier | BackboneElement | [0..*] |  |  | |
| udiCarrier | deviceIndentifier | String | [0..*] |  |  |
| carrierHRF | String | [0..1] |  |  | |
| carrierAIDC | Base64Binary | [0..1] |  |  | |
| entryType | Code | [0..1] |  |  | |
| Device | serialNumber | String | [0..1] |  |  |
| lotNumber | String | [0..1] |  |  | |
| Device | manufactureDate | dateTime | [0..1] |  |  |
| expirationDate | dateTime | [0..1] |  |  | |
| modelNumber | String | [0..1] |  |  | |
| partNumber | String | [0..1] |  |  | |
| Type | CodeableConcept | [0..1] |  |  | |
| Specialization | BackboneElement | [0..*] |  |  | |
| version | BackboneElement | [0..*] |  |  | |
| Property | BackboneElement | [0..*] |  |  | |
| Patient | Reference(Patient) | [0..1] | Cardinalité fixée à [1..1] dans le cas du flux 13 au flux 15 et le flux 30. |  | |
| Owner | Reference (Organization) | [0..1] |  |  | |
| Contact | ContactPoint | [0..*] |  |  | |
| Location | Reference (Location) | [0..1] |  |  | |
| url | url | [0..1] |  |  | |
| Note | Annotation | [0..*] |  |  | |
| Safety | CodeableConcept | [0..*] |  |  | |
| Parent | Reference (Device) | [0..1] |  |  | |

Extension DMI_MarquageCE :

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| libelleAutorisation | String | [1..1] |  |  |

Extension DMI_IPIdLogiciel :

| DMI_IPIdLogiciel | Value | String | [0..1] | | | |——————|——-|——–|———-|—–|—–|

La ressource DeviceDefinition suit le profil DMI_DeviceDefinition dont le mapping est présenté en annexe 1.10 :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| DeviceDefinition | DMI_ClasseRisque | Extension | [0..1] |  |  |
| DMI_ReferenceDistributeur | Extension | [0..1] |  |  | |
| DMI_CodeLPP | Extension | [0..1] |  |  | |
| DMI_CodeEMDN | Extension | [0..1] |  |  | |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| physicalCharacteristics | ProdCharacteristic | [0..1] |  |  | |
| physicalCharacteristics | DMI_InternalDiameter | Extension | [0..1] |  |  |

Extension DMI_ClasseRisque

| DMI_ClasseRisque | Value | Code | [0..1] | |——————|——-|——|———-|

Extension DMI_InternalDiameter

| DMI_InternalDiameter | Value | Quantity | [0..1] | |———————-|——-|———-|———-|

Extension DMI_ReferenceDistributeur

| DMI_ReferenceDistributeur | Value | Identifier | [0..1] | |—————————|——-|————|———-|

Extension DMI_CodeLPP

| DMI_CodeLPP | Value | Code | [0..1] | |————-|——-|——|———-|

Extension DMI_CodeEMDN

| DMI_CodeEMDN | Value | Code | [0..1] | |————–|——-|——|———-|

* Ressources « Practionner » et « PrationnerRole »

Les ressources Practitioner et PractitionerRole représentent respectivement le professionnel et sa situation
 d’exercice professionnel au sein d’un établissement.

Dans le cadre de l’annuaire national, l’ANS met à disposition un service de publication au format FHIR. Ce volet utilise les profils DMI_Practitioner et DMI_PractitionerRole étendant respectivement les profils [FrPractitioner](https://simplifier.net/modelisationdesstructuresetdesprofessionnels/practitionerrass) d’InteropSanté et[PractitionerRoleProfessionalRoleRASS](https://simplifier.net/modelisationdesstructuresetdesprofessionnels/practitionerroleprofessionalrolerass) de l’annuaire santé.

Profil DMI_Practitioner étendant le profil FrPractitioner vient modifier plusieurs attributs de ce dernier :

* Modifier la cardinalité de l’élément « identifier » à [1..*]
* Modifier la cardinalité de l’élément  « Telecom » ) [1..1] et modifier son binding vers la TRE_R200-CanalCommunication
* Modifier le binding de l’élement « address.type » vers la [TRE_R35-TypeVoie](https://mos.esante.gouv.fr/NOS/TRE_R35-TypeVoie/TRE_R35-TypeVoie.pdf)
* Modifier la cardinalité de l’élément « meta » à [1..1]
* Ressources « Organization »

La ressource Organization représente un établissement (une entité géographique et juridique) qui peut être lié à un service de soins. La ressource Organization représente aussi un fabricant ou un distributeur de DM.

Pour représenter l’entité juridique, le distributeur et le fabricant on va utiliser créer un profil DMI_Organization_EJ étendant le profil FrOrganization. Pour représenter l’organisation interne on vient créer un profil DMI_OrganizationInterne.

Profil DMI_Organization_EJ étendant le profil FrOrganization vient modifier plusieurs attributs de ce dernier :

* Slicing de l’élément « Identifier » et passage de sa cardinalité à [1..*]
* Ajout des extensions DMI_IdentifiantLocalDistributeur et DMI_IdentifiantLocalFabricant
* Extension DMI_IdentifiantLocalDistributeur :

| DMI_IdentifiantLocalDistributeur | Value | Identifier | [0..*] | | | |———————————-|——-|————|———–|—–|—–|

* Extension DMI_IdentifiantLocalFabricant :

| DMI_IdentifiantLocalFabricant  | Value | Identifier | [0..*] | | | |——————————–|——-|————|———–|—–|—–|

Profil DMI_OrganizationInterne :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Organization | DMI_OrganizationLocation | Extension | [0..*] |  |  |
| Identifier | Identifier | [0..*] | Cardinalité fixée à [1..1] |  | |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| Name | String | [0..1] |  |  | |
| Alias | String | [0..*] |  |  | |
| Active | Boolean | [0..1] |  |  | |
| Type | CodeableConcept | [0..1] | cardinalité fixée à [1..*] et Slicing de l’élément et discriminator fixé sur value : id |  | |
| Type : Slice | TypeOrganisationInterne | CodeableConcept | [1..1] | sliceName fixé à « TypeOrganisationInterne » |  |
| TypeOrganisationInterne | id | String | [1..1] | Valeur fixée à « TypeOrganisationInterne » |  |
| Value | CodeableConcept | [1..1] | Coding fixé à TRE_R207- TypeOrganisationInterne |  | |
| Type : Slice | CategorieOrganisation | CodeableConcept | [0..1] | sliceName fixé à « CategorieOrganisation» |  |
| CategorieOrganisation | id | String | [1..1] | Valeur fixée à « CategorieOrganisation » |  |
| Value | CodeableConcept | [1..1] | Coding fixé à TRE_R244- CategorieOrganisation |  | |
| Organization | Telecom | ContactPoint | [0..*] |  |  |
| Address | Address | [0..*] |  |  | |
| Partof | Reference (Organization) | [0..*] |  |  | |
| Contact | BackboneElement | [0..*] |  |  | |

Extension DMI_OrganizationLocation :

| DMI_OrganizationLocation | Value | Reference (Location) | [0..1] | | | |————————–|——-|———————-|———-|—–|—–|

* Ressource « SupplyRequest »


  La ressource SupplyRequest permet de représenter l’entête d’une commande, d’une demande de dispositifs médicaux et leurs réponses. Elle permet d’identifier un besoin ou d’engager une transaction commerciale et identifie l’objet de la commande. Ce volet exploite plusieurs profils créés dans le cadre de ce volet :


  DMI_SupplyRequestEnteteDemande

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| SupplyRequest | Identifier | Identifier | [0..*] | Cardinalité contrainte à [1..1] |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| Category | CodeableConcept | [0..1] |  |  | |
| Quantity | Quantity | [1..1] |  |  | |
| authoredOn | DateTime | [0..1] |  |  | |
| Status | Code | [0..1] |  |  | |
| Priority | Code | [0..1] |  |  | |
| Quantity | Quantity | [0..1] |  |  | |
| Parameter | BackboneElement | [0..*] |  |  | |
| deliverTo | Reference | [0..1] | Cardinalité fixée à [1..1] et référence fixée à Organization |  | |
| Requester | Reference | [0..1] | Cardinalité fixée à [1..1] et référence fixée à Practitioner |  | |
| Supplier | Reference | [0..*] |  |  | |
| OccurrenceDateTime | Date | [0..1] |  |  | |
| ItemCodeableConcept | CodeableConcept | [1..1] | valeur fixé à « DEM » pour la création d’une demande et fixée à « SDM » pour la suppression d’une demande |  | |
| ReasonCode | CodeableConcept | [0..*] |  |  | |
| ReasonReference | Reference | [0..*] |  |  | |
| deliverFrom | Reference | [0..1] |  |  | |

DMI_SupplyRequestEnteteCommande

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| SupplyRequest | Identifier | Identifier | [0..*] | Cardinalité contrainte à [1..1] |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| Category | CodeableConcept | [0..1] |  |  | |
| Quantity | Quantity | [1..1] |  |  | |
| authoredOn | DateTime | [0..1] |  |  | |
| Status | Code | [0..1] |  |  | |
| Priority | Code | [0..1] |  |  | |
| Quantity | Quantity | [0..1] |  |  | |
| Parameter | BackboneElement | [0..*] |  |  | |
| deliverTo | Reference | [0..1] | Référence fixée à Organization |  | |
| Requester | Reference | [0..1] | Référence fixée à Practitioner |  | |
| Supplier | Reference | [0..*] |  |  | |
| OccurrenceDateTime | Date | [0..1] |  |  | |
| ItemCodeableConcept | CodeableConcept | [1..1] | Valeur fixée à « CDM » |  | |
| ReasonCode | CodeableConcept | [0..*] |  |  | |
| ReasonReference | Reference | [0..*] |  |  | |
| deliverFrom | Reference | [0..1] |  |  | |

DMI_SupplyRequestEnteteReponse

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| SupplyRequest | Identifier | Identifier | [0..*] | Cardinalité contrainte à [1..1] |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| Category | CodeableConcept | [0..1] |  |  | |
| Quantity | Quantity | [1..1] |  |  | |
| authoredOn | DateTime | [0..1] |  |  | |
| Status | Code | [0..1] |  |  | |
| Priority | Code | [0..1] |  |  | |
| Quantity | Quantity | [0..1] |  |  | |
| Parameter | BackboneElement | [0..*] |  |  | |
| deliverTo | Reference | [0..1] | Référence fixée à Organization |  | |
| Requester | Reference | [0..1] | Référence fixée à Practitioner |  | |
| Supplier | Reference | [0..*] |  |  | |
| OccurrenceDateTime | Date | [0..1] |  |  | |
| ItemCodeableConcept | CodeableConcept | [1..1] | Valeur fixée à « DEM » pour la réponse à la demande et « SDM » pour la réponse à une suppression |  | |
| ReasonCode | CodeableConcept | [0..*] |  |  | |
| ReasonReference | Reference | [0..*] |  |  | |
| deliverFrom | Reference | [0..1] |  |  | |

* Ressource « DeviceRequest »


  La ressource DeviceRequest représente la ligne de la demande, de la commande et de la réponse à une demande.


  Ce volet exploite plusieurs profils créés dans le cadre de ce volet :


  DMI_DeviceRequest :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| DeviceRequest | Identifier | Identifier | [0..*] |  |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| [instantiatesCanonical](http://hl7.org/fhir/devicerequest-definitions.html#DeviceRequest.instantiatesCanonical) | [canonical](http://hl7.org/fhir/datatypes.html#canonical)([ActivityDefinition](http://hl7.org/fhir/activitydefinition.html)|[PlanDefinition](http://hl7.org/fhir/plandefinition.html)) | [0..*] |  |  | |
| [instantiatesUri](http://hl7.org/fhir/devicerequest-definitions.html#DeviceRequest.instantiatesUri) | uri | [0..*] |  |  | |
| basedOn | Reference (Any) | [0..*] | Cardinalité fixée à [1..1] et référence fixée à SupplyRequest | On utilise la référence pour relier la ligne à l’entête associée. | |
| priorRequest | Reference (Any) | [0..*] |  |  | |
| groupIdentifier | Identifier | [0..1] |  | Represente un identifiant commun à toute les lignes associées à la même entête | |
| Status | Code | [0..1] |  |  | |
| Intent | Code | [1..1] | Valeur fixée à « order » |  | |
| Priority | Code | [0..1] |  |  | |
| Code.codeCodeableConcept | CodeableaConcept | [1..1] |  |  | |
| Parameter | BackboneElement | [0..*] |  |  | |
| Subject | Reference ([Patient](http://hl7.org/fhir/patient.html)|[Group](http://hl7.org/fhir/group.html)|[Location](http://hl7.org/fhir/location.html)|[Device](http://hl7.org/fhir/device.html)) | [1..1] | Référence fixée à Device |  | |
| Encounter | Reference (Encounter) | [0..1] |  |  | |
| Requester | Reference (Device, Practitioner, PractitionerRole, Organization) | [0..1] |  |  | |
| performerType | CodeableConcept | [0..1] |  |  | |
| Performer | [Reference](http://hl7.org/fhir/references.html#Reference)([Practitioner](http://hl7.org/fhir/practitioner.html)|[PractitionerRole](http://hl7.org/fhir/practitionerrole.html)|[Organization](http://hl7.org/fhir/organization.html)|[CareTeam](http://hl7.org/fhir/careteam.html)|[HealthcareService](http://hl7.org/fhir/healthcareservice.html)|[Patient](http://hl7.org/fhir/patient.html)|[Device](http://hl7.org/fhir/device.html)|[RelatedPerson](http://hl7.org/fhir/relatedperson.html)) | [0..1] |  |  | |
| OccurrenceDateTime | Date | [0..1] |  |  | |
| ReasonCode | CodeableConcept | [0..*] |  |  | |
| ReasonReference | Reference | [0..*] |  |  | |
| [insurance](http://hl7.org/fhir/devicerequest-definitions.html#DeviceRequest.insurance) | [Reference](http://hl7.org/fhir/references.html#Reference)([Coverage](http://hl7.org/fhir/coverage.html)|[ClaimResponse](http://hl7.org/fhir/claimresponse.html)) | [0..*] |  |  | |
| [supportingInfo](http://hl7.org/fhir/devicerequest-definitions.html#DeviceRequest.supportingInfo) | [Reference](http://hl7.org/fhir/references.html#Reference)([Any](http://hl7.org/fhir/resourcelist.html)) | [0..*] |  |  | |
| note | [Annotation](http://hl7.org/fhir/datatypes.html#Annotation) | [0..*] |  |  | |
| relevantHistory | [Reference](http://hl7.org/fhir/references.html#Reference)([Provenance](http://hl7.org/fhir/provenance.html)) | [0..*] |  |  | |

* Ressource « SupplyDelivery »


  La ressource SupplyDelivery représente la livraison, le transport, la reception, la délivrance, et l’entrée en stock de dispositifs médicaux. Ce volet exploite plusieurs profils créés dans le cadre de ce volet :


  DMI_SupplyDeliveryTransport 

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| SupplyDelivery | Identifier | Identifier | [0..*] | Cardinalité fixée à [1..1] |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| DMI_Transport | Extension | [0..1] |  |  | |
| SupplyDelivery | DMI_ReferenceOrganisationInterne | Extension | [1.1] |  |  |
| basedOn | Reference (SupplyRequest) | [0..*] |  |  | |
| partOf | Reference (SupplyDelivery, Contract) | [0..*] |  |  | |
| SupplyDelivery | Status | Code | [0..1] | Cardinalité fixée à [1..1] dans le flux 5c |  |
| Patient | Reference(Patient) | [0..1] |  |  | |
| Type | CodeableConcept | [0..1] |  |  | |
| SuppliedItem | BackboneElement | [0..1] |  |  | |
| SuppliedItem | Quantity | Quantity | [0..1] |  |  |
| itemReference | Reference | [0..1] | Référence fixée à Device |  | |
| SupplyDelivery | OccurenceDateTime | dateTime | [0..1] | Cardinalité fixée à [1..1] |  |
| Supplier | Reference | [0..1] |  |  | |
| Destination | Reference | [0..1] |  |  | |
| Receiver | Reference | [0..*] | Cardinalité fixée à [1..1] |  | |

Extension DMI_Transport :

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| refDelivery | Identifier | [1..1] |  |  |
| Incident | Code | [0..1] |  |  |
| detailIncident | String | [0..1] |  |  |
| Text | String | [0..1] |  |  |
| Meta | Meta | [1..1] |  |  |

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | [1.1] | | | |———————————-|——-|———–|———|—–|—–|

DMI_SupplyDeliveryReceptionUnitaire :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| SupplyDelivery | Identifier | Identifier | [0..*] | Cardinalité fixée à [1..1] |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| DMI_ReferenceOrganisationInterne | Extension | [1.1] |  |  | |
| basedOn | Reference (SupplyRequest) | [0..*] |  |  | |
| partOf | Reference (SupplyDelivery, Contract) | [0..*] |  |  | |
| Status | Code | [0..1] | Cardinalité fixée à [1..1] |  | |
| Patient | Reference(Patient) | [0..1] |  |  | |
| Type | CodeableConcept | [0..1] |  |  | |
| SuppliedItem | BackboneElement | [0..1] |  |  | |
| SuppliedItem | Quantity | Quantity | [0..1] |  |  |
| itemReference | Reference | [0..1] | Référence fixée à Device |  | |
| SupplyDelivery | OccurenceDateTime | dateTime | [0..1] | Cardinalité fixée à [1..1] |  |
| Supplier | Reference | [0..1] |  |  | |
| Destination | Reference | [0..1] |  |  | |
| Receiver | Reference | [0..*] | Cardinalité fixée à [1..1] |  | |

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | [1.1] | | | |———————————-|——-|———–|———|—–|—–|

DMI_SupplyDeliveryEntêteReceptionDMI :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| SupplyDelivery | Identifier | Identifier | [0..*] | Cardinalité fixée à [1..1] |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| DMI_ReferenceOrganisationInterne | Extension | [1.1] |  |  | |
| basedOn | Reference (SupplyRequest) | [0..*] | Cardinalité fixée à [1..1] | On utilise la référence pour relier la ligne de livraison à la commande, la demande associée | |
| partOf | Reference (SupplyDelivery, Contract) | [0..*] |  |  | |
| Status | Code | [0..1] |  |  | |
| Patient | Reference(Patient) | [0..1] |  |  | |
| Type | CodeableConcept | [0..1] |  |  | |
| SuppliedItem | BackboneElement | [0..1] |  |  | |
| OccurenceDateTime | dateTime | [0..1] | Cardinalité fixée à [1..1] |  | |
| Supplier | Reference | [0..1] |  |  | |
| Destination | Reference | [0..1] |  |  | |
| Receiver | Reference | [0..*] | Cardinalité fixée à [1..1] |  | |

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | [1.1] | | | |———————————-|——-|———–|———|—–|—–|

DMI_SupplyDeliveryEntêteDelivrance :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| SupplyDelivery | Identifier | Identifier | [0..*] | Cardinalité fixée à [1..1] |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| DMI_ReferenceOrganisationInterne | Extension | [1.1] |  |  | |
| basedOn | Reference (SupplyRequest) | [0..*] | Cardinalité fixée à [1..1] | On utilise la référence pour relier la ligne de livraison à la commande, la demande associée | |
| partOf | Reference (SupplyDelivery, Contract) | [0..*] |  |  | |
| Status | Code | [0..1] |  |  | |
| Patient | Reference(Patient) | [0..1] |  |  | |
| Type | CodeableConcept | [0..1] |  |  | |
| SuppliedItem | BackboneElement | [0..1] |  |  | |
| OccurenceDateTime | dateTime | [0..1] |  |  | |
| Supplier | Reference | [0..1] |  |  | |
| Destination | Reference | [0..1] |  |  | |
| Receiver | Reference | [0..*] |  |  | |

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | [1.1] | | | |———————————-|——-|———–|———|—–|—–|

DMI_SupplyDeliveryEntêteLivraison :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| SupplyDelivery | Identifier | Identifier | [0..*] | Cardinalité fixée à [1..1] |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| DMI_ReferenceOrganisationInterne | Extension | [1.1] |  |  | |
| basedOn | Reference (SupplyRequest) | [0..*] | Cardinalité fixée à [1..1] | On utilise la référence pour relier la ligne de livraison à la commande, la demande associée | |
| partOf | Reference (SupplyDelivery, Contract) | [0..*] |  |  | |
| Status | Code | [0..1] | Cardinalité fixée à [1..1] |  | |
| Patient | Reference(Patient) | [0..1] |  |  | |
| Type | CodeableConcept | [0..1] |  |  | |
| SuppliedItem.itemReference | Reference | [0..1] | Cardinalité fixée à [1..1] |  | |
| OccurenceDateTime | dateTime | [0..1] |  |  | |
| Supplier | Reference | [0..1] |  |  | |
| Destination | Reference | [0..1] |  |  | |
| Receiver | Reference | [0..*] | Cardinalité fixée à [1..1] |  | |

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | [1.1] | | | |———————————-|——-|———–|———|—–|—–|

DMI_SupplyDeliveryLigne :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| SupplyDelivery | Identifier | Identifier | [0..*] | Cardinalité fixée à [1..1] |  |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| basedOn | Reference (SupplyRequest) | [0..*] | Cardinalité fixée à [1..1] | On utilise la référence pour relier la ligne de livraison à la commande, la demande associée | |
| partOf | Reference (SupplyDelivery, Contract) | [0..*] | Cardinalité fixée à [1..1] | On utilise la référence pour relier la ligne à l’entête associée | |
| Status | Code | [0..1] | Cardinalité fixée à [1..1] dans le cadre du flux 11, 12 et 13 |  | |
| Patient | Reference(Patient) | [0..1] |  |  | |
| Type | CodeableConcept | [0..1] |  |  | |
| SuppliedItem | BackboneElement | [0..1] | Cardinalité fixée à [1..1] |  | |
| OccurenceDateTime | dateTime | [0..1] |  |  | |
| Supplier | Reference | [0..1] |  |  | |
| Destination | Reference | [0..1] |  |  | |
| Receiver | Reference | [0..*] |  |  | |

* Ressource « Procedure »


  La ressource Procedure représente l’intervention clinique ou chirurgicale implantant un dispositif médical. Cette ressource est liée à un professionnel de santé (ressource Practitioner) et au patient (ressource Patient). Ce volet exploite le profil DMI_Procedure.

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Procedure | Identifier | Identifier | [0..*] | cardinalité fixée à [1..*] et slicing de l’élément et discriminator fixé à Value : Type.text |  |
| Procedure | Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  |
| Identifier : Slice | idIntervention | identifier | [1..1] | sliceName fixé à « idIntervention » |  |
| idIntervention | Type.text | String | [0..1] | Valeur fixée à « idIntervention » et cardinalité fixée à [1..1] |  |
| value | String | [0..1] | Cardinalité fixée à [1..1] |  | |
| Identifier : Slice | numSejour | identifier | [0..1] | sliceName fixé à « numSejour » |  |
| numSejour | Type.text | String | [0..1] | Valeur fixée à « numSejour » et cardinalité fixée à [1..1] |  |
| value | String | [0..1] | Cardinalité fixée à [1..1] |  | |
| Procedure | instantiatesUri | Uri | [0..*] |  |  |
| basedOn | Reference | [0..*] |  |  | |
| partOf | Reference | [0..*] |  |  | |
| Status | Code | [1..1] |  |  | |
| statusReason | CodeableConcept | [0..1] |  |  | |
| Category | CodeableConcept | [0..1] |  |  | |
| Code | CodeableConcept | [0..1] |  |  | |
| Subject | Reference | [1..1] |  |  | |
| Encounter | Reference | [0..1] |  |  | |
| performedDateTime | dateTime | [0..1] | Cardinalité fixée à [1..1] |  | |
| Recorder | Reference | [0..1] |  |  | |
| Asserter | Reference | [0..1] |  |  | |
| Performer | BackboneElement | [0..*] | Cardinalité fixée à [1..1] |  | |
| Perfomer | Actor | Reference | [1..1] |  |  |
| onBehalfOf | Reference | [0..1] | Cardinalité fixée à [1..1] |  | |
| Procedure | Location | Reference | [0..1] |  |  |
| reasonCode | CodeableConcept | [0..*] |  |  | |
| reasonReference | Reference | [0..*] |  |  | |
| bodySite | CodeableConcept | [0..*] | Cardinalité fixée à [1..1] |  | |
| Outcome | CodeableConcept | [0..1] |  |  | |
| report | Reference | [0..*] |  |  | |
| Complication | CodeableConcept | [0..*] | Cardinalité fixée à [1..1] | On utilise le code pour véhiculer l’information sur la pose conforme et si la pose est non conforme on vient remplir le l’attribut texte avec le motif de l’échec | |
| followUp | CodeableConcept | [0..*] |  |  | |
| Note | Annotation | [0..*] |  |  | |
| focalDevice | BackboneElement | [0..*] | Cardinalité fixée à [1..1] |  | |
| FocalDevice | Manipulated | Reference (Device) | [1..1] |  |  |

* Ressource « Invoice »


  La ressource Invoice représente la facturation de dispositifs médicaux. Ce volet exploite le profil DMI_Invoice.

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Invoice | Identifier | Identifier | [0..*] | Cardinalité fixée à [1..*] et slicing de l’attribut, discriminator fixé sur value : Type.text |  |
| DMI_Facture | Extension | [0..1] |  |  | |
| Meta | Meta | [0..1] | Cardinalité fixée à [1..1] |  | |
| Identifier : Slice | refFacture | identifier | [1..1] | sliceName fixé à « refFacture » |  |
| refFacture | Type.text | String | [0..1] | Valeur fixée à « refFacture » et cardinalité fixée à [1..1] |  |
| value | String | [0..1] | Cardinalité fixée à [1..1] |  | |
| Identifier : Slice | refCommande | identifier | [1..1] | sliceName fixé à « refCommande » |  |
| Identifier.slice (refCommande) | Type.text | String | [0..1] | Valeur fixée à « refCommande » et cardinalité fixée à [1..1] |  |
| value | String | [0..1] | Cardinalité fixée à [1..1] |  | |
| Invoice | Status | Code | [1..1] |  |  |
| CancelledReason | String | [0..1] |  |  | |
| Type | CodeableConcept | [0..1] |  |  | |
| Subject | Reference | [0..1] |  |  | |
| recipient | Reference | [0..1] |  |  | |
| date | DateTime | [0..1] |  |  | |
| Participant | BackboneElement | [0..*] |  |  | |
| Issuer | Reference | [0..1] |  |  | |
| Account | Reference | [0..1] |  |  | |
| lineItem | BackboneElement | [0..*] |  |  | |
| totalNet | Money | [0..1] |  |  | |
| totalGross | Money | [0..1] |  |  | |
| paymentTerms | markdown | [0..1] |  |  | |
| Note | Annotation | [0..*] |  |  | |

Extension DMI_Facture :

| DMI_Facture | Value | Binary | [0..1] | | | |————-|——-|——–|———-|—–|—–|

* Ressource « Binary »


  La ressource Binary est utilisée pour supporter le contenu non structuré d’un évènement. Ce volet exploite la ressource FHIR.

Ressources transportant l’objet de l’évènement :

La ressource Bundle est utilisée pour transporter les différents objets des évènements. Dans le cadre de ce volet 3 profils sont créés :

DMI_BundleRequest :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Bundle | Identifier | Identifier | [0..*] |  |  |
| Type | Code | [1..1] | Valeur fixée à « transaction » |  | |
| Entry | BackboneElement | [0..*] | Slicing de l’attribut sur le profile des ressources |  | |
| Entry | Entry:SupplyRequest | BackboneElement | [0..1] | Cardinalité fixée à [1..1] |  |
| Entry:SupplyRequest | Resource | Resource | [0..1] | Valeur fixée à «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteReponse », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteCommande », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDemande » et cardinalité fixée à [1..1] |  |
| Entry | Entry:DeviceRequest | BackboneElement | [0..1] | Cardinalité fixée à [1..1] |  |
| Entry:DeviceRequest | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceRequest » et cardinalité fixée à [1..1] |  |

DMI_BundleDelivery :

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Bundle | Identifier | Identifier | [0..*] |  |  |
| Type | Code | [1..1] | Valeur fixée à « transaction » |  | |
| Entry | BackboneElement | [0..*] | Slicing de l’attribut sur le profile des ressources |  | |
| Entry | Entry:SupplyDelivery | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry:SupplyDelivery | Resource | Resource | [0..1] | Valeur fixée à «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryTransport », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteReceptionDMI », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteDelivrance », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliverytEnteteLivraison», «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne », « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryReceptionUnitaire» et cardinalité fixée à [1..1] |  |

DMI_BundleTransmissionTraces

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Bundle | Identifier | Identifier | [0..*] |  |  |
| Type | Code | [1..1] | Valeur fixée à « transaction » |  | |
| Entry | BackboneElement | [0..*] | Slicing de l’attribut sur le profil des ressources |  | |
| Entry | Entry:AuditEvent | BackboneElement | [0..1] | Cardinalité fixée à [1..*] |  |
| Entry:SupplyDelivery | Resource | Resource | [0..1] | Valeur fixée à «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_AuditEvent » et cardinalité fixée à [1..1] | Entrées pour le profil d’AuditEvent |
| Entry | Entry:SupplyDelivery | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry:SupplyDelivery | Resource | Resource | [0..1] | Valeur fixée à «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryTransport », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteReceptionDMI », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteDelivrance », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliverytEnteteLivraison», «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne », « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryReceptionUnitaire» et cardinalité fixée à [1..1] | Entrées pour les différents profils de SupplyDelivery |
| Entry | Entry:SupplyRequest | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry:SupplyRequest | Resource | Resource | [0..1] | Valeur fixée à «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteReponse », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteCommande », «http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDemande » et cardinalité fixée à [1..1] | Entrées pour les différents profils de SupplyRequest |
| Entry | Entry:DeviceRequest | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry:DeviceRequest | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceRequest » et cardinalité fixée à [1..1] | Entrées pour les différents profils de DeviceRequest |
| Entry | Entry:BundleRequest | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry:BundleRequest | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleRequest» et cardinalité fixée à [1..1] | Entrées pour le profil de BundleRequest |
| Entry | Entry:BundleDelivery | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry:BundleDelivery | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleDelivery» et cardinalité fixée à [1..1] | Entrées pour le profil de BundleDelivery |
| Entry | Entry:Device | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry:Device | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Device» et cardinalité fixée à [1..1] | Entrées pour le profil de Device |
| Entry | Entry:DeviceDefinition | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry:DeviceDefinition | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceDefinition» et cardinalité fixée à [1..1] | Entrées pour le profil de DeviceDefinition |
| Entry | Entry:Patient | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry:Patient | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Patient» et cardinalité fixée à [1..1] | Entrées pour le profil de Patient |
| Entry | Entry:Professionnel | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry: Professionnel | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Practitioner» et cardinalité fixée à [1..1] | Entrées pour le profil de Practitioner |
| Entry | Entry:EntiteJuridique | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry: EntiteJuridique | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Organization_EJ» et cardinalité fixée à [1..1] | Entrées pour le profil de Organization (EntiteJuridique) |
| Entry | Entry:OrganisationInterne | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry: OrganisationInterne | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_OrganizationInterne» et cardinalité fixée à [1..1] | Entrées pour le profil de Organization (OrganisationInterne) |
| Entry | Entry:Invoice | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry: Invoice | Resource | Resource | [0..1] | Valeur fixée à « http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Invoice» et cardinalité fixée à [1..1] | Entrées pour le profil de Invoice |
| Entry | Entry:Procedure | BackboneElement | [0..1] | Cardinalité fixée à [0..*] |  |
| Entry: Procedure | Resource | Resource | [0..1] | Valeur fixée à http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Procedure» et cardinalité fixée à [1..1] | Entrées pour le profil de Procedure |

### Construction des flux

La construction des flux se base sur le supplément RESTful ATNA. Cela consiste en la construction de requêtes et de réponses HTTP de l’API REST de FHIR.

![](media/media/image7.png)

Figure 1 : Diagramme de séquence des flux

A noter que si l’implémentation est basée sur le profil ATNA, la construction des flux consiste en la construction des requêtes ou des réponses syslog (pour la transmission de trace) et HTTP (pour la consultation et la recherche de trace).

#### 3.1 Flux de transmission des traces

Les flux transmettant les informations de traçabilité d’un évènement sont les suivants :

* Flux 22 – TransmissionTrace 
* Flux 1c - TracabiliteDemande
* Flux 2a - TracabiliteReponse
* Flux 5 - TracabiliteLivraisonValide
* Flux 5a – TracabiliteLivraisonRejet
* Flux 5c – TracabiliteEntreeStockDMI
* Flux 5d – TracabiliteReceptionDMI 
* Flux 5e – TracabiliteRejetDMI 
* Flux 6a – TracabiliteSortieStock 
* Flux 7 – TracabiliteDelivranceSU 
* Flux 9 – TracabiliteTransportDMI 
* Flux 11 – TracabiliteEntreStock 
* Flux 12 – TracabiliteReceptionSU 
* Flux 13a – TracabiliteRefusDMI 
* Flux 14 – TracabiliteEchecPose 
* Flux 15 -TracabilitePose 
* Flux 16a – TracabiliteReassortDMI 
* Flux 18 – TracabiliteFacturationDMI 
* Flux 27 – TracabiliteCommande
* Flux 28 – TracabiliteRejetDMI
* Flux 30 - TracabiliteSortieStockSU

Ils sont construits selon les exigences de la transaction IHE ITI-20[5](#fn:5) « Record Audit Event » dans sa version HL7 FHIR où une seule trace est transmise à la fois : « Send Audit Resource Request Message - FHIR Feed Interaction ».

Ce flux se base sur l’interaction « create »[6](#fn:6) de l’API REST de FHIR. Il s’agit d’une requête HTTP POST dont le corps de la requête est une ressource Bundle suivant le profil DMI_BundleTransmissionTraces :

|
|

Si la transaction a été correctement effectuée et donc que la création du cercle de soins est correctement effectuée, un code HTTP 200 **ok** est retourné[7](#fn:7). Un Bundle de type transaction-response doit être renvoyé dans le corps de la réponse[8](#fn:8). Ce dernier doit contenir les ressources telles qu’elles ont été créées par le gestionnaire ou, a minima, les identifiants logiques des ressources ayant été attribués par le gestionnaire (dans Bundle.entry.fullUrl et/ou Bundle.entry.resource.id).

Sinon, un code HTTP 500 **Internal Server Error** est retourné avec une ressource OperationOutcome contenant le détail des erreurs et avertissements résultant du traitement des entrées du Bundle.

#### 3.2 Flux 23 - RechercheTraces 

Ce flux est utilisé par le consommateur pour faire une recherche de traces auprès du gestionnaire de traçabilité.

Ce flux est construit selon les exigences de la transaction IHE ITI-81[9](#fn:9) « Retrieve ATNA Audit Event » qui se base sur l’interaction « search »[10](#fn:10) de l’API REST de FHIR. Il s’agit d’une requête HTTP GET adressant la ressource auditEvent.

La transaction [ITI-81] Retrieve ATNA Audit Event exige que la recherche de traces soit bornée dans le temps. C’est-à-dire que le paramètre de recherche « date » qui correspond à la date d’enregistrement de l’évènement est présent pour préciser une limite de temps (avant, après ou un intervalle).

La recherche est transmise de la façon suivante :

|
|

#### 3.3 Flux 24 : ReponseRechercheTraces

Ce flux véhicule le résultat de la recherche de traces.

Dans le contexte d’un échange basé sur le standard HL7 FHIR, ce flux est basé sur les ressources FHIR Bundle, AuditEvent et OperationOutcome (en cas d’erreur) telles qu’utilisées dans la transaction IHE ITI-81 « Retrieve ATNA Audit Event ».

Conformément au supplément RESTful ATNA du profil IHE ATNA, la réponse retournée par le Gestionnaire de trace au Consommateur de traces est composée d’un Bundle de ressources AuditEvent.

La ressource Bundle de type search set constituera alors le corps de la réponse HTTP 200 ok. Un exemple est donné en annexe :

Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR.

#### 3.4 Flux 25 : ConsulterTrace 

Le Flux 25 « ConsultationTrace » permet au consommateur de demander la consultation d’une trace dont l’identifiant est connu au gestionnaire de traçabilité.

Ce flux utilise l’interaction « read »[11](#fn:11) de l’API REST de HL7 FHIR. Il s’agit d’une requête HTTP GET adressant la ressource auditEvent.

La première étape de construction de ce flux consiste à récupérer l’identifiant de la ressource AuditEvent représentant la trace à consulter.

Cet identifiant est utilisé dans la requête GET suivante :

|
|

#### 3.5 Flux 26 : ReponseConsulterTrace

Le Flux 26 « ReponseConsulterTrace » correspond à la réponse du Gestionnaire de traçabilité à la demande du Consommateur de consulter une trace dont il connaît l’identifiant système (Flux 25).

Le flux se compose d’un code HTTP 200 ok et d’un contenu. Le corps de la réponse HTTP est constituée de la ressource AuditEvent identifiée dans la demande.

Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR.

### Disposition de sécurité

Les données véhiculées à travers les flux de ce volet générique peuvent être des données à caractère personnel contenant notamment les noms des patients et des professionnels.

Cette section présente les éventuelles recommandations de sécurité qui s’appliquent au volet « Traçabilité des Dispositifs Médicaux Implantable en Établissement de santé ». Il s’agit d’un sous-ensemble lié à la dimension interopérabilité de dispositions de sécurité plus globales visant à couvrir les exigences de sécurité d’un système cible.

Il est du ressort du responsable de traitement du système cible de mettre en œuvre des dispositions de sécurité adaptées à son analyse de risques pour le service. En fonction de sa politique de sécurité, il peut choisir ou pas de mettre en œuvre les dispositions spécifiques décrites dans cette section. Les référentiels de sécurité édités par l’ANS fournissent des recommandations sur ce sujet.

#### Authentification et droit d’accès

Pas de disposition spécifique à ce volet.

#### Confidentialité

Pas de disposition spécifique à ce volet.

#### Intégrité

Pas de disposition spécifique à ce volet.

#### Traçabilité

Pas de disposition spécifique à ce volet.

#### Imputabilité

Pas de disposition spécifique à ce volet.

#### Disponibilité

Pas de disposition spécifique à ce volet.

### ANNEXE 1 : RESSOURCES DE CONFORMITE

Des extensions sont définies dans ce volet sur les ressources SupplyRequest, SupplyDelivery et Invoice :

| | | |
| :--- | :--- | :--- |
| DMI_Transport | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Transport | 1.0 |
| DMI_Facture | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Facture | 1.0 |
| DMI_ClasseRisque | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_ClasseRisque | 1.0 |
| DMI_CodeLPP | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_CodeLPP | 1.0 |
| DMI_CodeEMDN | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_CodeEMDN | 1.0 |
| DMI_ReferenceDistributeur | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_ReferenceDistributeur | 1.0 |
| DMI_MarquageCE | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_MarquageCE | 1.0 |
| DMI_IdentifiantLocalDistributeur | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_IdentifiantLocalDistributeur | 1.0 |
| DMI_IdentifiantLocalFabricant | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_IdentifiantLocalFabricant | 1.0 |
| DMI_OrganizationLocation | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_OrganizationLocation | 1.0 |
| DMI_InternalDiameter | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_InternalDiameter | 1.0 |
| DMI_ReferenceOrganisationInterne | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_ReferenceOrganisationInterne | 1.0 |

Des paramètres de recherche sont créés pour la ressource Device :

| | | |
| :--- | :--- | :--- |
| DMI_Device_lotNumber | http://esante.gouv.fr/ci-sis/fhir/SearchParameter/DMI_Device_lotNumber | 1.0 |
| DMI_ Device_serialNumber | http://esante.gouv.fr/ci-sis/fhir/SearchParameter/DMI_ Device_serialNumber | 1.0 |
| DMI_ Device_definition-type | http://esante.gouv.fr/ci-sis/fhir/SearchParameter/DMI_ Device_definition-type | 1.0 |

Un paramètre de recherche est créé pour la ressource Patient :

| | | |
| :--- | :--- | :--- |
| DMI_Patient_INS | http://esante.gouv.fr/ci-sis/fhir/SearchParameter/DMI_Patient_INS | 1.0 |

Des profils sont créés :

| | | |
| :--- | :--- | :--- |
| DMI_Device | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Device | 1.0 |
| DMI_DeviceDefinition | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceDefinition | 1.0 |
| DMI_DeviceRequest | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceRequest | 1.0 |
| DMI_Organization_EJ | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Organization_EJ | 1.0 |
| DMI_OrganizationInterne | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_OrganizationInterne | 1.0 |
| DMI_Patient | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Patient | 1.0 |
| DMI_Practitioner | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Practitioner | 1.0 |
| DMI_PractitionerRole | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_PractitionerRole | 1.0 |
| DMI_SupplyRequestEnteteDemande | [http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDema](http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDema)nde | 1.0 |
| DMI_SupplyRequestEnteteCommande | [http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteComma](http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyRequestEnteteComma)nde | 1.0 |
| DMI_SupplyRequestEnteteReponse | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteReponse | 1.0 |
| DMI_SupplyDeliveryTransport | http://esante.gouv.fr**/**ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryTransport | 1.0 |
| DMI_SupplyDeliveryReceptionUnitaire | http://esante.gouv.fr**/**ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryReceptionUnitaire | 1.0 |
| DMI_SupplyDeliveryEnteteReceptionDMI | http://esante.gouv.fr**/**ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteReceptionDMI | 1.0 |
| DMI_SupplyDeliveryEnteteDelivrance | http://esante.gouv.fr**/**ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteDelivrance | 1.0 |
| DMI_SupplyDeliveryEntêteLivraison | [http://esante.gouv.fr**/**ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteLivraison](http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteLivraison) | 1.0 |
| DMI_SupplyDeliveryLigne | [http://esante.gouv.fr**/**ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne](http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne) | 1.0 |
| DMI_Invoice | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Invoice | 1.0 |
| DMI_Procedure | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Procedure | 1.0 |
| DMI_BundleRequest | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleRequest | 1.0 |
| DMI_BundleDelivery | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleDelivery | 1.0 |
| DMI_BundleTransmissionTraces | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleTransmissionTraces | 1.0 |

Création de 3 CapabilityStatement :

| | | |
| :--- | :--- | :--- |
| DMI_Consommateur | https://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/DMI_Consommateur | 1.0 |
| DMI_SourceTracabilite | https://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/DMI_SourceTracabilite | 1.0 |
| DMI_GestionnaireTracabilite | https://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/DMI_GestionnaireTracabilite | 1.0 |

Création d’un ImplementationGuide :

| | | |
| :--- | :--- | :--- |
| DMI_ImplementationGuide | http://esante.gouv.fr/ci-sis/fhir/ImplementationGuides/CI-SIS.TracabiliteDMI | 1.0 |

### ANNEXE 2 : GLOSSAIRE

| | |
| :--- | :--- |
| API | Application Programming Interface |
| ANS | Agence du Numérique en Santé |
| CI-SIS | Cadre d’Interopérabilité des Systèmes d’Information de Santé |
| FHIR | Fast Healthcare Interoperability Resources |
| HL7 | Health Level 7 |
| DMI | Dispositif médical implantable |
| HTTP | HyperText Transfer Protocol |
| JDV | Jeu De valeurs |
| JSON | JavaScript Object Notation |
| REST | Representational State Transfer |
| TRE | Terminologie de Référence |

### ANNEXE 3 : Classes communes aux flux

#### Classe DispositifMedical :

Classe utilisée dans le profil DMI_Device

| | | | |
| :--- | :--- | :--- | :--- |
| Nom classes | Nom attributs | Ressource | Elément |
| DispositifMedical [1..1] | Support : [0..1] SupportIUD | Device | L’élément est décrit dans la partie « SupportIUD» |
| identifiantLocalDM : [0..*] Identifiant | identifier [0..*] Identifier | | |
| classeRisque : [0..1] Code | definition[0..1].extension.DMI_ClasseRisque [0..1] BackboneElement(DeviceDefinition) | | |
| marquageCE : [0..1] MarquageCE | L’élément est décrit dans la partie « MarquageCE» | | |
| referenceFabricant : [0..1] Identifiant | Definition[0..1].manufacturerReference[0..1] Reference (Organization)(DeviceDefinition) | | |
| referenceDistributeur : [0..1] Identifiant | Definition[0..1].extension.DMI_ReferenceDistributeur [0..1] Identifier(DeviceDefinition) | | |
| Modele : [0..1] Texte | modelNumber [0..1] | | |
| nomCommercial : [0..1] Texte | definition[0..1].deviceName[0..*].name [1..1] string | | |
| codeEMDN : [0..1] Code | definition[0..1]. extension.DMI_CodeEMDN [0..1] BackboneElement(DeviceDefinition) | | |
| Patient [0..1] | Patient [0..1] reference (Patient) | | |
| usageUnique : [0..1] Indicateur | definition[0..1].property [0..*] BackboneElement[1](#fn1)(DeviceDefinition) | | |
| nbReutilisation : [0..1] Integer | definition[0..1].property [0..*] BackboneElement(DeviceDefinition) | | |
| emballageSterile : [0..1] Indicateur | definition[0..1].property [0..*] BackboneElement(DeviceDefinition) | | |
| sterilisationAvantUtilisation : [0..1] Indicateur | definition[0..1].property [0..*] BackboneElement(DeviceDefinition) | | |
| contientLatex : [0..1] Indicateur | definition[0..1].safety [0..*] CodeableConcept(DeviceDefinition) | | |
| CMR1A1B**: [0..1] Indicateur** | definition[0..1].safety [0..*] CodeableConcept(DeviceDefinition) | | |
| implantable**: [0..1] Indicateur** | definition[0..1].property [0..*] BackboneElement(DeviceDefinition) | | |
| actif : [0..1] Indicateur | definition[0..1].property [0..*] BackboneElement(DeviceDefinition) | | |
| irmCompatible : [0..1] Code | definition[0..1].safety [0..*] BackboneElement(DeviceDefinition) | | |
| dimensionsCliniques : [0..1][DimensionsDM](file:///Z:/Réalisation/Conseil/ASIP/ANS-006%20Contrat%20cadre%20CI%20SIS%202021/Projets/ANS-006-20_TraçabilitéDMI/Entrants/CI-SIS_ETUDE_METIER_TRACABILITE-DMI_V2.1.docx#_78df6d3c-0e56-4be7-895a-22ec649a6a5f) | Definition[0..1].PhysicalCharacteristics[0..1](DeviceDefinition) | | |
| codeLPP : [0..1] Code | definition[0..1].extension.DMI_codeLPP[0..1] Code | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |

-------

1. Une demande de modification de l’élément property a été effectuée auprès de HL7. Elle sera prise en compte dans FHIR R5.[↩︎](#fnref1)

#### Classe Support IUD :

Classe utilisée dans le profil DMI_Device

| | | | |
| :--- | :--- | :--- | :--- |
| ****Nom classes**** | ****Nom attributs**** | ****Ressource**** | ****Elément**** |
| SupportIUD [0..1] | IUD-ID : [0..1] Identifiant | Device | udiCarrier[0..*].deviceIdentifier [0..1] string |
| IUD-IPNumSerie : [0..1] Identifiant | serialNumber [0..1] string | | |
| IUD-IPNumLot : [0..1] Identifiant | lotNumber [0..1] string | | |
| IUD-IPIdLogiciel : [0..1] Identifiant | Extension DMI_IPIdLogicielr [0..1] string | | |
| IUD-IPDateFabrication : [0..1] Date | manufactureDate [0..1] dateTime | | |
| IUD-IPDateExpiration : [0..1] Date | expirationDate [0..1] dateTime | | |
| identifiantIUD_HRF : [0..1] Texte | udiCarrier[0..*].carrierHRF [0..1] string | | |
| identifiantIUD_AIDC : [0..1] ObjetBinaire | udiCarrier[0..*].carrierAIDC [0..1] base64Binary | | |
| identifiantIUD_Source : [0..1] Code | udiCarrier[0..*].entryType [0..1] code | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |

#### Classe MarquageCE :

Classe utilisée dans le profil DMI_Device

| | | | |
| :--- | :--- | :--- | :--- |
| ****Nom classes**** | ****Nom attributs**** | ****Ressource**** | ****Elément**** |
| MarquageCE [0..1] | organismeNotifie : [0..1][EntiteJuridique](file:///Z:/Réalisation/Conseil/ASIP/ANS-006%20Contrat%20cadre%20CI%20SIS%202021/Projets/ANS-006-20_TraçabilitéDMI/Entrants/CI-SIS_ETUDE_METIER_TRACABILITE-DMI_V2.1.docx#_c2857583-85c7-434f-940b-912ab2b2cd36) | Device | Extension : DMI_MarquageCE.organismeNotifie[0..1] Reference (Organization) |
| libelleAutorisation : [1..1] Texte | Extension : DMI_marquageCE.libelleAutorisation [1..1] String | | |

#### Classe EntiteJuridique :

Classe utilisée dans le Profil DMI_Organization_EJ étendant le profil OrganizationRASS

| | | | |
| :--- | :--- | :--- | :--- |
| ****Nom classes**** | ****Nom attributs**** | ****Nom classes**** | ****Nom attributs**** |
| EntiteJuridique [1..1] | idNat_Struct : [1..1] Identifiant | Organization | Organization.Identifier[0..*] Identifier |
| numSiren : [1..1] Identifiant | | | |
| numFINESS : [0..1] Identifiant | | | |
| numeroTVAIntracommunautaire : [0..1] Identifiant | | | |
| numeroSRN : [0..*][1](#fn1)Identifiant | | | |
| raisonSociale : [1..1] Texte | Name [0..1] String | | |
| raisonSocialeLongue : [0..1] Texte | Alias [0..*] String | | |
| adresseEJ : [0..1][Adresse](file:///Z:/Réalisation/Conseil/ASIP/ANS-006%20Contrat%20cadre%20CI%20SIS%202021/Projets/ANS-006-20_TraçabilitéDMI/Entrants/CI-SIS_ETUDE_METIER_TRACABILITE-DMI_V2.1.docx#_4eaa36c8-4756-4b51-8e05-312dcd3e772b) | Address [0..*] | | |
| telecommunication : [0..*][Telecommunication](file:///Z:/Réalisation/Conseil/ASIP/ANS-006%20Contrat%20cadre%20CI%20SIS%202021/Projets/ANS-006-20_TraçabilitéDMI/Entrants/CI-SIS_ETUDE_METIER_TRACABILITE-DMI_V2.1.docx#_cff4ad64-57f1-42cf-b97e-6f7c54e020ca) | telecom [0..*] FrContactPoint | | |

-------

1. L’attribut numéro SRN ne s’applique pas au distributeur[↩︎](#fnref1)

#### Classe OrganisationInterne :

Classe utilisée dans le profil DMI_OrganizationInterne

| | |
| :--- | :--- |
| nom : [0..1] Texte | Name[0..1] String |
| typeOI : [1..1] Code <[TRE_R207-TypeOrganisationInterne](https://mos.esante.gouv.fr/NOS/TRE_R207-TypeOrganisationInterne/TRE_R207-TypeOrganisationInterne.pdf)> | Type[0..*] CodeableConcept ([TRE_R207-TypeOrganisationInterne](https://mos.esante.gouv.fr/NOS/TRE_R207-TypeOrganisationInterne/TRE_R207-TypeOrganisationInterne.pdf)) |
| categorieOrganisation : [0..1] Code <[TRE_R244-CategorieOrganisation](https://mos.esante.gouv.fr/NOS/TRE_R244-CategorieOrganisation/TRE_R244-CategorieOrganisation.pdf)> | Type­[0..*] CodeableConcept ([TRE_R244-CategorieOrganisation](https://mos.esante.gouv.fr/NOS/TRE_R244-CategorieOrganisation/TRE_R244-CategorieOrganisation.pdf)) |
| lieu : [0..*] Lieu | Extension : DMI_OrganizationLocation[0..*] Reference (Location) |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta |

#### Classe DimensionDM :

Classe utilisée dans le profil DMI_DeviceDefinition

| | | | |
| :--- | :--- | :--- | :--- |
| ****Nom classes**** | ****Nom attributs**** | ****Nom classes**** | ****Nom attributs**** |
| DimensionsDM [0..1] | volume : [0..1] Mesure | DeviceDefinition | physicalCharacteristics [0..1].nominalVolume [0..1] Quantity |
| longueur : [0..1] Mesure | physicalCharacteristics [0..1].height[0..1] Quantity | | |
| calibre : [0..1] Mesure | Extension :physicalCharacteristics.DMI_InternalDiameter[0..1] Quantity | | |
| diametre : [0..1] Mesure | physicalCharacteristics [0..1].externalDiameter [0..1] Quantity | | |
| poids : [0..1] Mesure | physicalCharacteristics [0..1].weight [0..1] Quantity | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |

#### Classe fabricant et distributeur :

Classe utilisée dans le profil DMI_Organization_EJ étendant le profil OrganizationRASS

| | | | |
| :--- | :--- | :--- | :--- |
| ****Nom classes**** | ****Nom attributs**** | ****Nom classes**** | ****Nom attributs**** |
| Distributeur [0..1] | EntiteJuridique [1..1] | Organization | L’élément est décrit dans la partie « EntiteJuridique» |
| identifiantLocalDistributeur : [0..*] Identifiant | Extension : DMI_IdentifiantLocalDistributeur [0..*] Identifier | | |
| Fabricant**[**1..1] | EntiteJuridique [1..1] | Organization | L’élément est décrit dans la partie « EntiteJuridique» |
| identifiantLocalFabricant: [0..*] Identifiant | Extension : DMI_IdentifiantLocalFabricant [0..*] Identifier | | |

#### Classe patient :

Classe utilisée dans le profil DMI_Patient étendant le profil FrPatient

| | | | |
| :--- | :--- | :--- | :--- |
| ****Nom classes**** | ****Nom attributs**** | ****Nom classes**** | ****Nom attributs**** |
| Patient | identite : [1..1] INS | Patient | Voir partie 7.9 |
| identifiantLocal : [0..1] Identifiant | Identifier [0..*] identifier | | |
| personne : [1..1] PersonnePhysique | Voir partie 7.10 | | |
| adresseCorrespondance : [0..*] Adresse | Address [0..*] FrContactPoint | | |
| telecommunication : [1..*] Telecommunication | Contact.telecom[1..*] FrContactPoint | | |
| metadonnee : [1..1] Metadonnee | Meta[1..1] meta | | |

#### Classe INS :

Classe utilisée dans le profil DMI_Patient étendant le profil FrPatient

| | | | |
| :--- | :--- | :--- | :--- |
| ****Nom classes**** | ****Nom attributs**** | ****Nom classes**** | ****Nom attributs**** |
| INS | matriculeINS : [1..1][Identifiant](https://mos.esante.gouv.fr/14.html#_b3e8d18a-99e9-4a18-bef7-cb2444650c8a) | Patient | Identier [0..*] identifier.valueIdentifier. [0..*] identifier.system |
| nomFamille : [1..1][Texte](https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21) | Name [0..*].family HumanNameAvec Name.use = official | | |
| prenomActeNaissance : [1..1][Texte](https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21) | Name [0..*].text HumanNameAvec Name.use = official | | |
| premierPrenomActeNaissance : [1..1][Texte](https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21) | Name [0..*].given HumanNameAvec Name.use = official | | |
| nomUtilise : [1..1][Texte](https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21) | Name [0..*].family HumanNameAvec Name.use = usual | | |
| prenomUtilise : [1..1][Texte](https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21) | Name [0..*].given HumanNameAvec Name.use = usual | | |
| sexe : [1..1][Code](https://mos.esante.gouv.fr/14.html#_b1f1f204-62aa-4fde-80ce-b208fe6a73f5) | Gender [0..*] code | | |
| dateNaissance : [1..1][DateHeure](https://mos.esante.gouv.fr/14.html#_6b5f1df4-9624-4e39-b260-2907885a60a3) | birthDate [0..*] date | | |
| lieuNaissance : [1..1] Address | Extension [1..1]  : http://hl7.org/fhir/StructureDefinition/patient-birthPlace | | |
| metadonnee : [0..1][Metadonnee](https://mos.esante.gouv.fr/13.html#_48f184fe-b2a3-4d25-8dad-d7b07c660857) | Meta [0..1] meta | | |

#### Classe personne physique :

Classe utilisée dans le profil DMI_Patient ainsi que dans le profil DMI_Practitioner

| | | | |
| :--- | :--- | :--- | :--- |
| ****Nom classes**** | ****Nom attributs**** | ****Nom classes**** | ****Nom attributs**** |
| PersonnePhysique | nomFamille : [0..1] Texte | Patient/Practitioner | Name [1..1].family HumanNameAvec Name.use = official |
| prenom : [0..1] Texte | Name [1..1].given HumanNameAvec Name.use = usual | | |
| sexe : [0..1] Code | Gender [1..1] code | | |
| dateNaissance : [0..1] Date | birthDate [1..1] date | | |
| metadonnee : [1..1] | Meta[1..1] meta | | |

#### Classe Professionnel :

| | | | |
| :--- | :--- | :--- | :--- |
| ****Nom classes**** | ****Nom attributs**** | ****Nom classes**** | ****Nom attributs**** |
| Practitioner | idNat_PS : [1..1] Identifiant | Practitioner | Identifier [1..1].Identifier |
| idPP : [1..1] Identifiant | Identifier [1..1].Identifier | | |
| personne : [0..1] PersonnePhysique | Voir partie 1.14 | | |
| adresseCorrespondance : [0..*] Adresse | Address [0..*] FrAddress | | |
| telecommunication : [1..*] Telecommunication | Telecom [1..*] FrContactPoint | | |
| metadonnee : [1..1] Metadonnee | Meta[1..1] meta | | |

1. https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf [↩](#fnref:1)
1. http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html [↩](#fnref:2)
1. [https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante](https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante) [↩](#fnref:3)
1. [http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport](http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport) [↩](#fnref:4)
1. [https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf)section 3.20 [↩](#fnref:5)
1. [https://www.hl7.org/fhir/http.html#create](https://www.hl7.org/fhir/http.html#create) [↩](#fnref:6)
1. https://www.hl7.org/fhir/http.html#trules [↩](#fnref:7)
1. https://www.hl7.org/fhir/http.html#transaction-response [↩](#fnref:8)
1. [https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf)Section 3.81 [↩](#fnref:9)
1. [https://www.hl7.org/fhir/http.html#search](https://www.hl7.org/fhir/http.html#search) [↩](#fnref:10)
1. [https://www.hl7.org/fhir/http.html#read](https://www.hl7.org/fhir/http.html#read) [↩](#fnref:11)

