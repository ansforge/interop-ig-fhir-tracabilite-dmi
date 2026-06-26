# DMI Reference Organisation Interne - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Extension: DMI Reference Organisation Interne 

Extension créée dans ce volet pour référencer l'organisation fabricant du DMI.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [DMI SupplyDelivery Entete Delivrance](StructureDefinition-dmi-supplydelivery-entete-delivrance.md), [DMI SupplyDelivery Entete Livraison](StructureDefinition-dmi-supplydelivery-entete-livraison.md), [DMI SupplyDelivery Entete Reception](StructureDefinition-dmi-supplydelivery-enteter-reception.md), [DMI SupplyDelivery Ligne](StructureDefinition-dmi-supplydelivery-ligne.md)... Show 2 more, [DMI SupplyDelivery Reception Unitaire](StructureDefinition-dmi-supplydelivery-reception-unitaire.md) and [DMI SupplyDelivery Transport](StructureDefinition-dmi-supplydelivery-transport.md)
* Examples for this Extension: [Bundle/dmi-bundle-delivery-example](Bundle-dmi-bundle-delivery-example.md), [SupplyDelivery/dmi-supplydelivery-entete-delivrance-example](SupplyDelivery-dmi-supplydelivery-entete-delivrance-example.md), [SupplyDelivery/dmi-supplydelivery-entete-livraison-example](SupplyDelivery-dmi-supplydelivery-entete-livraison-example.md), [SupplyDelivery/dmi-supplydelivery-entete-reception-example](SupplyDelivery-dmi-supplydelivery-entete-reception-example.md)... Show 3 more, [SupplyDelivery/dmi-supplydelivery-ligne-example](SupplyDelivery-dmi-supplydelivery-ligne-example.md), [SupplyDelivery/dmi-supplydelivery-reception-unitaire-example](SupplyDelivery-dmi-supplydelivery-reception-unitaire-example.md) and [SupplyDelivery/dmi-supplydelivery-transport-example](SupplyDelivery-dmi-supplydelivery-transport-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-reference-organisation-interne.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-reference-organisation-interne.csv), [Excel](../StructureDefinition-dmi-reference-organisation-interne.xlsx), [Schematron](../StructureDefinition-dmi-reference-organisation-interne.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-reference-organisation-interne",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-organisation-interne",
  "version" : "3.0.0-ballot",
  "name" : "DMIReferenceOrganisationInterne",
  "title" : "DMI Reference Organisation Interne",
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
  "description" : "Extension créée dans ce volet pour référencer l'organisation fabricant du DMI.",
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
      "short" : "DMI Reference Organisation Interne",
      "definition" : "Extension créée dans ce volet pour référencer l'organisation fabricant du DMI."
    },
    {
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
