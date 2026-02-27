# dmi-supplydelivery-entete-delivrance-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-supplydelivery-entete-delivrance-example**

## Example SupplyDelivery: dmi-supplydelivery-entete-delivrance-example

Profil: [DMI SupplyDelivery Entete Delivrance](StructureDefinition-dmi-supplydelivery-entete-delivrance.md)

**DMI Reference Organisation Interne**: [Organization DMI Organization Interne Example Name](Organization-dmi-organization-interne-example.md)

**identifier**: identifier-dmi-supplydelivery-entete-delivrance-example

**basedOn**: [SupplyRequest : identifier = identifier-dmi-supplyrequest-entete-commande-example; item[x] = Commande de dispositifs médicaux; quantity = 2](SupplyRequest-dmi-supplyrequest-entete-commande-example.md)

**occurrence**: 2026-02-24



## Resource Content

```json
{
  "resourceType" : "SupplyDelivery",
  "id" : "dmi-supplydelivery-entete-delivrance-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-entete-delivrance"]
  },
  "extension" : [{
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-organisation-interne",
    "valueReference" : {
      "reference" : "Organization/dmi-organization-interne-example"
    }
  }],
  "identifier" : [{
    "value" : "identifier-dmi-supplydelivery-entete-delivrance-example"
  }],
  "basedOn" : [{
    "reference" : "SupplyRequest/dmi-supplyrequest-entete-commande-example"
  }],
  "occurrenceDateTime" : "2026-02-24"
}

```
