# DMI Organization Interne - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Resource Profile: DMI Organization Interne 

 
Profil créé dans le cadre de ce volet permettant de représenter l’organisation interne (Service utilisateur). 

**Usages:**

* Use this Profile: [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Refer to this Profile: [DMI Reference Organisation Interne](StructureDefinition-dmi-reference-organisation-interne.md)
* Examples for this Profile: [DMI Organization Interne Example Name](Organization-dmi-organization-interne-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-organization-interne.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-organization-interne.csv), [Excel](../StructureDefinition-dmi-organization-interne.xlsx), [Schematron](../StructureDefinition-dmi-organization-interne.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-organization-interne",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-interne",
  "version" : "3.0.0-ballot",
  "name" : "DMIOrganizationInterne",
  "title" : "DMI Organization Interne",
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
  "description" : "Profil créé dans le cadre de ce volet permettant de représenter l’organisation interne (Service utilisateur).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization.extension:IdentifiantLocalDistributeur",
      "path" : "Organization.extension",
      "sliceName" : "IdentifiantLocalDistributeur",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-identifiant-local-distributeur"]
      }]
    },
    {
      "id" : "Organization.extension:IdentifiantLocalFabricant",
      "path" : "Organization.extension",
      "sliceName" : "IdentifiantLocalFabricant",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-identifiant-local-fabricant"]
      }]
    },
    {
      "id" : "Organization.extension:OrganizationLocation",
      "path" : "Organization.extension",
      "sliceName" : "OrganizationLocation",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-location"]
      }]
    },
    {
      "id" : "Organization.type",
      "path" : "Organization.type",
      "min" : 1
    },
    {
      "id" : "Organization.type:TypeOrganizationInterne",
      "path" : "Organization.type",
      "sliceName" : "TypeOrganizationInterne",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Organization.type:TypeOrganizationInterne.coding.system",
      "path" : "Organization.type.coding.system",
      "patternUri" : "https://mos.esante.gouv.fr/NOS/TRE_R207-TypeOrganisationInterne/FHIR/TRE-R207-TypeOrganisationInterne"
    },
    {
      "id" : "Organization.type:CategorieOrganisation",
      "path" : "Organization.type",
      "sliceName" : "CategorieOrganisation",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Organization.type:CategorieOrganisation.coding.system",
      "path" : "Organization.type.coding.system",
      "patternUri" : "https://mos.esante.gouv.fr/NOS/TRE_R244-CategorieOrganisation/FHIR/TRE-R244-CategorieOrganisation"
    }]
  }
}

```
