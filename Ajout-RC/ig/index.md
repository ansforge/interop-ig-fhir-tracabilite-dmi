# Accueil - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* **Accueil**

## Accueil

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/ImplementationGuide/ans.fhir.fr.tdmi | *Version*:3.0.0 |
| Draft as of 2026-02-26 | *Computable Name*:TDMI |

 **Brief description of this Implementation Guide**
 This Implementation Guide defines the functional and technical framework for implementing traceability of Implantable Medical Devices (IMDs) within French healthcare institutions, in compliance with the CI SIS interoperability framework. It specifies how traceability events related to the IMD lifecycle including ordering, reception, stock management, implantation, and invoicing are created, transmitted, searched, and consulted using HL7 FHIR R4 resources and profiles, based on the generic Event Traceability framework (IHE ATNA / RESTful ATNA). 

> Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue soumise à des changements fréquents uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : http://interop.esante.gouv.fr/ig/fhir/[code - ig]

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

### Dépendances





### Propriété intellectuelle

Certaines ressources sémantiques de ce guide sont protégées par des droits de propriété intellectuelle couverte par les déclarations ci-dessous. L’utilisation de ces ressources est soumise à l’acceptation et au respect des conditions précisées dans la licence d’utilisation de chacune d’entre elle.

* ISO maintains the copyright on the country codes, and controls its use carefully. For further details see the ISO 3166 web page: [https://www.iso.org/iso-3166-country-codes.html](https://www.iso.org/iso-3166-country-codes.html)

* [ISO 3166-1 Codes for the representation of names of countries and their subdivisions — Part 1: Country code](http://terminology.hl7.org/6.0.2/CodeSystem-ISO3166Part1.html): [DMIBundleDelivery](StructureDefinition-dmi-bundledelivery.md), [DMIBundleRequest](StructureDefinition-dmi-bundle-request.md)... Show 40 more, [DMIBundleTransmissionTraces](StructureDefinition-dmi-bundle-transmission-traces.md), [DMIClasseRisque](StructureDefinition-dmi-classe-risque.md), [DMICodeEMDN](StructureDefinition-dmi-code-emdn.md), [DMICodeLPP](StructureDefinition-dmi-code-lpp.md), [DMIDevice](StructureDefinition-dmi-device.md), [DMIDeviceDefinition](StructureDefinition-dmi-devicedefinition.md), [DMIDeviceRequest](StructureDefinition-dmi-devicerequest.md), [DMIDiscriminator](CodeSystem-dmi-discriminator.md), [DMIFacture](StructureDefinition-dmi-facture.md), [DMIIPIdLogiciel](StructureDefinition-dmi-ip-id-logiciel.md), [DMIIdentifiantLocalDistributeur](StructureDefinition-dmi-identifiant-local-distributeur.md), [DMIIdentifiantLocalFabricant](StructureDefinition-dmi-identifiant-local-fabricant.md), [DMIInternalDiameter](StructureDefinition-dmi-internal-diameter.md), [DMIInvoice](StructureDefinition-dmi-invoice.md), [DMIMarquageCE](StructureDefinition-dmi-marquage-ce.md), [DMINomDistributeur](StructureDefinition-dmi-nom-distributeur.md), [DMIOrganizationEJ](StructureDefinition-dmi-organization-ej.md), [DMIOrganizationInterne](StructureDefinition-dmi-organization-interne.md), [DMIOrganizationLocation](StructureDefinition-dmi-organization-location.md), [DMIPatient](StructureDefinition-dmi-patient.md), [DMIPractitioner](StructureDefinition-dmi-practitioner.md), [DMIProcedure](StructureDefinition-dmi-procedure.md), [DMIReferenceDistributeur](StructureDefinition-dmi-reference-distributeur.md), [DMIReferenceFabricant](StructureDefinition-dmi-reference-fabricant.md), [DMIReferenceOrganisationInterne](StructureDefinition-dmi-reference-organisation-interne.md), [DMISupplyDeliveryEnteteDelivrance](StructureDefinition-dmi-supplydelivery-entete-delivrance.md), [DMISupplyDeliveryEnteteLivraison](StructureDefinition-dmi-supplydelivery-entete-livraison.md), [DMISupplyDeliveryEnteteReception](StructureDefinition-dmi-supplydelivery-enteter-reception.md), [DMISupplyDeliveryLigne](StructureDefinition-dmi-supplydelivery-ligne.md), [DMISupplyDeliveryReceptionUnitaire](StructureDefinition-dmi-supplydelivery-reception-unitaire.md), [DMISupplyDeliveryTransport](StructureDefinition-dmi-supplydelivery-transport.md), [DMISupplyRequestEnteteCommande](StructureDefinition-dmi-supplyrequest-entete-commande.md), [DMISupplyRequestEnteteDemande](StructureDefinition-dmi-supplyrequest-entete-demande.md), [DMISupplyRequestEnteteReponse](StructureDefinition-dmi-supplyrequest-entetereponse.md), [DMITransport](StructureDefinition-dmi-transport.md), [DMI_Device_definitionType](SearchParameter-dmi-device-definition-type.md), [DMI_Device_lotNumber](SearchParameter-dmi-device-lotNumber.md), [DMI_Device_serialNumber](SearchParameter-dmi-device-serialNumber.md), [DMI_Patient_INS](SearchParameter-DMI-Patient-INS.md) and [TDMI](index.md)


* These codes are excerpted from Digital Imaging and Communications in Medicine (DICOM) Standard, Part 16: Content Mapping Resource, Copyright © 2011 by the National Electrical Manufacturers Association.

* [DICOM Controlled Terminology Definitions](http://hl7.org/fhir/R4/codesystem-dicom-dcim.html): [AuditEvent/tde-auditevent-example](AuditEvent-tde-auditevent-example.md) and [Bundle/dmi-bundle-transmission-traces-example](Bundle-dmi-bundle-transmission-traces-example.md)


* This material contains content that is copyright of SNOMED International. Implementers of these specifications must have the appropriate SNOMED CT Affiliate license - for more information contact [https://www.snomed.org/get-snomed](https://www.snomed.org/get-snomed) or [info@snomed.org](mailto:info@snomed.org).

* [SNOMED Clinical Terms&reg; (SNOMED CT&reg;)](http://hl7.org/fhir/R4/codesystem-snomedct.html): [Procedure/dmi-procedure-example](Procedure-dmi-procedure-example.md)


* This material derives from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: [https://terminology.hl7.org/license.html](https://terminology.hl7.org/license.html)

* [identifierType](http://terminology.hl7.org/7.0.1/CodeSystem-v2-0203.html): [DMIPatient](StructureDefinition-dmi-patient.md)




## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "ans.fhir.fr.tdmi",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/ImplementationGuide/ans.fhir.fr.tdmi",
  "version" : "3.0.0",
  "name" : "TDMI",
  "title" : "Traçabilité des Dispositifs Médicaux Implantables",
  "status" : "draft",
  "date" : "2026-02-26T17:10:09+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "packageId" : "ans.fhir.fr.tdmi",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.0.1"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.2.0"
  },
  {
    "id" : "hl7_fhir_fr_core",
    "uri" : "https://hl7.fr/ig/fhir/core/ImplementationGuide/hl7.fhir.fr.core",
    "packageId" : "hl7.fhir.fr.core",
    "version" : "2.1.0"
  },
  {
    "id" : "ans_fhir_fr_tde",
    "uri" : "https://interop.esante.gouv.fr/ig/fhir/tde/ImplementationGuide/ans.fhir.fr.tde",
    "packageId" : "ans.fhir.fr.tde",
    "version" : "2.0.0-ballot"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2020+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "shownav"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-expansion-params"
      },
      {
        "url" : "value",
        "valueString" : "../../expansion-params.json"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/expansion-parameters",
      "valueReference" : {
        "reference" : "Parameters/expansion-parameters"
      }
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#0.9.0"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2020+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "shownav"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-expansion-params"
      },
      {
        "url" : "value",
        "valueString" : "../../expansion-params.json"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-bundledelivery"
      },
      "name" : "DMI Bundle Delivery",
      "description" : "Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant la réception, la délivrance et la livraison d’un DMI.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-bundle-request"
      },
      "name" : "DMI Bundle Request",
      "description" : "Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant une commande, une demande et la réponse à la demande d’un DMI.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-bundle-transmission-traces"
      },
      "name" : "DMI Bundle Transmission Traces",
      "description" : "Profil créé dans le cadre de ce volet pour transmettre l’ensemble des ressources au serveur.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-classe-risque"
      },
      "name" : "DMI Classe Risque",
      "description" : "Extension créée dans ce volet pour représenter la classe de risque.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-code-emdn"
      },
      "name" : "DMI Code EMDN",
      "description" : "Extension créée dans ce volet pour représenter le code EMDN.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-code-lpp"
      },
      "name" : "DMI Code LPP",
      "description" : "Extension créée dans ce volet pour représenter le code LPP.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-device"
      },
      "name" : "DMI Device",
      "description" : "Profil créé dans le cadre de ce volet pour représenter une instance physique d’un dispositif médical.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-devicedefinition"
      },
      "name" : "DMI DeviceDefinition",
      "description" : "Profil créé dans le cadre de ce volet pour représenter un modèle de dispositif médical.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-devicerequest"
      },
      "name" : "DMI DeviceRequest",
      "description" : "Profil créé dans le cadre de ce volet permettant d’effectuer une commande, demande, et la réponse à une demande de dispositif médical.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/dmi-discriminator"
      },
      "name" : "DMI Discriminator",
      "description" : "CodeSystem définissant les codes discriminants.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-facture"
      },
      "name" : "DMI Facture",
      "description" : "Extension créée dans ce volet pour représenter une facture.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-identifiant-local-distributeur"
      },
      "name" : "DMI Identifiant Local Distributeur",
      "description" : "Extension créée dans ce volet pour représenter l'identifiant local distributeur.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-identifiant-local-fabricant"
      },
      "name" : "DMI Identifiant Local Fabricant",
      "description" : "Extension créée dans ce volet pour représenter l'identifiant local fabricant.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-internal-diameter"
      },
      "name" : "DMI Internal Diameter",
      "description" : "Extension créée dans ce volet pour représenter le diamètre interne.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-invoice"
      },
      "name" : "DMI Invoice",
      "description" : "Profil créé dans le cadre de ce volet pour représenter la facturation de dispositifs médicaux.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-ip-id-logiciel"
      },
      "name" : "DMI IP Id logiciel",
      "description" : "Extension créée dans ce volet pour représenter l'IP Id logiciel.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-marquage-ce"
      },
      "name" : "DMI Marquage CE",
      "description" : "Extension créée dans ce volet pour représenter le marquage CE.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-nom-distributeur"
      },
      "name" : "DMI Nom Distributeur",
      "description" : "Extension créée dans ce volet pour représenter le nom distributeur.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-organization-ej"
      },
      "name" : "DMI Organization EJ",
      "description" : "Profil créé dans le cadre de ce volet étendant le profil « FrOrganization ». Ce profil est utilisé pour représenter le fabricant et les distributeurs des DM.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-organization-interne"
      },
      "name" : "DMI Organization Interne",
      "description" : "Profil créé dans le cadre de ce volet permettant de représenter l’organisation interne (Service utilisateur).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-organization-location"
      },
      "name" : "DMI Organization Location",
      "description" : "Extension créée dans ce volet pour représenter le lieu de l'organisation.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-patient"
      },
      "name" : "DMI Patient",
      "description" : "Profil créé dans le cadre de ce volet étendant le profil français « FrPatient » publié par Interop’Santé.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-practitioner"
      },
      "name" : "DMI Practitioner",
      "description" : "Profil créé dans le cadre de ce volet étendant le profil « FrPractitionner» publié par Interop’Santé.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-procedure"
      },
      "name" : "DMI Procedure",
      "description" : "Profil créé dans le cadre de ce volet pour représenter l’intervention clinique ou chirurgicale implantant un dispositif médical.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-reference-distributeur"
      },
      "name" : "DMI Reference Distributeur",
      "description" : "Extension créée dans ce volet pour représenter la référence distributeur.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-reference-organisation-interne"
      },
      "name" : "DMI Reference Organisation Interne",
      "description" : "Extension créée dans ce volet pour référencer l'organisation fabricant du DMI.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-supplydelivery-entete-delivrance"
      },
      "name" : "DMI SupplyDelivery Entete Delivrance",
      "description" : "Profil créé dans le cadre de ce volet pour représenter l’entête des informations de la délivrance de dispositifs médicaux.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-supplydelivery-entete-livraison"
      },
      "name" : "DMI SupplyDelivery Entete Livraison",
      "description" : "Profil créé dans le cadre de ce volet pour représenter l’entête des informations de livraison de dispositifs médicaux.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-supplydelivery-enteter-reception"
      },
      "name" : "DMI SupplyDelivery Entete Reception",
      "description" : "Profil créé dans le cadre de ce volet pour représenter l’entête des informations de réception des dispositifs médicaux.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-supplydelivery-ligne"
      },
      "name" : "DMI SupplyDelivery Ligne",
      "description" : "Profil créé dans le cadre de ce volet pour représenter une ligne de livraison, de délivrance.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-supplydelivery-reception-unitaire"
      },
      "name" : "DMI SupplyDelivery Reception Unitaire",
      "description" : "Profil créé dans le cadre de ce volet pour représenter les informations de réception d’un dispositif médical.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-supplydelivery-transport"
      },
      "name" : "DMI SupplyDelivery Transport",
      "description" : "Profil créé dans le cadre de ce volet pour représenter les informations de transports des dispositifs médicaux.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-supplyrequest-entete-commande"
      },
      "name" : "DMI SupplyRequest Entete Commande",
      "description" : "Profil créé dans le cadre de ce volet permet transporter les informations générales d’une commande de dispositif médical.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-supplyrequest-entete-demande"
      },
      "name" : "DMI SupplyRequest Entete Demande",
      "description" : "Profil créé dans le cadre de ce volet pour transporter les informations générales d’une demande de dispositif médical.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-supplyrequest-entetereponse"
      },
      "name" : "DMI SupplyRequest Entete Reponse",
      "description" : "Profil créé dans le cadre de ce volet pour transporter les informations générales de la réponse à une demande de création ou de mise à jour de DMI.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-transport"
      },
      "name" : "DMI Transport",
      "description" : "Extension créée dans ce volet pour représenter le transport.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/dmi-bundle-delivery-example"
      },
      "name" : "dmi-bundle-delivery-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundledelivery"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/dmi-bundle-request-example"
      },
      "name" : "dmi-bundle-request-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundle-request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/dmi-bundle-transmission-traces-example"
      },
      "name" : "dmi-bundle-transmission-traces-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundle-transmission-traces"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Device"
      }],
      "reference" : {
        "reference" : "Device/dmi-device-example"
      },
      "name" : "dmi-device-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-device"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DeviceDefinition"
      }],
      "reference" : {
        "reference" : "DeviceDefinition/dmi-devicedefinition-example"
      },
      "name" : "dmi-devicedefinition-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicedefinition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DeviceRequest"
      }],
      "reference" : {
        "reference" : "DeviceRequest/dmi-devicerequest-example"
      },
      "name" : "dmi-devicerequest-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicerequest"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Invoice"
      }],
      "reference" : {
        "reference" : "Invoice/dmi-invoice-example"
      },
      "name" : "dmi-invoice-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-invoice"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/dmi-organization-ej-example"
      },
      "name" : "dmi-organization-ej-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-ej"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/dmi-organization-interne-example"
      },
      "name" : "dmi-organization-interne-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-interne"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/dmi-patient-example"
      },
      "name" : "dmi-patient-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      }],
      "reference" : {
        "reference" : "Practitioner/dmi-practitioner-example"
      },
      "name" : "dmi-practitioner-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-practitioner"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      }],
      "reference" : {
        "reference" : "Procedure/dmi-procedure-example"
      },
      "name" : "dmi-procedure-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-procedure"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyDelivery"
      }],
      "reference" : {
        "reference" : "SupplyDelivery/dmi-supplydelivery-entete-delivrance-example"
      },
      "name" : "dmi-supplydelivery-entete-delivrance-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-entete-delivrance"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyDelivery"
      }],
      "reference" : {
        "reference" : "SupplyDelivery/dmi-supplydelivery-entete-livraison-example"
      },
      "name" : "dmi-supplydelivery-entete-livraison-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-entete-livraison"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyDelivery"
      }],
      "reference" : {
        "reference" : "SupplyDelivery/dmi-supplydelivery-entete-reception-example"
      },
      "name" : "dmi-supplydelivery-entete-reception-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-enteter-reception"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyDelivery"
      }],
      "reference" : {
        "reference" : "SupplyDelivery/dmi-supplydelivery-ligne-example"
      },
      "name" : "dmi-supplydelivery-ligne-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-ligne"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyDelivery"
      }],
      "reference" : {
        "reference" : "SupplyDelivery/dmi-supplydelivery-reception-unitaire-example"
      },
      "name" : "dmi-supplydelivery-reception-unitaire-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-reception-unitaire"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyDelivery"
      }],
      "reference" : {
        "reference" : "SupplyDelivery/dmi-supplydelivery-transport-example"
      },
      "name" : "dmi-supplydelivery-transport-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-transport"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyRequest"
      }],
      "reference" : {
        "reference" : "SupplyRequest/dmi-supplyrequest-entete-commande-example"
      },
      "name" : "dmi-supplyrequest-entete-commande-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-commande"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyRequest"
      }],
      "reference" : {
        "reference" : "SupplyRequest/dmi-supplyrequest-entete-demande-example"
      },
      "name" : "dmi-supplyrequest-entete-demande-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-demande"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyRequest"
      }],
      "reference" : {
        "reference" : "SupplyRequest/dmi-supplyrequest-entete-reponse-example"
      },
      "name" : "dmi-supplyrequest-entete-reponse-example",
      "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entetereponse"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/dmi-reference-fabricant"
      },
      "name" : "Extension DMI Reference Fabricant",
      "description" : "Extension créée dans ce volet pour référencer l'organisation fabricant du DMI.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      }],
      "reference" : {
        "reference" : "SearchParameter/dmi-device-definition-type"
      },
      "name" : "SearchParameter DMI Device definitionType",
      "description" : "Permet la recherche sur le Code EMDN",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      }],
      "reference" : {
        "reference" : "SearchParameter/dmi-device-lotNumber"
      },
      "name" : "SearchParameter DMI Device lotNumber",
      "description" : "Permet de faire une recherche sur le numéro de lot du DMI",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      }],
      "reference" : {
        "reference" : "SearchParameter/dmi-device-serialNumber"
      },
      "name" : "SearchParameter DMI Device serialNumber",
      "description" : "Permet la recherche sur le numéro de série du DMI",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      }],
      "reference" : {
        "reference" : "SearchParameter/DMI-Patient-INS"
      },
      "name" : "SearchParameter DMI Patient INS",
      "description" : "Permet la recherche sur l'ins du patient",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "AuditEvent"
      }],
      "reference" : {
        "reference" : "AuditEvent/tde-auditevent-example"
      },
      "name" : "tde-auditevent-example",
      "exampleBoolean" : true
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Accueil",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "specifications_fonctionnelles.html"
        }],
        "nameUrl" : "specifications_fonctionnelles.html",
        "title" : "Volume 1 - Etude fonctionnelle",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "specifications_techniques_introduction.html"
        }],
        "nameUrl" : "specifications_techniques_introduction.html",
        "title" : "Volume 2 - Détail des transactions",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "specifications_techniques_construction_flux.html"
          }],
          "nameUrl" : "specifications_techniques_construction_flux.html",
          "title" : "Construction des flux",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "specifications_techniques_flux23_recherche_traces.html"
          }],
          "nameUrl" : "specifications_techniques_flux23_recherche_traces.html",
          "title" : "Flux 23 - RechercheTraces",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "specifications_techniques_flux24_reponse_recherche_traces.html"
          }],
          "nameUrl" : "specifications_techniques_flux24_reponse_recherche_traces.html",
          "title" : "Flux 24 - RéponseRechercheTraces",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "specifications_techniques_flux25_consulter_trace.html"
          }],
          "nameUrl" : "specifications_techniques_flux25_consulter_trace.html",
          "title" : "Flux 25 - ConsulterTrace",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "specifications_techniques_flux26_reponse_consulter_trace.html"
          }],
          "nameUrl" : "specifications_techniques_flux26_reponse_consulter_trace.html",
          "title" : "Flux 26 - ReponseConsulterTrace",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "autres_ressources.html"
        }],
        "nameUrl" : "autres_ressources.html",
        "title" : "Autres Ressources",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "norme_standard.html"
          }],
          "nameUrl" : "norme_standard.html",
          "title" : "Normes et Standards",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "glossaire.html"
          }],
          "nameUrl" : "glossaire.html",
          "title" : "Glossaire",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "securite.html"
          }],
          "nameUrl" : "securite.html",
          "title" : "Sécurité",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "downloads.html"
          }],
          "nameUrl" : "downloads.html",
          "title" : "Téléchargements et usages",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "change-log.html"
        }],
        "nameUrl" : "change-log.html",
        "title" : "Historique des versions",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
