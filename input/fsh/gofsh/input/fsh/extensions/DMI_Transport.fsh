Extension: DMI_Transport
Id: DMI_Transport
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Transport"
* ^version = "1.0"
* ^status = #draft
* ^date = "2022-05-23"
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