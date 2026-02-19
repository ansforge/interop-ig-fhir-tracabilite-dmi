Profile: DMIDevice
Parent: Device
Id: dmi-device
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    DMIIPIdLogiciel named IPIdLogiciel 0..1 and
    DMIMarquageCE named MarquageCE 0..1
* extension[IPIdLogiciel] ^isModifier = false
* extension[MarquageCE] ^isModifier = false
* definition only Reference(DMIDeviceDefinition)