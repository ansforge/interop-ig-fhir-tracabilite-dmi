# DMI Discriminator - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI Discriminator**

## CodeSystem: DMI Discriminator 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator | *Version*:3.0.0 |
| Draft as of 2026-02-25 | *Computable Name*:DMIDiscriminator |

 
CodeSystem définissant les codes discriminants. 

 Cette terminologie de référence (CodeSystem) est référencé dans la définition de contenu des jeux de valeurs (ValueSet) suivants : 

* Cette terminologie de référence (CodeSystem) n'est pas utilisée ici; elle peut être utilisée ailleurs (par exemple spécifications et/ou implémentations qui utilisent ce contenu)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "dmi-discriminator",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablecodesystem"]
  },
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
  "version" : "3.0.0",
  "name" : "DMIDiscriminator",
  "title" : "DMI Discriminator",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-02-25T08:48:17+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "CodeSystem définissant les codes discriminants.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "caseSensitive" : true,
  "compositional" : false,
  "content" : "complete",
  "count" : 12,
  "concept" : [{
    "code" : "numeroTVAIntracommunautaire",
    "display" : "numéro de TVA intracommunautaire"
  },
  {
    "code" : "numeroSRN",
    "display" : "numéro SRN"
  },
  {
    "code" : "UsageUnique",
    "display" : "Usage unique"
  },
  {
    "code" : "NbReutilisation",
    "display" : "Nombre de réutilisation"
  },
  {
    "code" : "EmballageSterile",
    "display" : "Emballage stérile"
  },
  {
    "code" : "SterilisationAvantUtilisation",
    "display" : "Stérilisation avant utilisation"
  },
  {
    "code" : "Implantable",
    "display" : "Implantable"
  },
  {
    "code" : "Actif",
    "display" : "Actif"
  },
  {
    "code" : "refFacture",
    "display" : "reference Facture"
  },
  {
    "code" : "refCommande",
    "display" : "reference Commande"
  },
  {
    "code" : "idIntervention",
    "display" : "id Intervention"
  },
  {
    "code" : "numSejour",
    "display" : "num Sejour"
  }]
}

```
