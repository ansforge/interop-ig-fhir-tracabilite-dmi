# DMI Procedure - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI Procedure**

## Resource Profile: DMI Procedure 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-procedure | *Version*:3.0.0 |
| Draft as of 2026-02-27 | *Computable Name*:DMIProcedure |

 
Profil créé dans le cadre de ce volet pour représenter l’intervention clinique ou chirurgicale implantant un dispositif médical. 

**Utilisations:**

* Utilise ce/t/te Profil: [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Exemples pour ce/t/te Profil: [Procedure/dmi-procedure-example](Procedure-dmi-procedure-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-procedure)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-procedure.csv), [Excel](StructureDefinition-dmi-procedure.xlsx), [Schematron](StructureDefinition-dmi-procedure.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-procedure",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-procedure",
  "version" : "3.0.0",
  "name" : "DMIProcedure",
  "title" : "DMI Procedure",
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
  "description" : "Profil créé dans le cadre de ce volet pour représenter l’intervention clinique ou chirurgicale implantant un dispositif médical.",
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Procedure",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure.identifier",
      "path" : "Procedure.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Procedure.identifier:idIntervention",
      "path" : "Procedure.identifier",
      "sliceName" : "idIntervention",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Procedure.identifier:idIntervention.type",
      "path" : "Procedure.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "idIntervention"
        }]
      }
    },
    {
      "id" : "Procedure.identifier:idIntervention.value",
      "path" : "Procedure.identifier.value",
      "min" : 1
    },
    {
      "id" : "Procedure.identifier:numSejour",
      "path" : "Procedure.identifier",
      "sliceName" : "numSejour",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Procedure.identifier:numSejour.type",
      "path" : "Procedure.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "numSejour"
        }]
      }
    },
    {
      "id" : "Procedure.identifier:numSejour.value",
      "path" : "Procedure.identifier.value",
      "min" : 1
    },
    {
      "id" : "Procedure.performed[x]",
      "path" : "Procedure.performed[x]",
      "min" : 1,
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Procedure.performer",
      "path" : "Procedure.performer",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Procedure.performer.onBehalfOf",
      "path" : "Procedure.performer.onBehalfOf",
      "min" : 1
    },
    {
      "id" : "Procedure.bodySite",
      "path" : "Procedure.bodySite",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Procedure.focalDevice",
      "path" : "Procedure.focalDevice",
      "min" : 1,
      "max" : "1"
    }]
  }
}

```
