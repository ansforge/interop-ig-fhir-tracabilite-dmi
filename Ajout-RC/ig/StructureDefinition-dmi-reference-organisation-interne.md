# DMIReferenceOrganisationInterne - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMIReferenceOrganisationInterne**

## Extension: DMIReferenceOrganisationInterne 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-organisation-interne | *Version*:3.0.0 |
| Draft as of 2026-02-24 | *Computable Name*:DMIReferenceOrganisationInterne |

**Context of Use**

**Usage info**

**Utilisations:**

* Utilise ce/t/te Extension: [DMISupplyDeliveryEnteteDelivrance](StructureDefinition-dmi-supplydelivery-entete-delivrance.md), [DMISupplyDeliveryEnteteLivraison](StructureDefinition-dmi-supplydelivery-entete-livraison.md), [DMISupplyDeliveryEnteteReception](StructureDefinition-dmi-supplydelivery-enteter-reception.md), [DMISupplyDeliveryLigne](StructureDefinition-dmi-supplydelivery-ligne.md)... Show 2 more, [DMISupplyDeliveryReceptionUnitaire](StructureDefinition-dmi-supplydelivery-reception-unitaire.md) and [DMISupplyDeliveryTransport](StructureDefinition-dmi-supplydelivery-transport.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-reference-organisation-interne)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-reference-organisation-interne.csv), [Excel](StructureDefinition-dmi-reference-organisation-interne.xlsx), [Schematron](StructureDefinition-dmi-reference-organisation-interne.sch) 

#### Contraintes



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-reference-organisation-interne",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-organisation-interne",
  "version" : "3.0.0",
  "name" : "DMIReferenceOrganisationInterne",
  "status" : "draft",
  "date" : "2026-02-24T10:44:05+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
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
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-organisation-interne"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-interne"]
      }]
    }]
  }
}

```
