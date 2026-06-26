# DMI SupplyRequest Entete Commande - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Resource Profile: DMI SupplyRequest Entete Commande 

 
Profil créé dans le cadre de ce volet permet transporter les informations générales d’une commande de dispositif médical. 

**Usages:**

* Use this Profile: [DMI Bundle Request](StructureDefinition-dmi-bundle-request.md) and [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Examples for this Profile: [SupplyRequest/dmi-supplyrequest-entete-commande-example](SupplyRequest-dmi-supplyrequest-entete-commande-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-supplyrequest-entete-commande.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-supplyrequest-entete-commande.csv), [Excel](../StructureDefinition-dmi-supplyrequest-entete-commande.xlsx), [Schematron](../StructureDefinition-dmi-supplyrequest-entete-commande.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-supplyrequest-entete-commande",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-commande",
  "version" : "3.0.0-ballot",
  "name" : "DMISupplyRequestEnteteCommande",
  "title" : "DMI SupplyRequest Entete Commande",
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
  "description" : "Profil créé dans le cadre de ce volet permet transporter les informations générales d’une commande de dispositif médical.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "SupplyRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/SupplyRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "SupplyRequest.identifier",
      "path" : "SupplyRequest.identifier",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "SupplyRequest.item[x]",
      "path" : "SupplyRequest.item[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_R254-TypeEvenement/FHIR/TRE-R254-TypeEvenement/TRE_R254-TypeEvenement-FHIR",
          "code" : "CDM"
        }]
      }
    },
    {
      "id" : "SupplyRequest.requester",
      "path" : "SupplyRequest.requester",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner"]
      }]
    },
    {
      "id" : "SupplyRequest.deliverTo",
      "path" : "SupplyRequest.deliverTo",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Organization"]
      }]
    }]
  }
}

```
