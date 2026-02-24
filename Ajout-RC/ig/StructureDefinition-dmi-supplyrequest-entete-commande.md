# DMISupplyRequestEnteteCommande - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMISupplyRequestEnteteCommande**

## Resource Profile: DMISupplyRequestEnteteCommande 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-commande | *Version*:3.0.0 |
| Draft as of 2026-02-24 | *Computable Name*:DMISupplyRequestEnteteCommande |

**Utilisations:**

* Utilise ce/t/te Profil: [DMIBundleRequest](StructureDefinition-dmi-bundle-request.md) and [DMIBundleTransmissionTraces](StructureDefinition-dmi-bundle-transmission-traces.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-supplyrequest-entete-commande)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-supplyrequest-entete-commande.csv), [Excel](StructureDefinition-dmi-supplyrequest-entete-commande.xlsx), [Schematron](StructureDefinition-dmi-supplyrequest-entete-commande.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-supplyrequest-entete-commande",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-commande",
  "version" : "3.0.0",
  "name" : "DMISupplyRequestEnteteCommande",
  "status" : "draft",
  "date" : "2026-02-24T10:44:05+00:00",
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "SupplyRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/SupplyRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "SupplyRequest.identifier",
      "path" : "SupplyRequest.identifier",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "SupplyRequest.item[x]",
      "path" : "SupplyRequest.item[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_R254-TypeEvenement/FHIR/TRE-R254-TypeEvenement/TRE_R254-TypeEvenement-FHIR",
          "code" : "CDM"
        }]
      }
    },
    {
      "id" : "SupplyRequest.requester",
      "path" : "SupplyRequest.requester",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner"]
      }]
    },
    {
      "id" : "SupplyRequest.deliverTo",
      "path" : "SupplyRequest.deliverTo",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Organization"]
      }]
    }]
  }
}

```
