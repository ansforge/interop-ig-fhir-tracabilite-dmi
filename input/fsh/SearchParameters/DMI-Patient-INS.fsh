Instance: DMI-Patient-INS
InstanceOf: SearchParameter
Usage: #definition
Title: "SearchParameter DMI Patient INS"
Description: "Permet la recherche sur l'ins du patient"
* name = "DMI_Patient_INS"
* status = #draft
* code = #ins
* base = #Patient
* type = #token
* expression = "Patient.identifier.where(type.coding.code='INS-C').value"