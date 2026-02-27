Profile: DMIDeviceRequest
Parent: DeviceRequest
Id: dmi-devicerequest
Title: "DMI DeviceRequest"
Description: "Profil créé dans le cadre de ce volet permettant d’effectuer une commande, demande, et la réponse à une demande de dispositif médical."

* basedOn 1..1
* basedOn only Reference(SupplyRequest)
* intent = #order 
* subject only Reference(Device)