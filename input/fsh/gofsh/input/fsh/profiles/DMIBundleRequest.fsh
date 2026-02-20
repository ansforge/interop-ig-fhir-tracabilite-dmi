Profile: DMIBundleRequest
Parent: Bundle
Id: dmi-bundle-request
* type = #transaction 
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
    SupplyRequest 0..* and
    DeviceRequest 0..*
* entry[SupplyRequest].resource 1..
* entry[SupplyRequest].resource only DMISupplyRequestEnteteReponse or DMISupplyRequestEnteteCommande or DMISupplyRequestEnteteDemande
* entry[DeviceRequest].resource 1..
* entry[DeviceRequest].resource only DMIDeviceRequest