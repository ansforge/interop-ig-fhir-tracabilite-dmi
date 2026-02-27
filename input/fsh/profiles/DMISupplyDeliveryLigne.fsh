Profile: DMISupplyDeliveryLigne
Parent: SupplyDelivery
Id: dmi-supplydelivery-ligne
Title: "DMI SupplyDelivery Ligne"
Description: "Profil créé dans le cadre de ce volet pour représenter une ligne de livraison, de délivrance."

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains DMIReferenceOrganisationInterne named ReferenceOrganisationInterne 1..1
* identifier 1..1
* basedOn 1..1
* partOf 1..1
* partOf only Reference(SupplyDelivery)
* suppliedItem 1..
* suppliedItem.item[x] 1..
* suppliedItem.item[x] only Reference(Device)
* occurrence[x] only dateTime