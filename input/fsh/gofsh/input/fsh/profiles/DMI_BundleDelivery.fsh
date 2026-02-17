Profile: DMI_BundleDelivery
Parent: Bundle
Id: DMI_BundleDelivery
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleDelivery"
* ^status = #draft
* type = #transaction (exactly)
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains SupplyDelivery 0..*
* entry[SupplyDelivery].resource 1..
* entry[SupplyDelivery].resource only $DMI_SupplyDeliveryEnteteTransport or DMI_SupplyDeliveryEnteteReceptionDMI or $DMI_SupplyRequestEnteteDelivrance or $DMI_SupplyRequestEnteteLivraison or $DMI_SupplyRequestEnteteLigne