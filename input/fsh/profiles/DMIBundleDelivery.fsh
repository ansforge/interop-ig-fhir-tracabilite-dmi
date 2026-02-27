Profile: DMIBundleDelivery
Parent: Bundle
Id: dmi-bundledelivery
Title: "DMI Bundle Delivery"
Description: "Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant la réception, la délivrance et la livraison d’un DMI." 

* type = #transaction 
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains SupplyDelivery 0..*
* entry[SupplyDelivery].resource 1..
* entry[SupplyDelivery].resource only DMISupplyDeliveryTransport or DMISupplyDeliveryEnteteReception or DMISupplyDeliveryEnteteDelivrance or DMISupplyDeliveryEnteteLivraison or DMISupplyDeliveryLigne