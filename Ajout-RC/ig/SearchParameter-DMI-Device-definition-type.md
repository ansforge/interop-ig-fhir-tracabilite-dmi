# SearchParameter DMI Device definitionType - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SearchParameter DMI Device definitionType**

## SearchParameter: SearchParameter DMI Device definitionType 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/DMI-Device-definition-type | *Version*:3.0.0 |
| Draft as of 2022-05-24 | *Computable Name*:DMI_Device_definitionType |

 
Permet la recherche sur le type de définition du DMI 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "DMI-Device-definition-type",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/DMI-Device-definition-type",
  "version" : "3.0.0",
  "name" : "DMI_Device_definitionType",
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
  "description" : "Permet la recherche sur le type de définition du DMI",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "code" : "definitionType",
  "base" : ["Device"],
  "type" : "token"
}

```
