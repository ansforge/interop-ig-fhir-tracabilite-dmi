Instance: dmi-organization-ej-example
InstanceOf: DMIOrganizationEJ
Usage: #example

* extension[IdentifiantLocalDistributeur].valueIdentifier.value = "identifiant-local-distributeur-example-ej"

* identifier[idNatSt].system = "urn:oid:1.2.250.1.71.4.2.2"
* identifier[idNatSt].type.coding.system = "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203"
* identifier[idNatSt].type.coding.code = #IDNST
* identifier[idNatSt].value = "identifer-idnatst-example"
* identifier[siren].system = "https://sirene.fr"
* identifier[siren].type.coding.system = "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203"
* identifier[siren].type.coding.code = #SIREN
* identifier[siren].value = "identifer-siren-example"

* name = "DMI Organization EJ Example Name"

* alias = "DMI Organization EJ Example Alias"

* address.text = "DMI Organization EJ Example Address"
