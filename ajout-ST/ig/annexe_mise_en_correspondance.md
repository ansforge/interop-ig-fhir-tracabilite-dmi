# Mise en correspondance - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Autres Ressources**](autres_ressources.md)
* **Mise en correspondance**

## Mise en correspondance

### Flux 22 : TransmissionTrace

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

Mise en correspondance des contenus métiers/standard du flux 22

Le contenu de l’évènement (ObjetEvenement) varie en fonction du cas d’utilisation. Il sera détaillé dans les flux suivants.

Le contenu peut être structuré et ainsi transporter les classes des objets métiers. Le contenu peut aussi être non-structuré et ainsi transporter les informations métiers encodés en binaire.

Si possible il faut privilégier l’utilisation d’un contenu structuré.

### Flux 1c – TracabiliteDemande

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1]**ObjetBinaire (Le contenu de l’ObjetEvenement est une demande. Cet élément est décrit dans une partie spécifique « Demande ») | entity[0..*].what [0..1] Reference (Bundle) | | |
| Demande [1..1] | EntêteDemande [1..1] | Bundle (Suit le profil DMI_BundleRequest) | Entry [0..*] BackboneElement |
| LigneDemande [1..*] | | | |
| EntêteDemande [1..1] | reference : [1..1] Identifiant | SupplyRequest (Suit le profil DMI_SupplyRequestEnteteDemande) | identifier [0..*] Identifier |
| natureDemande : [0..1] Texte | category [0..1] codeableConcept | | |
| quantiteTotale : [0..1] Numerique | quantity [1..1] Quantity | | |
| dateDem : [0..1] Date | authoredOn [0..1] dateTime | | |
| supprDemande : [0..1] boolean | status [0..1] code | | |
| motifSuppr : [0..1] Texte | text [0..1] Narrative | | |
| Type événement [0..1] : Code | Item [1..1].itemCodeableConcept CodeableConceptTRE_R254-TypeEvenement | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| Professionnel [1..1] | Requester[0..1] Reference(Practitioner) | | |
| OrganisationInterne [1..1] | deliverTo[0..1]Reference (Organization) | | |
| LigneDemande [1..*] | IdLigneAssocieeEntete [0..1] | DeviceRequest (Pour chaque occurrence de l’élément LigneDemande on va créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest) | groupIdentifier [0..1] Identifier |
| EnteteDemandeAssociee [1..1] | basedOn [0..1] Reference (SupplyRequest) | | |
| DispositifMedical [1..1] | Subject [1..1] Reference ([Patient](http://hl7.org/fhir/patient.html)|[Group](http://hl7.org/fhir/group.html)|[Location](http://hl7.org/fhir/location.html)|[Device](http://hl7.org/fhir/device.html)) | | |
| TypeLigneDemande [1..1] | Intent [1..1] Code | | |
| dateUtilisation [0..1] Date | OccurenceDateTime [0..1] Date | | |
| Metadonne : [1..1] Metadonnee | meta [0..1] Meta | | |
| NomDispositifDemande [1..1] | code [1..1].codeCodeableConcept.textString | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1] :**ObjetBinaire Le contenu de l’ObjetEvenement est le contenu non structuré de la demande | entity[0..*].detail [0..1].valueBase64Binary [1..1] base64Binary  | | |

Mise en correspondance des contenus métiers/standard du flux 1c

### Flux 2a - TracabilitéReponse

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau FLux 22](#flux-22-transmissiontrace) | Cf[Tableau FLux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu [0..1] (Le contenu de l’ObjetEvenement est une « Reponse ». Cet élément est décrit dans une partie spécifique « Reponse ») | entity[0..*].what [0..1] Reference (Bundle) | | |
| Reponse [1..1] | EntêteReponse [1..1] | Bundle (Suit le profil DMI_BundleRequest) | Entry [0..*] BackboneElement |
| DetailReponse [1..*] | | | |
| EntêteReponse [1..1] | reference : [1..1] Identifiant | SupplyRequest (Suit le profil DMI_SupplyRequestEnteteReponse) | identifier [0..*] Identifier |
| dateDem : [0..1] Date | authoredOn [0..1] dateTime | | |
| quantiteTotale : [0..1] Numerique | quantity [1..1] Quantity | | |
| infoCompl : [0..1] Texte | text [0..1] Narrative | | |
| TypeEvenement [1..1] Code | Item [1..1].itemCodeableConcept CodeableConceptTRE_R254-TypeEvenement | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| DetailReponse [1..*] | IdDetailReponseAssocieEnteteReponse [0..1] | DeviceRequest (Pour chaque occurrence de l’élément DetailReponse on va créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest) | groupIdentifier [0..1] Identifier |
| EntêteReponseAssociee [0..1] | basedOn [0..1] Reference (SupplyRequest) | | |
| NomDispostifDemande [1..1] | code [1..1].codeCodeableConcept.textString | | |
| TypeDetailReponse [1..1] | Intent [1..1] Code | | |
| dateDelivrance : [0..1] Date | occurenceDateTime [0..1] dateTime | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| DispositifMedical [1..1] | Subject [1..1] Reference ([Patient](http://hl7.org/fhir/patient.html)|[Group](http://hl7.org/fhir/group.html)|[Location](http://hl7.org/fhir/location.html)|[Device](http://hl7.org/fhir/device.html)) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] ObjetBinaire**(Le contenu de l’ObjetEvenement est le contenu non structuré de la « Reponse ») | entity[0..*].detail [0..1]. valueBase64Binary  [1..1] base64Binary  | | |

Mise en correspondance des contenus métiers/standard du flux 2a

### Flux 27 – TracabiliteCommande

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace », précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement, ObjetEvenement.

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau FLux 22](#flux-22-transmissiontrace) | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu : [0..1] ObjetBinaire (Le contenu de l’ObjetEvenement est une commande. Cet élément est décrit dans une partie spécifique « Commande ») | entity[0..*].what [0..1] Reference (Bundle) | | |
| Commande [1..1] | EntêteCommande [1..1] | Bundle (Suit le profil DMI_BundleRequest) | Entry [0..*] BackboneElement |
| Ligne [1..*] | | | |
| EntêteCommande [1..1] | refCommande : [1..1] Identifiant | SupplyRequest (Suit le profil DMI_SupplyRequestEnteteCommande) | identifier [0..*] Identifier |
| type : [0..1] Code | category [0..1] CodeableConcept | | |
| quantiteTotale : [0..1] Numerique | quantity [1..1] Quantity | | |
| date : [0..1] DateHeure | authoredOn [0..1] dateTime | | |
| TypeEvenement [1..1] Code | Item [1..1].itemCodeableConcept CodeableConceptTRE_R254-TypeEvenement | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| OrganisationInterne [0..1] | deliverTo[0..1] Reference(Organization) | | |
| Professionnel [0..1]> | Requester[0..1] Reference(Practitioner) | | |
| LigneCommande [1..*] | IdLigneAssocieeEnteteCommande [0..1] | DeviceRequest (Pour chaque occurrence de l’élément LigneCommande on va créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest) | groupIdentifier [0..1] Identifier |
| EnteteCommandeAssociee [1..1] | basedOn [0..1] Reference (SupplyRequest) | | |
| DispositifMedical [1..1] | Subject [1..1] Reference ([Patient](http://hl7.org/fhir/patient.html)|[Group](http://hl7.org/fhir/group.html)|[Location](http://hl7.org/fhir/location.html)|[Device](http://hl7.org/fhir/device.html)) | | |
| TypeLigneCommande [1..1] | Intent [1..1] Code | | |
| dateUtilisation : [0..1] Date | Occurrence [0..1].occurenceDateTime dateTime | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| DispostifCommande [1..1] | code[1..1].codeReference Reference(Device) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1]:**ObjetBinaire (Le contenu de l’ObjetEvenement est le contenu non structuré de la commande) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] base64Binary | | |

Mise en correspondance des contenus métiers/standard du flux 27

### Flux 5 – TracabiliteLivraisonValide

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] Objet binaire**(Le contenu de l’ObjetEvenement est une livraison. Cet élément est décrit dans une partie spécifique « Livraison ») | entity[0..*].what [0..1] Reference (Bundle) | | |
| Livraison [1..1] | EnteteLivraison [1..1] | Bundle (Suit le profil DMI_BundleDelivery) | Entry [0..*] BackboneElement |
| LigneLivraison [1..*] | | | |
| EnteteLivraison [1..1] | referenceCommande : [1..1] Identifiant | SupplyDelivery (Suit le profil DMI_SupplyDeliveryEntêteLivraison) | basedOn [0..*] Reference (SupplyRequest) |
| quantiteTotale : [0..1] Numerique | suppliedItem[0..1].quantity [0..1] SimpleQuantity | | |
| dateLivraison : [1..1] DateHeure | occurrenceDateTime [0..1] dateTime | | |
| livraisonConforme : [0..1] boolean | status [0..1] code | | |
| motifRejet : [0..1] Texte | text [0..1] Narrative | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| Professionnel [1..1] | Receiver [0..*] Reference(Practitioner | PractitionerRole) | | |
| **OrganisationInterne [1..1]** | **Extension : DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)** | | |
| LigneLivraison [1..*] | ReferenceCommandeAssociee [1..1] | SupplyDelivery (Pour chaque occurrence de l’élément LigneLivraison on va créer une ressource SupplyDelivery suivant le profil DMI_SupplyDeliveryLigne) | basedOn[0..*] Reference (SupplyRequest) |
| ReferenceEntêteLivraison [1..1] | Part of [0..*] Reference (SupplyDelivery) | | |
| dateLivraison : [1..1] DateHeure | occurrenceDateTime [0..1] dateTime | | |
| livraisonConforme : [0..1] boolean | status [0..1] code | | |
| motifRejet : [0..1] Texte | text [0..1] Narrative | | |
| DispositifMedical [1..*] | suppliedItem[0..1].itemReference [0..1] Reference(Medication | Substance | Device) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu : Objet binaire [0..1] (Le contenu de l’ObjetEvenement est le contenu non structuré de la « Livraison ») | entity[0..*].detail [0..1]. valuebase64Binary  | | |

Mise en correspondance des contenus métiers/standard du flux 5

### Flux 5a - TracabiliteLivraisonRejet

Ce flux reprend les mêmes éléments que le flux 5

### Flux 5c – TracabiliteEntreeStockDMI

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1]ObjetBinaire**(Le contenu de l’ObjetEvenement est l’ensemble des éléments Cet élément est décrit dans une partie spécifique « ReceptionUnitaire ») | entity[0..*].what [0..1] Reference (SupplyDelivery) | | |
| ReceptionUnitaire [1..1] | StatutReception [1..1] | SupplyDelivery (Suit le profil DMI_SupplyDeliveryReceptionUnitaire) | Cet élément est décrit dans une partie spécifique « StatutReception ». |
| Professionnel [1..1] | Receiver [0..*] Reference(Practitioner | PractitionerRole) | | |
| OrganisationInterne [1..1] | **Extension : DMI_ReferenceOrganisationInterne[1..1] Reference (Organization)** | | |
| DispositifMedical [1..1] | suppliedItem[0..1].itemReference [0..1] Reference(Medication | Substance | Device) | | |
| StatutReception [1..1] | receptionConforme : [1..1] boolean | statut [0..1] code | |
| motifRejet : [0..1] Texte | text [0..1] Narrative | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu: [0..1] ObjetBinaire (Le contenu de l’ObjetEvenement est le contenu non structuré de la « ReceptionUnitaire ») | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |

### Flux 5d – TracabiliteReceptionDMI

Ce flux reprend les mêmes éléments que le flux 5c.

### Flux 5e – TracabiliteRejetDMI 

Ce flux reprend les mêmes éléments que le flux 5c.

### Flux 6a – TracabiliteSortieStock 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu : [0..1] ObjetBinaire**(Le contenu de l’ObjetEvenement est une délivrance. Cet élément est décrit dans une partie spécifique « Delivrance ») | entity[0..*].what [0..1] Reference (Bundle) | | |
| Délivrance [1..1] | EntêteDelivrance [1..1] | Bundle (Suit le profil DMI_BundleDelivery) | Entry [0..*] BackboneElement |
| LigneDelivrance [1..*] | Entry [0..*] BackboneElement | | |
| EntêteDelivrance [1..1] | referenceDelivrance : [1..1] Identifiant | SupplyDelivery (Suit le profil DMI_SupplyDeliveryEnteteDelivrance) | identifier [0..*] Identifier |
| dateDelivrance : [0..1] Date | occurrenceDateTime [0..1] dateTime | | |
| quantiteDelivree : [0..1] Numerique | suppliedItem[0..1].quantity [0..1] SimpleQuantity | | |
| informationComplementaire : [0..1] Texte | text [0..1] Narrative | | |
| metadonnee [1..1] : Metadonnee | meta [0..1] Meta | | |
| OrganisationInterne [1..1] | Extension : DMI_ReferenceOrganisationInterne[1..1]Reference (Organization) | | |
| LigneDelivrance [1..*] | Cet élément est décrit dans une partie spécifique « LigneDelivrance ». | | |
| LigneDelivrance [1..*] | ReferenceDemandeAssociee [1..1] | SupplyDelivery (Pour chaque occurrence de l’élément LigneDelivrance on va créer une ressource SupplyDelivery suivant le profil DMI_SupplyDeliveryLigne) | basedOn[0..*] Reference (SupplyRequest) |
| ReferenceEntêteDelivrance [1..1] | Part of [0..*] Reference(SupplyDelivery) | | |
| dateDelivrance : [1..1] DateHeure | occurrenceDateTime [0..1] dateTime | | |
| informationComplementaire : [0..1] Texte | text [0..1] Narrative | | |
| DispositifMedical [1..1] | suppliedItem[0..1].itemReference [0..1] Reference(Medication | Substance | Device) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu : [0..1]ObjetBinaire (Le contenu de l’ObjetEvenement est le contenu non structuré de la délivrance) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |

Mise en correspondance des contenus métiers/standard du flux 6a

### Flux 7 – TracabiliteDelivranceSU 

Ce flux reprend les mêmes éléments que le flux 6a.

### Flux 9 – TracabiliteTransportDMI 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu : [0..1]ObjetBinaire (Le contenu de l’ObjetEvenement est un transport. Cet élément est décrit dans une partie spécifique « Transport ») | entity[0..*].what [0..1] Reference (SupplyDelivery) | | |
| Transport [1..1] | referenceTransport : [1..1] Identifiant | SupplyDelivery (Suit le profil DMI_SupplyDeliveryTransport) | **Extension(Complex) : DMI_transport[0..1].refTransport [1..1] Identifier** |
| referenceDelivrance : [1..1] Identifiant | **Extension(Complex) : DMI_transport[0..1].refDelivery [1..1] Identifier** | | |
| dateDelivrance : [0..1] Date | occurence [0..1].occurenceDateTime dateTime | | |
| quantiteTransportee : [0..1] Numerique | suppliedItem [0..1].quantity SimpleQuantity | | |
| IncidentTransport : [0..1] boolean | **Extension(Complex) : DMI_transport[0..1].incident [0..1] code** | | |
| detailIncident : [0..1] Texte | **Extension(Complex) : DMI_transport[0..1].detailIncident [0..1] string** | | |
| informationComplementaire : [0..1] Texte | **Extension(Complex) : DMI_transport[0..1].text [0..1] string** | | |
| metadonnee : [1..1] Metadonnee | **Extension(Complex) : DMI_transport[0..1].meta [1..1] Meta** | | |
| Professionnel [1..1] | Receiver [0..*] Reference (Practitionner, PractitionnerRole) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu [0..1] : Objet binaire (Le contenu de l’ObjetEvenement est le contenu non structuré du transport) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |

Mise en correspondance des contenus métiers/standard du flux 9

### Flux 11 – TracabiliteEntreStock 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau FLux 22](#flux-22-transmissiontrace) | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu : [0..1] Objet binaire (Le contenu de l’ObjetEvenement est la réception du DMI. Cet élément est décrit dans une partie spécifique « ReceptionDMI ») | entity[0..*].what [0..1] Reference (Bundle) | | |
| ReceptionDMI [1..1] | EntêteReceptionDMI [1..1] | Bundle (Suit le profil DMI_BundleDelivery) | Entry [0..*] BackboneElement |
| LigneReceptionDMI [1..*] | Entry [0..*] BackboneElement | | |
| EntêteReceptionDMI [1..1] | referenceReception : [1..1] Identifiant | SupplyDelivery (Suit le profil DMI_SupplyDeliveryEntêteReceptionDMI) | identifier [0..*] Identifier |
| referenceDelivrance : [1..1] Identifiant | basedOn [0..1] Reference (SupplyDelivery) | | |
| quantiteReceptionnee : [0..1] Numerique | suppliedItem[0..1].quantity [0..1] SimpleQuantity | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| OrganisationInterne [1..1] | **Extension : DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)** | | |
| **Professionnel [1..1]</td> receiver [0..*] Reference (Practitioner | PractitionerRole) </tr>  LigneReceptionDMI [1.*] Cet élément est décrit dans une partie spécifique “LigneReceptionDMI”   LigneReceptionDMI [1..*] ReferenceDemandeAssociee [1..1] SupplyDelivery (Pour chaque occurrence de l’élément LigneReceptionDMI on va créer une ressource SupplyDelivery suivant le profil DMI_SupplyDeliveryLigne) basedOn[0..*] Reference (SupplyRequest)   ReferenceEntêteReceptionDMI [1..1] Part of [0..*] Reference(SupplyDelivery)   dateReceptionSU [1..1] DateHeure Occurrence [0..1].occurenceDateTime dateTime   receptionConforme : [1..1] boolean Status [0..1] code   motifRejet : [0..1] Texte text [0..1] Narrative   Metadonnee [1..1] : Metadonnee meta [0..1] Meta   DispositifMedical [1..1] suppliedItem[0..1].itemReference [0..1] Reference (Medication | Substance | Device)   ObjetEvenement [0..*] type [0..1] Code AuditEvent entity[0..*].type [0..1] Coding   Contenu[0..1] Objet binaire (Le contenu de l’ObjetEvenement est le contenu non structuré de la réception) entity[0..*].detail [0..1]. valueBase64Binary [1..1]  </tbody> </table> Mise en correspondance des contenus métiers/standard du flux 11 ### Flux 12 – TracabiliteReceptionSU  Ce flux reprend les mêmes éléments que le flux 11. ### Flux 28- TracabiliteRejetDMI Ce flux reprend les mêmes éléments que le flux 11. ### Flux 15 -TracabilitePose Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement : 
| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | Cf[Tableau Flux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1]**ObjetBinaire (Le contenu de l’ObjetEvenement est une intervention médicale. Cet élément est décrit dans une partie spécifique « InterventionMedicale ») | entity[0..*].what [0..1] Reference (Procedure) | | |
| InterventionMedicale [1..1] | idIntervention : [1..1] Identifiant | Procedure (Pour l’élément InterventionMedicale on va créer une ressource Procedure suivant le profil DMI_Procedure) | identifier [0..*] Identifier |
| numSejour : [0..1] Identifiant | identifier [0..*] Identifier | | |
| typeIntervention : [0..1] Code | category [0..1] CodeableConcept | | |
| dateIntervention : [1..1] DateHeure | performedDateTime [0..1] dateTime | | |
| emplacementDMI : [1..1] Texte | bodySite [0..*] CodeableConcept | | |
| poseConforme : [1..1] Boolean | Complication [0..*] CodeableConcept | | |
| motifEchec : [0..1] Texte | | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| Professionnel : [1..1] | performer[0..*].actor [1..1] Reference([Practitioner](https://hl7.org/FHIR/practitioner.html) | [PractitionerRole](https://hl7.org/FHIR/practitionerrole.html)) | | |
| OrganisationInterne : [1..1] | performer [0..*].onBehalfOf Reference (Organization) | | |
| DispositifMedical : [1.1]. | focalDevice[0..*].manipulated [1..1] Reference(Device) | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu : [0..1] Objet binaire (Le contenu de l’ObjetEvenement est le contenu non structuré de l’intervention médicale) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |
 ### Flux 13a – TracabiliteRefusDMI  Ce flux reprend les mêmes éléments que le flux 15. ### Flux 30 – TracabiliteSortieStockSU Ce flux reprend les mêmes éléments que le flux 15. ### Flux 14 – TracabiliteEchecPose  Ce flux reprend les mêmes éléments que le flux 15. ### Flux 16a – TracabiliteReassortDMI  Ce flux reprend les mêmes éléments que le flux 27. ### Flux 18 – TracabiliteFacturationDMI  Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement : 
| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace [1..1] | Cf[Tableau FLux 22](#flux-22-transmissiontrace) | Cf[Tableau FLux 22](#flux-22-transmissiontrace) | |
| SourceTrace [1..1] | | | |
| Événement [1..1] | | | |
| ActeurEvenement [0..2] | | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| **Contenu [0..1]**ObjetBinaire (Le contenu de l’ObjetEvenement est une facture. Cet élément est décrit dans une partie spécifique « Facture ») | entity[0..*].what [0..1] Reference (Invoice) | | |
| Facture [1..1] | refFacture : [1..1] Identifiant | Invoice (Pour l’élémentFacture on va créer une ressource Invoice suivant le profil DMI_Invoice) | identifier [0..*] Identifier |
| facture : [0..1] ObjetBinaire | **Extension : DMI_Facture [0..1] Reference (Binary)** | | |
| typeFacture : [0..1] Code | type [0..1] CodeableConcept | | |
| refCommande : [1..1] Identifiant | identifier [0..*] Identifier | | |
| dateEmission : [0..1] Date | date [0..1] dateTime | | |
| instructionPaiement : [0..1] Texte | paymentTerms [0..1] markdown | | |
| montantTotal : [0..1] Numerique | totalNet [0..1] Money | | |
| Devise [0..1] code | totalNet[0..1].currency [0..1] code | | |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| Ligne : [1.*](Cet élément est décrit dans une partie spécifique « Ligne » | L’élément ligne est décrit dans une partie spécifique “Ligne”) | | |
| Ligne [1..*] | dateAchat : [1..1] Date | Invoice | lineItem[0..*].chargeItemReference[1..1].occurenceDateTime[0..1] |
| metadonnee : [1..1] Metadonnee | meta [0..1] Meta | | |
| DispositifMedical : [1..1] | lineItem [0..*].chargeItem [1..1].chargeItem.productReference [0..1] | | |
| ObjetEvenement [0..*] | type [0..1] Code | AuditEvent | entity[0..*].type [0..1] Coding |
| Contenu : [0..1] Objet binaire (Le contenu de l’ObjetEvenement est le contenu non structuré de la facture) | entity[0..*].detail [0..1]. valueBase64Binary [1..1] | | |
 ### Flux 23 - RechercheTraces Ce flux intervient lorsque le consommateur effectue une recherche de traces d’un ou de plusieurs DMI se trouvant dans l’établissement de santé auprès du gestionnaire de traçabilité en précisant les critères de sa recherche. Il correspond au « Flux 4 -RechercheTraces » du volet « Traçabilité des évènements ». Ci-dessous les critères de recherches. Les critères apparaissant *en italique et en rouge* correspondent à des paramètres de recherche créés pour répondre au besoin : 
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
| | | | |
| :--- | :--- | :--- | :--- |
| DispositifMedical/referenceFabricant |  | manufacturer: String | |
| DispositifMedical/support/IUD-IPNumLot |  | **DMI_Device_lotNumber : string** | |
| DispositifMedical/support/IUD-IPNumSerie |  | **DMI_Device_serialNumber : string** | |
| DispositifMedical/codeEMDN |  | **DMI_Device_definition-type : token** | |
| Patient/identite/matriculeINS | Patient |  | **DMI_Patient_INS : token** |
### Flux 24 – ReponseRechercheTraces Il s’agit du résultat de la recherche de traces retourné par le gestionnaire de traçabilté. La recherche de traces retourne une ressource Bundle de type SearchSet contenant les ressources AuditEvent correspondant aux critères de recherche fournis par le consommateur. Il correspond au « Flux 5 -ReponseRechercheTraces » du volet « Traçabilité des évènements ». ### Flux 25 – ConsulterTrace Ce flux intervient lorsque le consommateur demande à consulter la trace d’un évènement auprès du gestionnaire de traçabilité. Il correspond au « Flux 2 -ConsultationTrace » du volet « Traçabilité des évènements » :
| | | | |
| :--- | :--- | :--- | :--- |
| **Nom classes** | **Nom attributs** | **Ressource** | **Elément** |
| Trace | identifiant [0..1] : Identifiant | AuditEvent | id [1..1] id |
Mise en correspondance des contenus métiers/standards du flux 25### Flux 26 – ReponseConsulterTrace Il s’agit du résultat de la demande de consultation de la trace d’un évènement retourné par le gestionnaire de traçabilité. Le corps de la réponse est la ressource AuditEvent identifiée lors de la demande. Il correspond au « Flux 3 - ReponseConsultationTrace » du volet « Traçabilité des évènements ». | |
** | | | |

