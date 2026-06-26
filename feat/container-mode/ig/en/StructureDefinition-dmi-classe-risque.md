# DMI Classe Risque - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Extension: DMI Classe Risque 

Extension créée dans ce volet pour représenter la classe de risque.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [DMI DeviceDefinition](StructureDefinition-dmi-devicedefinition.md)
* Examples for this Extension: [Bundle/dmi-bundle-transmission-traces-example](Bundle-dmi-bundle-transmission-traces-example.md) and [DeviceDefinition/dmi-devicedefinition-example](DeviceDefinition-dmi-devicedefinition-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-classe-risque.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-classe-risque.csv), [Excel](../StructureDefinition-dmi-classe-risque.xlsx), [Schematron](../StructureDefinition-dmi-classe-risque.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-classe-risque",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-classe-risque",
  "version" : "3.0.0-ballot",
  "name" : "DMIClasseRisque",
  "title" : "DMI Classe Risque",
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
  "description" : "Extension créée dans ce volet pour représenter la classe de risque.",
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
      "short" : "DMI Classe Risque",
      "definition" : "Extension créée dans ce volet pour représenter la classe de risque."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-classe-risque"
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
