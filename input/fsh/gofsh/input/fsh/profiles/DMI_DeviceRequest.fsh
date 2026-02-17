Profile: DMI_DeviceRequest
Parent: DeviceRequest
Id: DMI_DeviceRequest
* meta 1..
* meta.profile 1..1
* meta.profile = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceRequest" (exactly)
* basedOn 1..1
* basedOn only Reference(SupplyRequest)
* intent = #order (exactly)
* subject only Reference(Device)