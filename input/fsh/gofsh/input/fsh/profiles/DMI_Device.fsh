Profile: DMI_Device
Parent: Device
Id: DMI_Device
* meta 1..
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    DMI_IPIdLogiciel named IPIdLogiciel 0..1 and
    DMI_MarquageCE named MarquageCE 0..1
* extension[IPIdLogiciel] ^isModifier = false
* extension[MarquageCE] ^isModifier = false
* definition only Reference(DMI_DeviceDefinition)