Instance: DMI-Patient-INS
InstanceOf: SearchParameter
Usage: #definition
Title: "SearchParameter DMI Patient INS"
Description: "Permet la recherche sur le code EMDN"
* name = "DMI_Patient_INS"
* status = #draft
* code = #INS
* base = #Patient
* type = #token
* expression = "Patient.identifier.where(use='official').value"