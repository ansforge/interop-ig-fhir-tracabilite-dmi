# DMI Identifiant Local Fabricant - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Extension: DMI Identifiant Local Fabricant 

Extension créée dans ce volet pour représenter l'identifiant local fabricant.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [DMI Organization EJ](StructureDefinition-dmi-organization-ej.md) and [DMI Organization Interne](StructureDefinition-dmi-organization-interne.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-identifiant-local-fabricant.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-identifiant-local-fabricant.csv), [Excel](../StructureDefinition-dmi-identifiant-local-fabricant.xlsx), [Schematron](../StructureDefinition-dmi-identifiant-local-fabricant.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-identifiant-local-fabricant",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-identifiant-local-fabricant",
  "version" : "3.0.0-ballot",
  "name" : "DMIIdentifiantLocalFabricant",
  "title" : "DMI Identifiant Local Fabricant",
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
  "description" : "Extension créée dans ce volet pour représenter l'identifiant local fabricant.",
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
    "expression" : "Organization"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "DMI Identifiant Local Fabricant",
      "definition" : "Extension créée dans ce volet pour représenter l'identifiant local fabricant."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-identifiant-local-fabricant"
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
