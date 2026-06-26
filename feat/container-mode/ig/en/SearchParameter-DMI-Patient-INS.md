# SearchParameter DMI Patient INS - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## SearchParameter: SearchParameter DMI Patient INS 

 
Permet la recherche sur l'ins du patient 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "DMI-Patient-INS",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/DMI-Patient-INS",
  "version" : "3.0.0-ballot",
  "name" : "DMI_Patient_INS",
  "status" : "draft",
  "date" : "2026-06-26T10:33:00+00:00",
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
