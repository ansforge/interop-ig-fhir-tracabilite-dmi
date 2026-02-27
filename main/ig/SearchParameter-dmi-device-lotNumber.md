# SearchParameter DMI Device lotNumber - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SearchParameter DMI Device lotNumber**

## SearchParameter: SearchParameter DMI Device lotNumber 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/dmi-device-lotNumber | *Version*:3.0.0 |
| Draft as of 2026-02-27 | *Computable Name*:DMI_Device_lotNumber |

 
Permet de faire une recherche sur le numéro de lot du DMI 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "dmi-device-lotNumber",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/dmi-device-lotNumber",
  "version" : "3.0.0",
  "name" : "DMI_Device_lotNumber",
  "status" : "draft",
  "date" : "2026-02-27T10:37:28+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Permet de faire une recherche sur le numéro de lot du DMI",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "code" : "lotNumber",
  "base" : ["Device"],
  "type" : "string",
  "expression" : "Device.lotNumber"
}

```
