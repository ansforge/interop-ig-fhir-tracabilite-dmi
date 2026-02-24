# dmi-organization-interne-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-organization-interne-example**

## Example Organization: dmi-organization-interne-example

Profil: [DMIOrganizationInterne](StructureDefinition-dmi-organization-interne.md)

**DMIIdentifiantLocalDistributeur**: identifiant-local-distributeur-example-oi

**type**: Structure interne ou Service

**name**: DMI Organization Interne Example Name



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "dmi-organization-interne-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-interne"]
  },
  "extension" : [{
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-identifiant-local-distributeur",
    "valueIdentifier" : {
      "value" : "identifiant-local-distributeur-example-oi"
    }
  }],
  "type" : [{
    "coding" : [{
      "system" : "https://mos.esante.gouv.fr/NOS/TRE_R207-TypeOrganisationInterne/FHIR/TRE-R207-TypeOrganisationInterne",
      "code" : "2",
      "display" : "Structure interne ou Service"
    }]
  }],
  "name" : "DMI Organization Interne Example Name"
}

```
