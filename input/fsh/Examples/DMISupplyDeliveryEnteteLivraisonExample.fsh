Instance: dmi-supplydelivery-entete-livraison-example
InstanceOf: DMISupplyDeliveryEnteteLivraison
Usage: #example

* identifier.value = "identifier-dmi-supplydelivery-entete-livraison-example"

* extension[DMIReferenceOrganisationInterne].valueReference = Reference(dmi-organization-interne-example)

* occurrenceDateTime = "2026-02-24"

* status = #completed

* receiver = Reference(dmi-practitioner-example)

* suppliedItem.itemReference = Reference(dmi-device-example)

* basedOn = Reference(dmi-supplyrequest-entete-commande-example)