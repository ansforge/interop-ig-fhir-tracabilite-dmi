# dmi-supplyrequest-entete-commande-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-supplyrequest-entete-commande-example**

## Example SupplyRequest: dmi-supplyrequest-entete-commande-example

Profil: [DMI SupplyRequest Entete Commande](StructureDefinition-dmi-supplyrequest-entete-commande.md)

**identifier**: identifier-dmi-supplyrequest-entete-commande-example

**item**: Commande de dispositifs médicaux

**quantity**: 2

**requester**: [Practitioner : identifier = http://www.acme.com/identifiers#identifier-dmi-practitioner-example; telecom = dmi-practitioner-example@example.com](Practitioner-dmi-practitioner-example.md)

**deliverTo**: [Organization DMI Organization Interne Example Name](Organization-dmi-organization-interne-example.md)



## Resource Content

```json
{
  "resourceType" : "SupplyRequest",
  "id" : "dmi-supplyrequest-entete-commande-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-commande"]
  },
  "identifier" : [{
    "value" : "identifier-dmi-supplyrequest-entete-commande-example"
  }],
  "itemCodeableConcept" : {
    "coding" : [{
      "system" : "https://mos.esante.gouv.fr/NOS/TRE_R254-TypeEvenement/FHIR/TRE-R254-TypeEvenement/TRE_R254-TypeEvenement-FHIR",
      "code" : "CDM",
      "display" : "Commande de dispositifs médicaux"
    }]
  },
  "quantity" : {
    "value" : 2
  },
  "requester" : {
    "reference" : "Practitioner/dmi-practitioner-example"
  },
  "deliverTo" : {
    "reference" : "Organization/dmi-organization-interne-example"
  }
}

```
