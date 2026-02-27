# SearchParameter DMI Device serialNumber - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SearchParameter DMI Device serialNumber**

## SearchParameter: SearchParameter DMI Device serialNumber 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/dmi-device-serialNumber | *Version*:3.0.0 |
| Draft as of 2022-05-24 | *Computable Name*:DMI_Device_serialNumber |

 
Permet la recherche sur le numéro de série du DMI 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "dmi-device-serialNumber",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/dmi-device-serialNumber",
  "version" : "3.0.0",
  "name" : "DMI_Device_serialNumber",
  "status" : "draft",
  "date" : "2022-05-24T00:00:00+02:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Permet la recherche sur le numéro de série du DMI",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "code" : "serialNumber",
  "base" : ["Device"],
  "type" : "string",
  "expression" : "Device.serialNumber"
}

```
