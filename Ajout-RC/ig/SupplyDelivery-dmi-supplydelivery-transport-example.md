# dmi-supplydelivery-transport-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-supplydelivery-transport-example**

## Example SupplyDelivery: dmi-supplydelivery-transport-example

Profil: [DMI SupplyDelivery Transport](StructureDefinition-dmi-supplydelivery-transport.md)

**DMI Reference Organisation Interne**: [Organization DMI Organization Interne Example Name](Organization-dmi-organization-interne-example.md)

> **DMI Transport**
* refTransport: identifier-reftransport-example
* refDelivery: identifier-refdelivery-example
* meta: Pas d'affichage pour Meta (versionId : meta-versionid-example)

**identifier**: identifier-dmi-supplydelivery-transport-example

**status**: Delivered

### SuppliedItems

| | |
| :--- | :--- |
| - | **Item[x]** |
| * | [Device : extension = IPIdLogiciel example,](Device-dmi-device-example.md) |

**occurrence**: 2026-02-24

**receiver**: [Practitioner : identifier = http://www.acme.com/identifiers#identifier-dmi-practitioner-example; telecom = dmi-practitioner-example@example.com](Practitioner-dmi-practitioner-example.md)



## Resource Content

```json
{
  "resourceType" : "SupplyDelivery",
  "id" : "dmi-supplydelivery-transport-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-transport"]
  },
  "extension" : [{
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-organisation-interne",
    "valueReference" : {
      "reference" : "Organization/dmi-organization-interne-example"
    }
  },
  {
    "extension" : [{
      "url" : "refTransport",
      "valueIdentifier" : {
        "value" : "identifier-reftransport-example"
      }
    },
    {
      "url" : "refDelivery",
      "valueIdentifier" : {
        "value" : "identifier-refdelivery-example"
      }
    },
    {
      "url" : "meta",
      "valueMeta" : {
        "versionId" : "meta-versionid-example"
      }
    }],
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-transport"
  }],
  "identifier" : [{
    "value" : "identifier-dmi-supplydelivery-transport-example"
  }],
  "status" : "completed",
  "suppliedItem" : {
    "itemReference" : {
      "reference" : "Device/dmi-device-example"
    }
  },
  "occurrenceDateTime" : "2026-02-24",
  "receiver" : [{
    "reference" : "Practitioner/dmi-practitioner-example"
  }]
}

```
