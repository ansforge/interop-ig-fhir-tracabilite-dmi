# DMI SupplyRequest Entete Demande - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI SupplyRequest Entete Demande**

## Resource Profile: DMI SupplyRequest Entete Demande 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-demande | *Version*:3.0.0 |
| Draft as of 2026-02-27 | *Computable Name*:DMISupplyRequestEnteteDemande |

 
Profil créé dans le cadre de ce volet pour transporter les informations générales d’une demande de dispositif médical. 

**Utilisations:**

* Utilise ce/t/te Profil: [DMI Bundle Request](StructureDefinition-dmi-bundle-request.md) and [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Exemples pour ce/t/te Profil: [SupplyRequest/dmi-supplyrequest-entete-demande-example](SupplyRequest-dmi-supplyrequest-entete-demande-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-supplyrequest-entete-demande)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-supplyrequest-entete-demande.csv), [Excel](StructureDefinition-dmi-supplyrequest-entete-demande.xlsx), [Schematron](StructureDefinition-dmi-supplyrequest-entete-demande.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-supplyrequest-entete-demande",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-demande",
  "version" : "3.0.0",
  "name" : "DMISupplyRequestEnteteDemande",
  "title" : "DMI SupplyRequest Entete Demande",
  "status" : "draft",
  "date" : "2026-02-27T10:33:04+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Profil créé dans le cadre de ce volet pour transporter les informations générales d’une demande de dispositif médical.",
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
      }]
    },
    {
      "id" : "SupplyRequest.item[x].coding",
      "path" : "SupplyRequest.item[x].coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "code"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "SupplyRequest.item[x].coding:CreationDemande",
      "path" : "SupplyRequest.item[x].coding",
      "sliceName" : "CreationDemande",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "SupplyRequest.item[x].coding:CreationDemande.code",
      "path" : "SupplyRequest.item[x].coding.code",
      "min" : 1,
      "patternCode" : "DEM"
    },
    {
      "id" : "SupplyRequest.item[x].coding:SuppressionDemande",
      "path" : "SupplyRequest.item[x].coding",
      "sliceName" : "SuppressionDemande",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "SupplyRequest.item[x].coding:SuppressionDemande.code",
      "path" : "SupplyRequest.item[x].coding.code",
      "min" : 1,
      "patternCode" : "SDM"
    },
    {
      "id" : "SupplyRequest.requester",
      "path" : "SupplyRequest.requester",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner"]
      }]
    },
    {
      "id" : "SupplyRequest.deliverTo",
      "path" : "SupplyRequest.deliverTo",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Organization"]
      }]
    }]
  }
}

```
