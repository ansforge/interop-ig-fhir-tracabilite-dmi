# DMI DeviceRequest - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI DeviceRequest**

## Resource Profile: DMI DeviceRequest 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicerequest | *Version*:3.0.0 |
| Draft as of 2026-02-26 | *Computable Name*:DMIDeviceRequest |

 
Profil créé dans le cadre de ce volet permettant d’effectuer une commande, demande, et la réponse à une demande de dispositif médical. 

**Utilisations:**

* Utilise ce/t/te Profil: [DMI Bundle Request](StructureDefinition-dmi-bundle-request.md)
* Exemples pour ce/t/te Profil: [DeviceRequest/dmi-devicerequest-example](DeviceRequest-dmi-devicerequest-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-devicerequest)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-devicerequest.csv), [Excel](StructureDefinition-dmi-devicerequest.xlsx), [Schematron](StructureDefinition-dmi-devicerequest.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-devicerequest",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicerequest",
  "version" : "3.0.0",
  "name" : "DMIDeviceRequest",
  "title" : "DMI DeviceRequest",
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
  "description" : "Profil créé dans le cadre de ce volet permettant d’effectuer une commande, demande, et la réponse à une demande de dispositif médical.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
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
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "quick",
    "uri" : "http://siframework.org/cqf",
    "name" : "Quality Improvement and Clinical Knowledge (QUICK)"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DeviceRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DeviceRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DeviceRequest.basedOn",
      "path" : "DeviceRequest.basedOn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/SupplyRequest"]
      }]
    },
    {
      "id" : "DeviceRequest.intent",
      "path" : "DeviceRequest.intent",
      "patternCode" : "order"
    },
    {
      "id" : "DeviceRequest.subject",
      "path" : "DeviceRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Device"]
      }]
    }]
  }
}

```
