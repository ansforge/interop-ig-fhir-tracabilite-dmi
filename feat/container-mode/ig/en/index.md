# Accueil - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Accueil

 **Brief description of this Implementation Guide**
 This Implementation Guide defines the functional and technical framework for implementing traceability of Implantable Medical Devices (IMDs) within French healthcare institutions, in compliance with the CI SIS interoperability framework. It specifies how traceability events related to the IMD lifecycle including ordering, reception, stock management, implantation, and invoicing are created, transmitted, searched, and consulted using HL7 FHIR R4 resources and profiles, based on the generic Event Traceability framework (IHE ATNA / RESTful ATNA). 

>  **Attention !** 
 Cet Implementation Guide est actuellement en concertation. La version courante est accessible à l'adresse : http://interop.esante.gouv.fr/ig/fhir/[code - ig] 

### Introduction

Ce guide d’implémentation (IG) décrit les mécanismes d’interopérabilité permettant d’assurer la traçabilité des dispositifs médicaux implantables (DMI) au sein d’un établissement de santé.

La traçabilité couvre l’ensemble du cycle de vie du DMI dans l’établissement, depuis sa réception jusqu’à sa pose chez le patient, ainsi que les évènements associés à sa gestion logistique, sanitaire et financière.

Elle vise à répondre aux exigences réglementaires nationales et européennes relatives à la traçabilité des dispositifs médicaux implantables, notamment en matière de matériovigilance et d’enregistrement de l’Identifiant Unique du Dispositif (IUD).

Sur le plan technique, cet IG s’inscrit dans le cadre du Cadre d’Interopérabilité des Systèmes d’Information de Santé (CI-SIS) et constitue une instanciation du volet générique « Traçabilité d’évènements ».
 Il repose sur le profil IHE ATNA et son supplément RESTful ATNA, ainsi que sur l’utilisation de la ressource HL7 FHIR R4 AuditEvent et des ressources métier associées.

Ce guide formalise les règles nécessaires à :

* la création et la transmission des traces d’évènements liés aux DMI,
* la recherche de traces selon des critères métier,
* la consultation détaillée d’une trace.

### Périmètre du projet

Cet IG définit le périmètre fonctionnel et technique de la mise en œuvre de la traçabilité des dispositifs médicaux implantables dans le cadre du CI-SIS.

Il couvre les évènements de traçabilité relatifs aux principales étapes du circuit du DMI en établissement de santé, notamment :

* la demande et la commande,
* la réception et le contrôle,
* l’entrée et la sortie de stock,
* la délivrance au service utilisateur,
* le transport interne,
* la réception par le service utilisateur,
* la pose chez le patient,
* le refus ou l’échec de pose,
* le réassort,
* la facturation.

L’IG spécifie :

* les acteurs impliqués (source de traçabilité, gestionnaire de traçabilité, consommateur),
* les flux d’échange associés,
* les ressources FHIR profilées utilisées,
* les règles d’interopérabilité applicables.

Ne sont pas couverts par cet IG :

* l’organisation interne des processus métiers au sein des établissements,
* les modalités de gestion locale des stocks,
* les aspects fonctionnels du dossier patient hors données strictement nécessaires à la traçabilité.

Le périmètre se limite aux mécanismes d’échange interopérables nécessaires à la gestion des traces, conformément au cadre CI-SIS.

### Standards utilisés

Les données véhiculées dans ce volet ainsi que les interactions entre les systèmes reposent sur le standard HL7 FHIR Release 4.

Les interactions font référence à un certain nombre de ressources du standard ainsi qu’aux spécifications de l’API REST FHIR, basées sur le protocole HTTP dans sa version sécurisée HTTPS. Les syntaxes retenues sont la syntaxe XML et JSON.

#### Ressources FHIR profilées

Les ressources profilées dans le cadre de ce guide d'implémentation sont les suivantes :

| | | |
| :--- | :--- | :--- |
| Profil parent | Profil | Description |
| [Bundle](http://hl7.org/fhir/StructureDefinition/Bundle) | [DMIBundleDelivery](StructureDefinition-dmi-bundledelivery.md) | Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant la réception, la délivrance et la livraison d’un DMI. |
| [Bundle](http://hl7.org/fhir/StructureDefinition/Bundle) | [DMIBundleRequest](StructureDefinition-dmi-bundle-request.md) | Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant une commande, une demande et la réponse à la demande d’un DMI. |
| [Bundle](http://hl7.org/fhir/StructureDefinition/Bundle) | [DMIBundleTransmissionTraces](StructureDefinition-dmi-bundle-transmission-traces.md) | Profil créé dans le cadre de ce volet pour transmettre l’ensemble des ressources au serveur. |
| [Device](http://hl7.org/fhir/StructureDefinition/Device) | [DMIDevice](StructureDefinition-dmi-device.md) | Profil créé dans le cadre de ce volet pour représenter une instance physique d’un dispositif médical. |
| [DeviceDefinition](http://hl7.org/fhir/StructureDefinition/DeviceDefinition) | [DMIDeviceDefinition](StructureDefinition-dmi-devicedefinition.md) | Profil créé dans le cadre de ce volet pour représenter un modèle de dispositif médical. |
| [DeviceRequest](http://hl7.org/fhir/StructureDefinition/DeviceRequest) | [DMIDeviceRequest](StructureDefinition-dmi-devicerequest.md) | Profil créé dans le cadre de ce volet permettant d’effectuer une commande, demande, et la réponse à une demande de dispositif médical. |
| [Invoice](http://hl7.org/fhir/StructureDefinition/Invoice) | [DMIInvoice](StructureDefinition-dmi-invoice.md) | Profil créé dans le cadre de ce volet pour représenter la facturation de dispositifs médicaux. |
| [FR Core Organization Profile](https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization) | [DMIOrganizationEJ](StructureDefinition-dmi-organization-ej.md) | Profil créé dans le cadre de ce volet étendant le profil « FrOrganization ». Ce profil est utilisé pour représenter le fabricant et les distributeurs des DM. |
| [FR Core Organization Profile](https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization) | [DMIOrganizationInterne](StructureDefinition-dmi-organization-interne.md) | Profil créé dans le cadre de ce volet permettant de représenter l’organisation interne (Service utilisateur). |
| [FR Core Patient Profile](https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient) | [DMIPatient](StructureDefinition-dmi-patient.md) | Profil créé dans le cadre de ce volet étendant le profil français « FrPatient » publié par Interop’Santé. |
| [FR Core Practitioner Profile](https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner) | [DMIPractitioner](StructureDefinition-dmi-practitioner.md) | Profil créé dans le cadre de ce volet étendant le profil « FrPractitionner» publié par Interop’Santé. |
| [Procedure](http://hl7.org/fhir/StructureDefinition/Procedure) | [DMIProcedure](StructureDefinition-dmi-procedure.md) | Profil créé dans le cadre de ce volet pour représenter l’intervention clinique ou chirurgicale implantant un dispositif médical. |
| [SupplyDelivery](http://hl7.org/fhir/StructureDefinition/SupplyDelivery) | [DMISupplyDeliveryEnteteDelivrance](StructureDefinition-dmi-supplydelivery-entete-delivrance.md) | Profil créé dans le cadre de ce volet pour représenter l’entête des informations de la délivrance de dispositifs médicaux. |
| [SupplyDelivery](http://hl7.org/fhir/StructureDefinition/SupplyDelivery) | [DMISupplyDeliveryEnteteLivraison](StructureDefinition-dmi-supplydelivery-entete-livraison.md) | Profil créé dans le cadre de ce volet pour représenter l’entête des informations de livraison de dispositifs médicaux. |
| [SupplyDelivery](http://hl7.org/fhir/StructureDefinition/SupplyDelivery) | [DMISupplyDeliveryEnteteReception](StructureDefinition-dmi-supplydelivery-enteter-reception.md) | Profil créé dans le cadre de ce volet pour représenter l’entête des informations de réception des dispositifs médicaux. |
| [SupplyDelivery](http://hl7.org/fhir/StructureDefinition/SupplyDelivery) | [DMISupplyDeliveryLigne](StructureDefinition-dmi-supplydelivery-ligne.md) | Profil créé dans le cadre de ce volet pour représenter une ligne de livraison, de délivrance. |
| [SupplyDelivery](http://hl7.org/fhir/StructureDefinition/SupplyDelivery) | [DMISupplyDeliveryReceptionUnitaire](StructureDefinition-dmi-supplydelivery-reception-unitaire.md) | Profil créé dans le cadre de ce volet pour représenter les informations de réception d’un dispositif médical. |
| [SupplyDelivery](http://hl7.org/fhir/StructureDefinition/SupplyDelivery) | [DMISupplyDeliveryTransport](StructureDefinition-dmi-supplydelivery-transport.md) | Profil créé dans le cadre de ce volet pour représenter les informations de transports des dispositifs médicaux. |
| [SupplyRequest](http://hl7.org/fhir/StructureDefinition/SupplyRequest) | [DMISupplyRequestEnteteCommande](StructureDefinition-dmi-supplyrequest-entete-commande.md) | Profil créé dans le cadre de ce volet permet transporter les informations générales d’une commande de dispositif médical. |
| [SupplyRequest](http://hl7.org/fhir/StructureDefinition/SupplyRequest) | [DMISupplyRequestEnteteDemande](StructureDefinition-dmi-supplyrequest-entete-demande.md) | Profil créé dans le cadre de ce volet pour transporter les informations générales d’une demande de dispositif médical. |
| [SupplyRequest](http://hl7.org/fhir/StructureDefinition/SupplyRequest) | [DMISupplyRequestEnteteReponse](StructureDefinition-dmi-supplyrequest-entetereponse.md) | Profil créé dans le cadre de ce volet pour transporter les informations générales de la réponse à une demande de création ou de mise à jour de DMI. |

### Dépendances






### Propriété intellectuelle

This publication includes IP covered under the following statements.

* ISO maintains the copyright on the country codes, and controls its use carefully. For further details see the ISO 3166 web page: [https://www.iso.org/iso-3166-country-codes.html](https://www.iso.org/iso-3166-country-codes.html)

* [ISO 3166-1 Codes for the representation of names of countries and their subdivisions — Part 1: Country code](http://terminology.hl7.org/6.0.2/CodeSystem-ISO3166Part1.html): [DMIBundleDelivery](StructureDefinition-dmi-bundledelivery.md), [DMIBundleRequest](StructureDefinition-dmi-bundle-request.md)... Show 40 more, [DMIBundleTransmissionTraces](StructureDefinition-dmi-bundle-transmission-traces.md), [DMIClasseRisque](StructureDefinition-dmi-classe-risque.md), [DMICodeEMDN](StructureDefinition-dmi-code-emdn.md), [DMICodeLPP](StructureDefinition-dmi-code-lpp.md), [DMIDevice](StructureDefinition-dmi-device.md), [DMIDeviceDefinition](StructureDefinition-dmi-devicedefinition.md), [DMIDeviceRequest](StructureDefinition-dmi-devicerequest.md), [DMIDiscriminator](CodeSystem-dmi-discriminator.md), [DMIFacture](StructureDefinition-dmi-facture.md), [DMIIPIdLogiciel](StructureDefinition-dmi-ip-id-logiciel.md), [DMIIdentifiantLocalDistributeur](StructureDefinition-dmi-identifiant-local-distributeur.md), [DMIIdentifiantLocalFabricant](StructureDefinition-dmi-identifiant-local-fabricant.md), [DMIInternalDiameter](StructureDefinition-dmi-internal-diameter.md), [DMIInvoice](StructureDefinition-dmi-invoice.md), [DMIMarquageCE](StructureDefinition-dmi-marquage-ce.md), [DMINomDistributeur](StructureDefinition-dmi-nom-distributeur.md), [DMIOrganizationEJ](StructureDefinition-dmi-organization-ej.md), [DMIOrganizationInterne](StructureDefinition-dmi-organization-interne.md), [DMIOrganizationLocation](StructureDefinition-dmi-organization-location.md), [DMIPatient](StructureDefinition-dmi-patient.md), [DMIPractitioner](StructureDefinition-dmi-practitioner.md), [DMIProcedure](StructureDefinition-dmi-procedure.md), [DMIReferenceDistributeur](StructureDefinition-dmi-reference-distributeur.md), [DMIReferenceFabricant](StructureDefinition-dmi-reference-fabricant.md), [DMIReferenceOrganisationInterne](StructureDefinition-dmi-reference-organisation-interne.md), [DMISupplyDeliveryEnteteDelivrance](StructureDefinition-dmi-supplydelivery-entete-delivrance.md), [DMISupplyDeliveryEnteteLivraison](StructureDefinition-dmi-supplydelivery-entete-livraison.md), [DMISupplyDeliveryEnteteReception](StructureDefinition-dmi-supplydelivery-enteter-reception.md), [DMISupplyDeliveryLigne](StructureDefinition-dmi-supplydelivery-ligne.md), [DMISupplyDeliveryReceptionUnitaire](StructureDefinition-dmi-supplydelivery-reception-unitaire.md), [DMISupplyDeliveryTransport](StructureDefinition-dmi-supplydelivery-transport.md), [DMISupplyRequestEnteteCommande](StructureDefinition-dmi-supplyrequest-entete-commande.md), [DMISupplyRequestEnteteDemande](StructureDefinition-dmi-supplyrequest-entete-demande.md), [DMISupplyRequestEnteteReponse](StructureDefinition-dmi-supplyrequest-entetereponse.md), [DMITransport](StructureDefinition-dmi-transport.md), [DMI_Device_definitionType](SearchParameter-dmi-device-definition-type.md), [DMI_Device_lotNumber](SearchParameter-dmi-device-lotNumber.md), [DMI_Device_serialNumber](SearchParameter-dmi-device-serialNumber.md), [DMI_Patient_INS](SearchParameter-DMI-Patient-INS.md) and [TDMI](index.md)


* These codes are excerpted from Digital Imaging and Communications in Medicine (DICOM) Standard, Part 16: Content Mapping Resource, Copyright © 2011 by the National Electrical Manufacturers Association.

* [DICOM Controlled Terminology Definitions](http://hl7.org/fhir/R4/codesystem-dicom-dcim.html): [AuditEvent/tde-auditevent-example](AuditEvent-tde-auditevent-example.md) and [Bundle/dmi-bundle-transmission-traces-example](Bundle-dmi-bundle-transmission-traces-example.md)


* This material contains content that is copyright of SNOMED International. Implementers of these specifications must have the appropriate SNOMED CT Affiliate license - for more information contact [https://www.snomed.org/get-snomed](https://www.snomed.org/get-snomed) or [info@snomed.org](mailto:info@snomed.org).

* [SNOMED Clinical Terms&reg; (SNOMED CT&reg;)](http://hl7.org/fhir/R4/codesystem-snomedct.html): [Procedure/dmi-procedure-example](Procedure-dmi-procedure-example.md)


* This material derives from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: [https://terminology.hl7.org/license.html](https://terminology.hl7.org/license.html)

* [identifierType](http://terminology.hl7.org/7.2.0/CodeSystem-v2-0203.html): [DMIPatient](StructureDefinition-dmi-patient.md)


