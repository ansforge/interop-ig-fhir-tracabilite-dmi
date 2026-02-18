Extension: DMIMarquageCE
Id: dmi-marquage-ce
* ^context.type = #element
* ^context.expression = "Device"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    organismeNotifie 0..* and
    libelleAutorisation 0..*
* extension[organismeNotifie] ^min = 0
* extension[organismeNotifie].value[x] only Reference
* extension[libelleAutorisation] ^min = 0
* extension[libelleAutorisation].value[x] 1..
* extension[libelleAutorisation].value[x] only string