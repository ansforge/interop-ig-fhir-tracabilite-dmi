# dmi-supplydelivery-entete-reception-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-supplydelivery-entete-reception-example**

## Example SupplyDelivery: dmi-supplydelivery-entete-reception-example

Profil: [DMI SupplyDelivery Entete Reception](StructureDefinition-dmi-supplydelivery-enteter-reception.md)

**DMI Reference Organisation Interne**: [Organization DMI Organization Interne Example Name](Organization-dmi-organization-interne-example.md)

**identifier**: identifier-dmi-supplydelivery-entete-reception-example

**basedOn**: [SupplyRequest : identifier = identifier-dmi-supplyrequest-entete-commande-example; item[x] = Commande de dispositifs médicaux; quantity = 2](SupplyRequest-dmi-supplyrequest-entete-commande-example.md)

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
  "id" : "dmi-supplydelivery-entete-reception-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-enteter-reception"]
  },
  "extension" : [{
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-organisation-interne",
    "valueReference" : {
      "reference" : "Organization/dmi-organization-interne-example"
    }
  }],
  "identifier" : [{
    "value" : "identifier-dmi-supplydelivery-entete-reception-example"
  }],
  "basedOn" : [{
    "reference" : "SupplyRequest/dmi-supplyrequest-entete-commande-example"
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
