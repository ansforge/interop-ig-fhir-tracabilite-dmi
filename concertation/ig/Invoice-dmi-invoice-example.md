# dmi-invoice-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-invoice-example**

## Example Invoice: dmi-invoice-example

Profil: [DMI Invoice](StructureDefinition-dmi-invoice.md)

**identifier**: reference Facture/identifier-refFacture-example, reference Commande/identifier-refCommande-example

**status**: draft



## Resource Content

```json
{
  "resourceType" : "Invoice",
  "id" : "dmi-invoice-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-invoice"]
  },
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
        "code" : "refFacture"
      }]
    },
    "value" : "identifier-refFacture-example"
  },
  {
    "type" : {
      "coding" : [{
        "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
        "code" : "refCommande"
      }]
    },
    "value" : "identifier-refCommande-example"
  }],
  "status" : "draft"
}

```
