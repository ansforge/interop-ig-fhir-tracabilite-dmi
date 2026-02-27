Profile: DMISupplyDeliveryEnteteDelivrance
Parent: SupplyDelivery
Id: dmi-supplydelivery-entete-delivrance
Title: "DMI SupplyDelivery Entete Delivrance"
Description: "Profil créé dans le cadre de ce volet pour représenter l’entête des informations de la délivrance de dispositifs médicaux."

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains DMIReferenceOrganisationInterne named ReferenceOrganisationInterne 1..1
* identifier 1..1
* suppliedItem.item[x] only Reference(Device)
* occurrence[x] only dateTime