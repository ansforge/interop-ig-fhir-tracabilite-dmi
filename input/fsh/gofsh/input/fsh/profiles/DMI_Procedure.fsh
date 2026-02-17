Profile: DMI_Procedure
Parent: Procedure
Id: DMI_Procedure
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Procedure"
* ^status = #draft
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.text"
* identifier ^slicing.rules = #open
* identifier contains
    idIntervention 1..1 and
    numSejour 0..1
* identifier[idIntervention].type.text 1..
* identifier[idIntervention].type.text = "idIntervention" (exactly)
* identifier[idIntervention].value 1..
* identifier[numSejour].type.text 1..
* identifier[numSejour].type.text = "numSejour" (exactly)
* identifier[numSejour].value 1..
* performed[x] 1..
* performed[x] only dateTime
* performer 1..1
* performer.onBehalfOf 1..
* bodySite 1..1
* focalDevice 1..1