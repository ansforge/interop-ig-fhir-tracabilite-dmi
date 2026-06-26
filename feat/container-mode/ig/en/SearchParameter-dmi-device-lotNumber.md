# SearchParameter DMI Device lotNumber - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## SearchParameter: SearchParameter DMI Device lotNumber 

 
Permet de faire une recherche sur le numéro de lot du DMI 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "dmi-device-lotNumber",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/SearchParameter/dmi-device-lotNumber",
  "version" : "3.0.0-ballot",
  "name" : "DMI_Device_lotNumber",
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
