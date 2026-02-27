# DMI Code EMDN - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI Code EMDN**

## Extension: DMI Code EMDN 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-code-emdn | *Version*:3.0.0-ballot |
| Draft as of 2026-02-27 | *Computable Name*:DMICodeEMDN |

Extension créée dans ce volet pour représenter le code EMDN.

**Context of Use**

**Usage info**

**Utilisations:**

* Utilise ce/t/te Extension: [DMI Device](StructureDefinition-dmi-device.md) and [DMI DeviceDefinition](StructureDefinition-dmi-devicedefinition.md)
* Paramètres de recherche utilisant ce Extension: [DMI_Device_definitionType](SearchParameter-dmi-device-definition-type.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-code-emdn)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-code-emdn.csv), [Excel](StructureDefinition-dmi-code-emdn.xlsx), [Schematron](StructureDefinition-dmi-code-emdn.sch) 

#### Contraintes



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-code-emdn",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-code-emdn",
  "version" : "3.0.0-ballot",
  "name" : "DMICodeEMDN",
  "title" : "DMI Code EMDN",
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
  "description" : "Extension créée dans ce volet pour représenter le code EMDN.",
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
      "short" : "DMI Code EMDN",
      "definition" : "Extension créée dans ce volet pour représenter le code EMDN."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-code-emdn"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "code"
      }]
    }]
  }
}

```
