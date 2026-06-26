# DMI Internal Diameter - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Extension: DMI Internal Diameter 

Extension créée dans ce volet pour représenter le diamètre interne.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [DMI DeviceDefinition](StructureDefinition-dmi-devicedefinition.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-internal-diameter.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-internal-diameter.csv), [Excel](../StructureDefinition-dmi-internal-diameter.xlsx), [Schematron](../StructureDefinition-dmi-internal-diameter.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-internal-diameter",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-internal-diameter",
  "version" : "3.0.0-ballot",
  "name" : "DMIInternalDiameter",
  "title" : "DMI Internal Diameter",
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
  "description" : "Extension créée dans ce volet pour représenter le diamètre interne.",
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
    "expression" : "DeviceDefinition.physicalCharacteristics"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "DMI Internal Diameter",
      "definition" : "Extension créée dans ce volet pour représenter le diamètre interne."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-internal-diameter"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Quantity"
      }]
    }]
  }
}

```
