Profile: DMIBundleRequest
Parent: Bundle
Id: dmi-bundle-request
Title: "DMI Bundle Request"
Description: "Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant une commande, une demande et la réponse à la demande d’un DMI." 


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