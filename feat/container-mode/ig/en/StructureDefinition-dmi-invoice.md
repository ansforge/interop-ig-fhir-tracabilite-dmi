# DMI Invoice - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Resource Profile: DMI Invoice 

 
Profil créé dans le cadre de ce volet pour représenter la facturation de dispositifs médicaux. 

**Usages:**

* Use this Profile: [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Examples for this Profile: [Invoice/dmi-invoice-example](Invoice-dmi-invoice-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-invoice.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-invoice.csv), [Excel](../StructureDefinition-dmi-invoice.xlsx), [Schematron](../StructureDefinition-dmi-invoice.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-invoice",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-invoice",
  "version" : "3.0.0-ballot",
  "name" : "DMIInvoice",
  "title" : "DMI Invoice",
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
  "description" : "Profil créé dans le cadre de ce volet pour représenter la facturation de dispositifs médicaux.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Invoice",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Invoice",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Invoice.extension",
      "path" : "Invoice.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Invoice.extension:Facture",
      "path" : "Invoice.extension",
      "sliceName" : "Facture",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-facture"]
      }]
    },
    {
      "id" : "Invoice.identifier",
      "path" : "Invoice.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type"
        }],
        "rules" : "open"
      },
      "min" : 2
    },
    {
      "id" : "Invoice.identifier:refFacture",
      "path" : "Invoice.identifier",
      "sliceName" : "refFacture",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Invoice.identifier:refFacture.type",
      "path" : "Invoice.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "refFacture"
        }]
      }
    },
    {
      "id" : "Invoice.identifier:refFacture.value",
      "path" : "Invoice.identifier.value",
      "min" : 1
    },
    {
      "id" : "Invoice.identifier:refCommande",
      "path" : "Invoice.identifier",
      "sliceName" : "refCommande",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Invoice.identifier:refCommande.type",
      "path" : "Invoice.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "refCommande"
        }]
      }
    },
    {
      "id" : "Invoice.identifier:refCommande.value",
      "path" : "Invoice.identifier.value",
      "min" : 1
    }]
  }
}

```
