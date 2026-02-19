Profile: DMIDeviceRequest
Parent: DeviceRequest
Id: dmi-devicerequest
* basedOn 1..1
* basedOn only Reference(SupplyRequest)
* intent = #order (exactly)
* subject only Reference(Device)