Profile: DMI_SupplyDeliveryEnteteDelivrance
Parent: SupplyDelivery
Id: DMI_SupplyDeliveryEnteteDelivrance
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteDelivrance"
* ^version = "1.0"
* ^status = #draft
* ^date = "2022-05-25"
* meta 1..
* meta.profile 1..1
* meta.profile = "http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteDelivrance" (exactly)
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains DMI_ReferenceOrganisationInterne named ReferenceOrganisationInterne 1..1
* extension[ReferenceOrganisationInterne] ^isModifier = false
* identifier 1..1
* suppliedItem.item[x] only Reference(Device)
* suppliedItem.item[x] ^binding.strength = #example
* occurrence[x] only dateTime