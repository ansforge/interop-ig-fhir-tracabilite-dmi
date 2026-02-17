Extension: DMI_ReferenceOrganisationInterne
Id: DMI_ReferenceOrganisationInterne
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_ReferenceOrganisationInterne"
* ^version = "1.0"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "SupplyDelivery"
* value[x] 1..
* value[x] only Reference(DMI_OrganizationInterne)