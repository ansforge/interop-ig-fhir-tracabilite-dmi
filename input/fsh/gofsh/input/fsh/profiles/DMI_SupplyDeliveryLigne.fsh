Profile: DMI_SupplyDeliveryLigne
Parent: SupplyDelivery
Id: DMI_SupplyDeliveryLigne
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne"
* ^version = "1.0"
* ^status = #draft
* ^date = "2022-05-25"
* meta 1..
* meta.profile 1..1
* meta.profile = "http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne" (exactly)
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains DMI_ReferenceOrganisationInterne named ReferenceOrganisationInterne 1..1
* extension[ReferenceOrganisationInterne] ^isModifier = false
* identifier 1..1
* basedOn 1..1
* partOf 1..1
* partOf only Reference(SupplyDelivery)
* suppliedItem 1..
* suppliedItem.item[x] 1..
* suppliedItem.item[x] only Reference(Device)
* suppliedItem.item[x] ^binding.strength = #example
* occurrence[x] only dateTime