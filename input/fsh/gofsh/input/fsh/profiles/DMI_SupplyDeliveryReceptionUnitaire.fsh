Profile: DMI_SupplyDeliveryReceptionUnitaire
Parent: SupplyDelivery
Id: dmi-supplydelivery-reception-unitaire
* meta 1..
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains DMI_ReferenceOrganisationInterne named ReferenceOrganisationInterne 1..1
* extension[ReferenceOrganisationInterne] ^isModifier = false
* identifier 1..1
* status 1..
* suppliedItem.item[x] only Reference(Device)
* suppliedItem.item[x] ^binding.strength = #example
* occurrence[x] 1..
* occurrence[x] only dateTime
* receiver 1..1