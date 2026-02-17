Profile: FrPatient
Parent: Patient
Id: fr-patient
Title: "Patient français"
Description: "Description du patient français"
* ^status = #draft
* extension contains EyeColor named eyecolor 0..1 MS
* extension[eyecolor] ^short = "Eye color of the patient"
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Slice based on the identifier.system pattern"
* identifier contains INS 1..1 MS
* identifier[INS].system 1..
* identifier[INS].system = "urn:oid:1.2.250.1.213.1.4.8"
* gender from ModifiedAdministrativeGender (required)
* gender ^short = "male | female | other"