Profile: DMIDevice
Parent: Device
Id: dmi-device
Title: "DMI Device"
Description: "Profil créé dans le cadre de ce volet pour représenter une instance physique d’un dispositif médical." 


* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    DMIIPIdLogiciel named IPIdLogiciel 0..1 and
    DMIMarquageCE named MarquageCE 0..1
    DMICodeEMDN named CodeEMDN 0..1 and
* definition only Reference(DMIDeviceDefinition)