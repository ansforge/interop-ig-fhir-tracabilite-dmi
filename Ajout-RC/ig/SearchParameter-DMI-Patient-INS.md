# SearchParameter DMI Patient INS - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SearchParameter DMI Patient INS**

## SearchParameter: SearchParameter DMI Patient INS 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/DMI-Patient-INS | *Version*:3.0.0 |
| Draft as of 2026-02-25 | *Computable Name*:DMI_Patient_INS |

 
Permet la recherche sur l'ins du patient 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "DMI-Patient-INS",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/DMI-Patient-INS",
  "version" : "3.0.0",
  "name" : "DMI_Patient_INS",
  "status" : "draft",
  "date" : "2026-02-25T08:48:17+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Permet la recherche sur l'ins du patient",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "code" : "ins",
  "base" : ["Patient"],
  "type" : "token",
  "expression" : "Patient.identifier.where(type.coding.code='INS-C').value"
}

```
