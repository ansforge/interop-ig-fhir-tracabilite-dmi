Instance: dmi-supplydelivery-transport-example
InstanceOf: DMISupplyDeliveryTransport
Usage: #example

* identifier.value = "identifier-dmi-supplydelivery-transport-example"

* extension[DMIReferenceOrganisationInterne].valueReference = Reference(dmi-organization-interne-example)

* extension[DMITransport].extension[refTransport].valueIdentifier.value = "identifier-reftransport-example"
* extension[DMITransport].extension[refDelivery].valueIdentifier.value = "identifier-refdelivery-example"
* extension[DMITransport].extension[meta].valueMeta.versionId = "meta-versionid-example"

* occurrenceDateTime = "2026-02-24"

* status = #completed

* receiver = Reference(dmi-practitioner-example)

* suppliedItem.itemReference = Reference(dmi-device-example)