Profile: DMISupplyDeliveryTransport
Parent: SupplyDelivery
Id: dmi-supplydelivery-transport
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    DMITransport named Transport 0..1 and
    DMIReferenceOrganisationInterne named ReferenceOrganisationInterne 1..1
* extension[Transport] ^isModifier = false
* extension[ReferenceOrganisationInterne] ^isModifier = false
* identifier 1..1
* status 1..
* suppliedItem.item[x] only Reference(Device)
* suppliedItem.item[x] ^binding.strength = #example
* occurrence[x] 1..
* occurrence[x] only dateTime
* receiver 1..1