# DMI Marquage CE - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI Marquage CE**

## Extension: DMI Marquage CE 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-marquage-ce | *Version*:3.0.0 |
| Draft as of 2026-02-26 | *Computable Name*:DMIMarquageCE |

Extension créée dans ce volet pour représenter le marquage CE.

**Context of Use**

**Usage info**

**Utilisations:**

* Utilise ce/t/te Extension: [DMI Device](StructureDefinition-dmi-device.md)
* Exemples pour ce/t/te Extension: [Bundle/dmi-bundle-transmission-traces-example](Bundle-dmi-bundle-transmission-traces-example.md) and [Device/dmi-device-example](Device-dmi-device-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-marquage-ce)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-marquage-ce.csv), [Excel](StructureDefinition-dmi-marquage-ce.xlsx), [Schematron](StructureDefinition-dmi-marquage-ce.sch) 

#### Contraintes



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-marquage-ce",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-marquage-ce",
  "version" : "3.0.0",
  "name" : "DMIMarquageCE",
  "title" : "DMI Marquage CE",
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
  "description" : "Extension créée dans ce volet pour représenter le marquage CE.",
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
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Device"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "DMI Marquage CE",
      "definition" : "Extension créée dans ce volet pour représenter le marquage CE."
    },
    {
      "id" : "Extension.extension:organismeNotifie",
      "path" : "Extension.extension",
      "sliceName" : "organismeNotifie",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Extension.extension:organismeNotifie.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:organismeNotifie.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "organismeNotifie"
    },
    {
      "id" : "Extension.extension:organismeNotifie.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Reference"
      }]
    },
    {
      "id" : "Extension.extension:libelleAutorisation",
      "path" : "Extension.extension",
      "sliceName" : "libelleAutorisation",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Extension.extension:libelleAutorisation.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:libelleAutorisation.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "libelleAutorisation"
    },
    {
      "id" : "Extension.extension:libelleAutorisation.value[x]",
      "path" : "Extension.extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-marquage-ce"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
