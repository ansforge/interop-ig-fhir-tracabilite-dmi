Profile: DMI_BundleDelivery
Parent: Bundle
Id: dmi-bundledelivery
* type = #transaction (exactly)
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains SupplyDelivery 0..*
* entry[SupplyDelivery].resource 1..
* entry[SupplyDelivery].resource only DMI_SupplyDeliveryTransport or DMI_SupplyDeliveryEnteteReceptionDMI or DMI_SupplyDeliveryEnteteDelivrance or DMI_SupplyDeliveryEnteteLivraison or DMI_SupplyDeliveryLigne