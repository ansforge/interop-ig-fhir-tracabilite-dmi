Profile: DMISupplyDeliveryEnteteLivraison
Parent: SupplyDelivery
Id: dmi-supplydelivery-entete-livraison
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains DMIReferenceOrganisationInterne named ReferenceOrganisationInterne 1..1
* identifier 1..1
* basedOn 1..1
* status 1..
* suppliedItem.item[x] 1..
* suppliedItem.item[x] only Reference(Device)
* occurrence[x] only dateTime
* receiver 1..1