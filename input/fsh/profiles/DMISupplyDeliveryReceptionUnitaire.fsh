Profile: DMISupplyDeliveryReceptionUnitaire
Parent: SupplyDelivery
Id: dmi-supplydelivery-reception-unitaire
Title: "DMI SupplyDelivery Reception Unitaire"
Description: "Profil créé dans le cadre de ce volet pour représenter les informations de réception d’un dispositif médical."

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains DMIReferenceOrganisationInterne named ReferenceOrganisationInterne 1..1
* identifier 1..1
* status 1..
* suppliedItem.item[x] only Reference(Device)
* occurrence[x] 1..
* occurrence[x] only dateTime
* receiver 1..1