# DMIBundleDelivery - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMIBundleDelivery**

## Resource Profile: DMIBundleDelivery 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundledelivery | *Version*:3.0.0 |
| Draft as of 2026-02-24 | *Computable Name*:DMIBundleDelivery |

**Utilisations:**

* Utilise ce/t/te Profil: [DMIBundleTransmissionTraces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Exemples pour ce/t/te Profil: [Bundle/dmi-bundle-delivery-example](Bundle-dmi-bundle-delivery-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-bundledelivery)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-bundledelivery.csv), [Excel](StructureDefinition-dmi-bundledelivery.xlsx), [Schematron](StructureDefinition-dmi-bundledelivery.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-bundledelivery",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundledelivery",
  "version" : "3.0.0",
  "name" : "DMIBundleDelivery",
  "status" : "draft",
  "date" : "2026-02-24T16:11:45+00:00",
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
      "id" : "Bundle.entry:SupplyDelivery",
      "path" : "Bundle.entry",
      "sliceName" : "SupplyDelivery",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:SupplyDelivery.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "SupplyDelivery",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-transport",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-enteter-reception",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-entete-delivrance",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-entete-livraison",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-ligne"]
      }]
    }]
  }
}

```
