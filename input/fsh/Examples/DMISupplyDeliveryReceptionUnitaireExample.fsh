Instance: dmi-supplydelivery-reception-unitaire-example
InstanceOf: DMISupplyDeliveryReceptionUnitaire
Usage: #example

* identifier.value = "identifier-dmi-supplydelivery-reception-unitaire-example"

* extension[DMIReferenceOrganisationInterne].valueReference = Reference(dmi-organization-interne-example)

* occurrenceDateTime = "2026-02-24"

* status = #completed

* receiver = Reference(dmi-practitioner-example)

* suppliedItem.itemReference = Reference(dmi-device-example)