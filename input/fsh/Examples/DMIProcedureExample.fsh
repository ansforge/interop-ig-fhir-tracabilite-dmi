Instance: dmi-procedure-example
InstanceOf: DMIProcedure
Usage: #example

* identifier[idIntervention].type = DMIDiscriminator#idIntervention
* identifier[idIntervention].value = "identifier-idIntervention-example"

* performedDateTime = "2026-02-24"

* performer.actor = Reference(dmi-practitioner-example)
* performer.onBehalfOf = Reference(dmi-organization-ej-example)

* bodySite.coding.system = "http://snomed.info/sct"
* bodySite.coding.code = #344001
* bodySite.coding.display = "région d'une cheville"

* focalDevice.manipulated = Reference(dmi-device-example)

* status = #preparation

* subject = Reference(dmi-patient-example)