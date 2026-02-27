# dmi-practitioner-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-practitioner-example**

## Example Practitioner: dmi-practitioner-example

Profil: [DMI Practitioner](StructureDefinition-dmi-practitioner.md)

**identifier**: `http://www.acme.com/identifiers`/identifier-dmi-practitioner-example

**telecom**: [dmi-practitioner-example@example.com](mailto:dmi-practitioner-example@example.com)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "dmi-practitioner-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-practitioner"]
  },
  "identifier" : [{
    "system" : "http://www.acme.com/identifiers",
    "value" : "identifier-dmi-practitioner-example"
  }],
  "telecom" : [{
    "system" : "email",
    "value" : "dmi-practitioner-example@example.com"
  }]
}

```
