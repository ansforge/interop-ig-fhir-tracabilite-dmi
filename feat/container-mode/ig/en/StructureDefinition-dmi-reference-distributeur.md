# DMI Reference Distributeur - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Extension: DMI Reference Distributeur 

Extension créée dans ce volet pour représenter la référence distributeur.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [DMI DeviceDefinition](StructureDefinition-dmi-devicedefinition.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-reference-distributeur.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-reference-distributeur.csv), [Excel](../StructureDefinition-dmi-reference-distributeur.xlsx), [Schematron](../StructureDefinition-dmi-reference-distributeur.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-reference-distributeur",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-distributeur",
  "version" : "3.0.0-ballot",
  "name" : "DMIReferenceDistributeur",
  "title" : "DMI Reference Distributeur",
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
  "description" : "Extension créée dans ce volet pour représenter la référence distributeur.",
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
    "expression" : "DeviceDefinition"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "DMI Reference Distributeur",
      "definition" : "Extension créée dans ce volet pour représenter la référence distributeur."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-distributeur"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Identifier"
      }]
    }]
  }
}

```
