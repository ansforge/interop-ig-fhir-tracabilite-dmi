Profile: DMI_DeviceRequest
Parent: DeviceRequest
Id: dmi-devicerequest
* meta 1..
* basedOn 1..1
* basedOn only Reference(SupplyRequest)
* intent = #order (exactly)
* subject only Reference(Device)