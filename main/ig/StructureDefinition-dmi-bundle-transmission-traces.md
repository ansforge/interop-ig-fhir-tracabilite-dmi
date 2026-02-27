# DMI Bundle Transmission Traces - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI Bundle Transmission Traces**

## Resource Profile: DMI Bundle Transmission Traces 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundle-transmission-traces | *Version*:3.0.0 |
| Draft as of 2026-02-27 | *Computable Name*:DMIBundleTransmissionTraces |

 
Profil créé dans le cadre de ce volet pour transmettre l’ensemble des ressources au serveur. 

**Utilisations:**

* Exemples pour ce/t/te Profil: [Bundle/dmi-bundle-transmission-traces-example](Bundle-dmi-bundle-transmission-traces-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-bundle-transmission-traces)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-bundle-transmission-traces.csv), [Excel](StructureDefinition-dmi-bundle-transmission-traces.xlsx), [Schematron](StructureDefinition-dmi-bundle-transmission-traces.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-bundle-transmission-traces",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundle-transmission-traces",
  "version" : "3.0.0",
  "name" : "DMIBundleTransmissionTraces",
  "title" : "DMI Bundle Transmission Traces",
  "status" : "draft",
  "date" : "2026-02-27T10:34:43+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Profil créé dans le cadre de ce volet pour transmettre l’ensemble des ressources au serveur.",
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
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Bundle",
      "path" : "Bundle"
    },
    {
      "id" : "Bundle.type",
      "path" : "Bundle.type",
      "patternCode" : "transaction"
    },
    {
      "id" : "Bundle.entry",
      "path" : "Bundle.entry",
      "slicing" : {
        "discriminator" : [{
          "type" : "profile",
          "path" : "resource"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Bundle.entry:DispositifMedical",
      "path" : "Bundle.entry",
      "sliceName" : "DispositifMedical",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:DispositifMedical.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Device",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-device"]
      }]
    },
    {
      "id" : "Bundle.entry:DeviceDefinition",
      "path" : "Bundle.entry",
      "sliceName" : "DeviceDefinition",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:DeviceDefinition.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "DeviceDefinition",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicedefinition"]
      }]
    },
    {
      "id" : "Bundle.entry:Patient",
      "path" : "Bundle.entry",
      "sliceName" : "Patient",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:Patient.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Patient",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-patient"]
      }]
    },
    {
      "id" : "Bundle.entry:Professionnel",
      "path" : "Bundle.entry",
      "sliceName" : "Professionnel",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:Professionnel.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Practitioner",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-practitioner"]
      }]
    },
    {
      "id" : "Bundle.entry:EntiteJuridique",
      "path" : "Bundle.entry",
      "sliceName" : "EntiteJuridique",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:EntiteJuridique.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Organization",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-ej"]
      }]
    },
    {
      "id" : "Bundle.entry:OrganisationInterne",
      "path" : "Bundle.entry",
      "sliceName" : "OrganisationInterne",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:OrganisationInterne.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Organization",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-interne"]
      }]
    },
    {
      "id" : "Bundle.entry:Invoice",
      "path" : "Bundle.entry",
      "sliceName" : "Invoice",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:Invoice.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Invoice",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-invoice"]
      }]
    },
    {
      "id" : "Bundle.entry:Procedure",
      "path" : "Bundle.entry",
      "sliceName" : "Procedure",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:Procedure.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Procedure",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-procedure"]
      }]
    },
    {
      "id" : "Bundle.entry:SupplyRequest",
      "path" : "Bundle.entry",
      "sliceName" : "SupplyRequest",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:SupplyRequest.resource",
      "path" : "Bundle.entry.resource",
      "type" : [{
        "code" : "SupplyRequest",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-demande",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entete-commande",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplyrequest-entetereponse"]
      }]
    },
    {
      "id" : "Bundle.entry:SupplyDelivery",
      "path" : "Bundle.entry",
      "sliceName" : "SupplyDelivery",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:SupplyDelivery.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "SupplyDelivery",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-reception-unitaire",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-enteter-reception",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-entete-delivrance",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-entete-livraison",
        "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-supplydelivery-ligne"]
      }]
    },
    {
      "id" : "Bundle.entry:AuditEvent",
      "path" : "Bundle.entry",
      "sliceName" : "AuditEvent",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Bundle.entry:AuditEvent.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "AuditEvent",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent"]
      }]
    },
    {
      "id" : "Bundle.entry:BundleRequest",
      "path" : "Bundle.entry",
      "sliceName" : "BundleRequest",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:BundleRequest.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Bundle",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundle-request"]
      }]
    },
    {
      "id" : "Bundle.entry:BundleDelivery",
      "path" : "Bundle.entry",
      "sliceName" : "BundleDelivery",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Bundle.entry:BundleDelivery.resource",
      "path" : "Bundle.entry.resource",
      "type" : [{
        "code" : "Bundle",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundledelivery"]
      }]
    }]
  }
}

```
