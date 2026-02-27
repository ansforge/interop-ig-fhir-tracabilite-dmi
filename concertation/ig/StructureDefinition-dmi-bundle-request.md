# DMI Bundle Request - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI Bundle Request**

## Resource Profile: DMI Bundle Request 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundle-request | *Version*:3.0.0-ballot |
| Draft as of 2026-02-27 | *Computable Name*:DMIBundleRequest |

 
Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant une commande, une demande et la réponse à la demande d’un DMI. 

**Utilisations:**

* Utilise ce/t/te Profil: [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Exemples pour ce/t/te Profil: [Bundle/dmi-bundle-request-example](Bundle-dmi-bundle-request-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-bundle-request)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-bundle-request.csv), [Excel](StructureDefinition-dmi-bundle-request.xlsx), [Schematron](StructureDefinition-dmi-bundle-request.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-bundle-request",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundle-request",
  "version" : "3.0.0-ballot",
  "name" : "DMIBundleRequest",
  "title" : "DMI Bundle Request",
  "status" : "draft",
  "date" : "2026-02-27T11:53:01+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant une commande, une demande et la réponse à la demande d’un DMI.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Bundle",
      "path" : "Bundle"
    },
    {
      "id" : "Bundle.type",
      "path" : "Bundle.type",
      "patternCode" : "transaction"
    },
    {
      "id" : "Bundle.entry",
      "path" : "Bundle.entry",
      "slicing" : {
        "discriminator" : [{
          "type" : "profile",
          "path" : "resource"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Bundle.entry:SupplyRequest",
      "path" : "Bundle.entry",
      "sliceName" : "SupplyRequest",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:SupplyRequest.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "SupplyRequest",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entetereponse",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-commande",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-demande"]
      }]
    },
    {
      "id" : "Bundle.entry:DeviceRequest",
      "path" : "Bundle.entry",
      "sliceName" : "DeviceRequest",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:DeviceRequest.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "DeviceRequest",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicerequest"]
      }]
    }]
  }
}

```
