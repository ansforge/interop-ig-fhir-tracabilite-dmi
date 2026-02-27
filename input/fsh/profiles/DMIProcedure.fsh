Profile: DMIProcedure
Parent: Procedure
Id: dmi-procedure
Title: "DMI Procedure"
Description: "Profil créé dans le cadre de ce volet pour représenter l’intervention clinique ou chirurgicale implantant un dispositif médical."

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains
    idIntervention 1..1 and
    numSejour 0..1
* identifier[idIntervention].type 1..
* identifier[idIntervention].type = DMIDiscriminator#idIntervention
* identifier[idIntervention].value 1..
* identifier[numSejour].type 1..
* identifier[numSejour].type = DMIDiscriminator#numSejour 
* identifier[numSejour].value 1..
* performed[x] 1..
* performed[x] only dateTime
* performer 1..1
* performer.onBehalfOf 1..
* bodySite 1..1
* focalDevice 1..1