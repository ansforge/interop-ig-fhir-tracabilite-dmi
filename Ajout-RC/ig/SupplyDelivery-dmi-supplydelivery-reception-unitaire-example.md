# dmi-supplydelivery-reception-unitaire-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-supplydelivery-reception-unitaire-example**

## Example SupplyDelivery: dmi-supplydelivery-reception-unitaire-example

Profil: [DMISupplyDeliveryReceptionUnitaire](StructureDefinition-dmi-supplydelivery-reception-unitaire.md)

**DMIReferenceOrganisationInterne**: [Organization DMI Organization Interne Example Name](Organization-dmi-organization-interne-example.md)

**identifier**: identifier-dmi-supplydelivery-reception-unitaire-example

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
  "id" : "dmi-supplydelivery-reception-unitaire-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-reception-unitaire"]
  },
  "extension" : [{
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-organisation-interne",
    "valueReference" : {
      "reference" : "Organization/dmi-organization-interne-example"
    }
  }],
  "identifier" : [{
    "value" : "identifier-dmi-supplydelivery-reception-unitaire-example"
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
