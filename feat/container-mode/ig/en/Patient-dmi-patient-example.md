# dmi-patient-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Example Patient: dmi-patient-example

Profile: [DMI Patient](StructureDefinition-dmi-patient.md)

Anonymous Patient (no stated gender), DoB Unknown ( identifier-dmi-patient-example)

-------

| | |
| :--- | :--- |
| Contact Detail | [dmi-patient-example@example.com](mailto:dmi-patient-example@example.com) |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "dmi-patient-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-patient"]
  },
  "identifier" : [{
    "value" : "identifier-dmi-patient-example"
  }],
  "telecom" : [{
    "system" : "email",
    "value" : "dmi-patient-example@example.com"
  }]
}

```
