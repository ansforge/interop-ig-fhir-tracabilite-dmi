# DMISupplyDeliveryLigne - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMISupplyDeliveryLigne**

## Resource Profile: DMISupplyDeliveryLigne 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-ligne | *Version*:3.0.0 |
| Draft as of 2026-02-24 | *Computable Name*:DMISupplyDeliveryLigne |

**Utilisations:**

* Utilise ce/t/te Profil: [DMIBundleTransmissionTraces](StructureDefinition-dmi-bundle-transmission-traces.md) and [DMIBundleDelivery](StructureDefinition-dmi-bundledelivery.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-supplydelivery-ligne)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-supplydelivery-ligne.csv), [Excel](StructureDefinition-dmi-supplydelivery-ligne.xlsx), [Schematron](StructureDefinition-dmi-supplydelivery-ligne.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-supplydelivery-ligne",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-ligne",
  "version" : "3.0.0",
  "name" : "DMISupplyDeliveryLigne",
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "SupplyDelivery",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/SupplyDelivery",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "SupplyDelivery.extension",
      "path" : "SupplyDelivery.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "SupplyDelivery.extension:ReferenceOrganisationInterne",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "ReferenceOrganisationInterne",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-organisation-interne"]
      }]
    },
    {
      "id" : "SupplyDelivery.identifier",
      "path" : "SupplyDelivery.identifier",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "SupplyDelivery.basedOn",
      "path" : "SupplyDelivery.basedOn",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "SupplyDelivery.partOf",
      "path" : "SupplyDelivery.partOf",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/SupplyDelivery"]
      }]
    },
    {
      "id" : "SupplyDelivery.suppliedItem",
      "path" : "SupplyDelivery.suppliedItem",
      "min" : 1
    },
    {
      "id" : "SupplyDelivery.suppliedItem.item[x]",
      "path" : "SupplyDelivery.suppliedItem.item[x]",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Device"]
      }]
    },
    {
      "id" : "SupplyDelivery.occurrence[x]",
      "path" : "SupplyDelivery.occurrence[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    }]
  }
}

```
