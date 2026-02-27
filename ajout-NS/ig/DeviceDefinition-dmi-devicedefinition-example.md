# dmi-devicedefinition-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-devicedefinition-example**

## Example DeviceDefinition: dmi-devicedefinition-example

Profil: [DMI DeviceDefinition](StructureDefinition-dmi-devicedefinition.md)

**DMI Classe Risque**: ClasseRisqueExample

### Properties

| | | |
| :--- | :--- | :--- |
| - | **Type** | **ValueQuantity** |
| * | Nombre de réutilisation | 5 |



## Resource Content

```json
{
  "resourceType" : "DeviceDefinition",
  "id" : "dmi-devicedefinition-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicedefinition"]
  },
  "extension" : [{
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-classe-risque",
    "valueCode" : "ClasseRisqueExample"
  }],
  "property" : [{
    "type" : {
      "coding" : [{
        "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
        "code" : "NbReutilisation"
      }]
    },
    "valueQuantity" : [{
      "value" : 5
    }]
  }]
}

```
