# dmi-patient-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-patient-example**

## Example Patient: dmi-patient-example

Profil: [DMIPatient](StructureDefinition-dmi-patient.md)

Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( identifier-dmi-patient-example)

-------

| | |
| :--- | :--- |
| Coordonnées | [dmi-patient-example@example.com](mailto:dmi-patient-example@example.com) |



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
