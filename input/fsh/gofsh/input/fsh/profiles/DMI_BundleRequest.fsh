Profile: DMI_BundleRequest
Parent: Bundle
Id: dmi-bundle-request
* type = #transaction (exactly)
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
    SupplyRequest 0..* and
    DeviceRequest 0..*
* entry[SupplyRequest].resource 1..
* entry[SupplyRequest].resource only DMI_SupplyRequestEnteteReponse or DMI_SupplyRequestEnteteCommande or DMI_SupplyRequestEnteteDemande
* entry[DeviceRequest].resource 1..
* entry[DeviceRequest].resource only DMI_DeviceRequest