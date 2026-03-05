# dmi-device-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-device-example**

## Example Device: dmi-device-example

Profil: [DMI Device](StructureDefinition-dmi-device.md)

**DMI IP Id logiciel**: IPIdLogiciel example

> **DMI Marquage CE**
* organismeNotifie: [Organization DMI Organization Interne Example Name](Organization-dmi-organization-interne-example.md)
* libelleAutorisation: MarquageCE libelleAutorisation example



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "dmi-device-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-device"]
  },
  "extension" : [{
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-ip-id-logiciel",
    "valueString" : "IPIdLogiciel example"
  },
  {
    "extension" : [{
      "url" : "organismeNotifie",
      "valueReference" : {
        "reference" : "Organization/dmi-organization-interne-example"
      }
    },
    {
      "url" : "libelleAutorisation",
      "valueString" : "MarquageCE libelleAutorisation example"
    }],
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-marquage-ce"
  }]
}

```
