Extension: DMIReferenceOrganisationInterne
Id: dmi-reference-organisation-interne
Title: "DMI Reference Organisation Interne"
Description: "Extension créée dans ce volet pour référencer l'organisation fabricant du DMI."

* ^context.type = #element
* ^context.expression = "SupplyDelivery"
* value[x] 1..
* value[x] only Reference(DMIOrganizationInterne)