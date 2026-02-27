# dmi-procedure-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-procedure-example**

## Example Procedure: dmi-procedure-example

Profil: [DMI Procedure](StructureDefinition-dmi-procedure.md)

**identifier**: id Intervention/identifier-idIntervention-example

**status**: Preparation

**subject**: [Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( identifier-dmi-patient-example)](Patient-dmi-patient-example.md)

**performed**: 2026-02-24

### Performers

| | | |
| :--- | :--- | :--- |
| - | **Actor** | **OnBehalfOf** |
| * | [Practitioner : identifier = http://www.acme.com/identifiers#identifier-dmi-practitioner-example; telecom = dmi-practitioner-example@example.com](Practitioner-dmi-practitioner-example.md) | [Organization DMI Organization EJ Example Name](Organization-dmi-organization-ej-example.md) |

**bodySite**: région d'une cheville

### FocalDevices

| | |
| :--- | :--- |
| - | **Manipulated** |
| * | [Device : extension = IPIdLogiciel example,](Device-dmi-device-example.md) |



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "dmi-procedure-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-procedure"]
  },
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
        "code" : "idIntervention"
      }]
    },
    "value" : "identifier-idIntervention-example"
  }],
  "status" : "preparation",
  "subject" : {
    "reference" : "Patient/dmi-patient-example"
  },
  "performedDateTime" : "2026-02-24",
  "performer" : [{
    "actor" : {
      "reference" : "Practitioner/dmi-practitioner-example"
    },
    "onBehalfOf" : {
      "reference" : "Organization/dmi-organization-ej-example"
    }
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "344001",
      "display" : "région d'une cheville"
    }]
  }],
  "focalDevice" : [{
    "manipulated" : {
      "reference" : "Device/dmi-device-example"
    }
  }]
}

```
