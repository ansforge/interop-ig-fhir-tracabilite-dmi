# DMIDevice - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMIDevice**

## Resource Profile: DMIDevice 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-device | *Version*:3.0.0 |
| Draft as of 2026-02-24 | *Computable Name*:DMIDevice |

**Utilisations:**

* Utilise ce/t/te Profil: [DMIBundleTransmissionTraces](StructureDefinition-dmi-bundle-transmission-traces.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-device)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-device.csv), [Excel](StructureDefinition-dmi-device.xlsx), [Schematron](StructureDefinition-dmi-device.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-device",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-device",
  "version" : "3.0.0",
  "name" : "DMIDevice",
  "status" : "draft",
  "date" : "2026-02-24T10:11:35+00:00",
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
      "display" : "FRANCE"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
    "identity" : "udi",
    "uri" : "http://fda.gov/UDI",
    "name" : "UDI Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Device",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Device",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Device.extension",
      "path" : "Device.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Device.extension:IPIdLogiciel",
      "path" : "Device.extension",
      "sliceName" : "IPIdLogiciel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-ip-id-logiciel"]
      }]
    },
    {
      "id" : "Device.extension:MarquageCE",
      "path" : "Device.extension",
      "sliceName" : "MarquageCE",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-marquage-ce"]
      }]
    },
    {
      "id" : "Device.definition",
      "path" : "Device.definition",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicedefinition"]
      }]
    }]
  }
}

```
