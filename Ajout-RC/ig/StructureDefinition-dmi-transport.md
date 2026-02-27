# DMI Transport - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI Transport**

## Extension: DMI Transport 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-transport | *Version*:3.0.0 |
| Draft as of 2026-02-27 | *Computable Name*:DMITransport |

Extension créée dans ce volet pour représenter le transport.

**Context of Use**

**Usage info**

**Utilisations:**

* Utilise ce/t/te Extension: [DMI SupplyDelivery Transport](StructureDefinition-dmi-supplydelivery-transport.md)
* Exemples pour ce/t/te Extension: [Bundle/dmi-bundle-delivery-example](Bundle-dmi-bundle-delivery-example.md) and [SupplyDelivery/dmi-supplydelivery-transport-example](SupplyDelivery-dmi-supplydelivery-transport-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-transport)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-transport.csv), [Excel](StructureDefinition-dmi-transport.xlsx), [Schematron](StructureDefinition-dmi-transport.sch) 

#### Contraintes



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-transport",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-transport",
  "version" : "3.0.0",
  "name" : "DMITransport",
  "title" : "DMI Transport",
  "status" : "draft",
  "date" : "2026-02-27T10:05:33+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Extension créée dans ce volet pour représenter le transport.",
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
    "expression" : "SupplyDelivery"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "DMI Transport",
      "definition" : "Extension créée dans ce volet pour représenter le transport."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 3
    },
    {
      "id" : "Extension.extension:refTransport",
      "path" : "Extension.extension",
      "sliceName" : "refTransport",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:refTransport.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:refTransport.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "refTransport"
    },
    {
      "id" : "Extension.extension:refTransport.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "Extension.extension:refDelivery",
      "path" : "Extension.extension",
      "sliceName" : "refDelivery",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:refDelivery.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:refDelivery.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "refDelivery"
    },
    {
      "id" : "Extension.extension:refDelivery.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "Extension.extension:incident",
      "path" : "Extension.extension",
      "sliceName" : "incident",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:incident.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:incident.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "incident"
    },
    {
      "id" : "Extension.extension:incident.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "Extension.extension:detailIncident",
      "path" : "Extension.extension",
      "sliceName" : "detailIncident",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:detailIncident.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:detailIncident.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "detailIncident"
    },
    {
      "id" : "Extension.extension:detailIncident.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:text",
      "path" : "Extension.extension",
      "sliceName" : "text",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:text.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:text.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "text"
    },
    {
      "id" : "Extension.extension:text.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:meta",
      "path" : "Extension.extension",
      "sliceName" : "meta",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:meta.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:meta.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "meta"
    },
    {
      "id" : "Extension.extension:meta.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Meta"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-transport"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
