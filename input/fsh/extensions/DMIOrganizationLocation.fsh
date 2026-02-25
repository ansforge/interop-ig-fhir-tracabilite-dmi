Extension: DMIOrganizationLocation
Id: dmi-organization-location
Title: "DMI Organization Location"
Description: "Extension créée dans ce volet pour représenter le lieu de l'organisation."

* ^context.type = #element
* ^context.expression = "Organization"
* value[x] only Reference(Location)