# DMI IP Id logiciel - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Extension: DMI IP Id logiciel 

Extension créée dans ce volet pour représenter l'IP Id logiciel.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [DMI Device](StructureDefinition-dmi-device.md)
* Examples for this Extension: [Bundle/dmi-bundle-transmission-traces-example](Bundle-dmi-bundle-transmission-traces-example.md) and [Device/dmi-device-example](Device-dmi-device-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-ip-id-logiciel.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-ip-id-logiciel.csv), [Excel](../StructureDefinition-dmi-ip-id-logiciel.xlsx), [Schematron](../StructureDefinition-dmi-ip-id-logiciel.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-ip-id-logiciel",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-ip-id-logiciel",
  "version" : "3.0.0-ballot",
  "name" : "DMIIPIdLogiciel",
  "title" : "DMI IP Id logiciel",
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
  "description" : "Extension créée dans ce volet pour représenter l'IP Id logiciel.",
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
      "short" : "DMI IP Id logiciel",
      "definition" : "Extension créée dans ce volet pour représenter l'IP Id logiciel."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-ip-id-logiciel"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
