Profile: DMIBundleDelivery
Parent: Bundle
Id: dmi-bundledelivery
* type = #transaction (exactly)
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains SupplyDelivery 0..*
* entry[SupplyDelivery].resource 1..
* entry[SupplyDelivery].resource only DMISupplyDeliveryTransport or DMISupplyDeliveryEnteteReception or DMISupplyDeliveryEnteteDelivrance or DMISupplyDeliveryEnteteLivraison or DMISupplyDeliveryLigne