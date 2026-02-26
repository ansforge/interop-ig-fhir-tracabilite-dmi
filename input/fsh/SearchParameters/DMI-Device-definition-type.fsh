Instance: dmi-device-definition-type
InstanceOf: SearchParameter
Usage: #definition
Title: "SearchParameter DMI Device definitionType"
Description: "Permet la recherche sur le Code EMDN"
* name = "DMI_Device_definitionType"
* status = #draft
* code = #definitionType
* base = #Device
* type = #token
* expression = "Device.extension('https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-code-emdn').value"