# DMIOrganizationEJ - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMIOrganizationEJ**

## Resource Profile: DMIOrganizationEJ 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-ej | *Version*:3.0.0 |
| Draft as of 2026-02-24 | *Computable Name*:DMIOrganizationEJ |

**Utilisations:**

* Utilise ce/t/te Profil: [DMIBundleTransmissionTraces](StructureDefinition-dmi-bundle-transmission-traces.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-organization-ej)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-organization-ej.csv), [Excel](StructureDefinition-dmi-organization-ej.xlsx), [Schematron](StructureDefinition-dmi-organization-ej.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-organization-ej",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-ej",
  "version" : "3.0.0",
  "name" : "DMIOrganizationEJ",
  "status" : "draft",
  "date" : "2026-02-24T10:11:35+00:00",
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
      "display" : "FRANCE"
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
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization.extension:IdentifiantLocalDistributeur",
      "path" : "Organization.extension",
      "sliceName" : "IdentifiantLocalDistributeur",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-identifiant-local-distributeur"]
      }]
    },
    {
      "id" : "Organization.extension:IdentifiantLocalFabricant",
      "path" : "Organization.extension",
      "sliceName" : "IdentifiantLocalFabricant",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-identifiant-local-fabricant"]
      }]
    },
    {
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
      "min" : 2
    },
    {
      "id" : "Organization.identifier:IdNatStruct",
      "path" : "Organization.identifier",
      "sliceName" : "IdNatStruct",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Organization.identifier:numSiren",
      "path" : "Organization.identifier",
      "sliceName" : "numSiren",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Organization.identifier:numFINESS",
      "path" : "Organization.identifier",
      "sliceName" : "numFINESS",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Organization.identifier:numeroTVAIntracommunautaire",
      "path" : "Organization.identifier",
      "sliceName" : "numeroTVAIntracommunautaire",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Organization.identifier:numeroTVAIntracommunautaire.type",
      "path" : "Organization.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "numeroTVAIntracommunautaire"
        }]
      }
    },
    {
      "id" : "Organization.identifier:numeroSRN",
      "path" : "Organization.identifier",
      "sliceName" : "numeroSRN",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Organization.identifier:numeroSRN.type",
      "path" : "Organization.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "numeroSRN"
        }]
      }
    },
    {
      "id" : "Organization.name",
      "path" : "Organization.name",
      "min" : 1
    },
    {
      "id" : "Organization.alias",
      "path" : "Organization.alias",
      "max" : "1"
    },
    {
      "id" : "Organization.address",
      "path" : "Organization.address",
      "max" : "1"
    }]
  }
}

```
