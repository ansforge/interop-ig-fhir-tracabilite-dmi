# DMI SupplyDelivery Entete Delivrance - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI SupplyDelivery Entete Delivrance**

## Resource Profile: DMI SupplyDelivery Entete Delivrance 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-entete-delivrance | *Version*:3.0.0 |
| Draft as of 2026-02-25 | *Computable Name*:DMISupplyDeliveryEnteteDelivrance |

 
Profil créé dans le cadre de ce volet pour représenter l’entête des informations de la délivrance de dispositifs médicaux. 

**Utilisations:**

* Utilise ce/t/te Profil: [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md) and [DMI Bundle Delivery](StructureDefinition-dmi-bundledelivery.md)
* Exemples pour ce/t/te Profil: [SupplyDelivery/dmi-supplydelivery-entete-delivrance-example](SupplyDelivery-dmi-supplydelivery-entete-delivrance-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-supplydelivery-entete-delivrance)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-supplydelivery-entete-delivrance.csv), [Excel](StructureDefinition-dmi-supplydelivery-entete-delivrance.xlsx), [Schematron](StructureDefinition-dmi-supplydelivery-entete-delivrance.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-supplydelivery-entete-delivrance",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-entete-delivrance",
  "version" : "3.0.0",
  "name" : "DMISupplyDeliveryEnteteDelivrance",
  "title" : "DMI SupplyDelivery Entete Delivrance",
  "status" : "draft",
  "date" : "2026-02-25T08:31:26+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Profil créé dans le cadre de ce volet pour représenter l’entête des informations de la délivrance de dispositifs médicaux.",
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
      "id" : "SupplyDelivery.suppliedItem.item[x]",
      "path" : "SupplyDelivery.suppliedItem.item[x]",
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
