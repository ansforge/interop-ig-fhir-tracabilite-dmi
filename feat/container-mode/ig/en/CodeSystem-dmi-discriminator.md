# DMI Discriminator - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## CodeSystem: DMI Discriminator 

 
CodeSystem définissant les codes discriminants. 

This Code system is referenced in the definition of the following value sets:

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "dmi-discriminator",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablecodesystem"]
  },
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
  "version" : "3.0.0-ballot",
  "name" : "DMIDiscriminator",
  "title" : "DMI Discriminator",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-06-26T10:33:00+00:00",
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
