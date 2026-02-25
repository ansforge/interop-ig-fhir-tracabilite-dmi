# dmi-organization-ej-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-organization-ej-example**

## Example Organization: dmi-organization-ej-example

Profil: [DMI Organization EJ](StructureDefinition-dmi-organization-ej.md)

**DMI Identifiant Local Distributeur**: identifiant-local-distributeur-example-ej

**identifier**: Identification nationale de structure définie par l’ANS dans le CI_SIS/identifer-idnatst-example, Identification de l'organisation au SIREN/identifer-siren-example

**name**: DMI Organization EJ Example Name

**alias**: DMI Organization EJ Example Alias

**address**: DMI Organization EJ Example Address



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "dmi-organization-ej-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-organization-ej"]
  },
  "extension" : [{
    "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-identifiant-local-distributeur",
    "valueIdentifier" : {
      "value" : "identifiant-local-distributeur-example-ej"
    }
  }],
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
        "code" : "IDNST"
      }]
    },
    "system" : "urn:oid:1.2.250.1.71.4.2.2",
    "value" : "identifer-idnatst-example"
  },
  {
    "type" : {
      "coding" : [{
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
        "code" : "SIREN"
      }]
    },
    "system" : "https://sirene.fr",
    "value" : "identifer-siren-example"
  }],
  "name" : "DMI Organization EJ Example Name",
  "alias" : ["DMI Organization EJ Example Alias"],
  "address" : [{
    "text" : "DMI Organization EJ Example Address"
  }]
}

```
