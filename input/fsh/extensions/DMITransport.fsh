Extension: DMITransport
Id: dmi-transport
Title: "DMI Transport"
Description: "Extension créée dans ce volet pour représenter le transport."

* ^context.type = #element
* ^context.expression = "SupplyDelivery"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    refTransport 1..1 and
    refDelivery 1..1 and
    incident 0..1 and
    detailIncident 0..1 and
    text 0..1 and
    meta 1..1
* extension[refTransport].value[x] only Identifier
* extension[refDelivery].value[x] only Identifier
* extension[incident].value[x] only code
* extension[detailIncident].value[x] only string
* extension[text].value[x] only string
* extension[meta].value[x] only Meta