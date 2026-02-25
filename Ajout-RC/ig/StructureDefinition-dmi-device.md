# DMI Device - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI Device**

## Resource Profile: DMI Device 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-device | *Version*:3.0.0 |
| Draft as of 2026-02-25 | *Computable Name*:DMIDevice |

 
Profil créé dans le cadre de ce volet pour représenter une instance physique d’un dispositif médical. 

**Utilisations:**

* Utilise ce/t/te Profil: [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Exemples pour ce/t/te Profil: [Device/dmi-device-example](Device-dmi-device-example.md)

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
  "title" : "DMI Device",
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
  "description" : "Profil créé dans le cadre de ce volet pour représenter une instance physique d’un dispositif médical.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
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
