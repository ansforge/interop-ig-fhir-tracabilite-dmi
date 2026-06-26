# DMI Code EMDN - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Extension: DMI Code EMDN 

Extension créée dans ce volet pour représenter le code EMDN.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [DMI Device](StructureDefinition-dmi-device.md) and [DMI DeviceDefinition](StructureDefinition-dmi-devicedefinition.md)
* Search Parameters using this Extension: [DMI_Device_definitionType](SearchParameter-dmi-device-definition-type.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-code-emdn.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-code-emdn.csv), [Excel](../StructureDefinition-dmi-code-emdn.xlsx), [Schematron](../StructureDefinition-dmi-code-emdn.sch) 



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
  "date" : "2026-06-26T10:33:00+00:00",
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
