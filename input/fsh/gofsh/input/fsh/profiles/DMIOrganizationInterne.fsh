Profile: DMIOrganizationInterne
Parent: Organization
Id: dmi-organization-interne
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    DMIIdentifiantLocalDistributeur named IdentifiantLocalDistributeur 0..* and
    DMIIdentifiantLocalFabricant named IdentifiantLocalFabricant 0..* and
    DMIOrganizationLocation named OrganizationLocation 0..*
* extension[IdentifiantLocalDistributeur] ^min = 0
* extension[IdentifiantLocalDistributeur] ^isModifier = false
* extension[IdentifiantLocalFabricant] ^min = 0
* extension[IdentifiantLocalFabricant] ^isModifier = false
* extension[OrganizationLocation] ^min = 0
* extension[OrganizationLocation] ^isModifier = false
* identifier 1..1
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "id"
* type ^slicing.rules = #open
* type contains
    TypeOrganizationInterne 1..1 and
    CategorieOrganisation 0..1
* type[TypeOrganizationInterne] from $TRE_R207-TypeOrganisationInterne (required)
* type[TypeOrganizationInterne].id = "TypeOrganizationInterne" (exactly)
* type[CategorieOrganisation] from $_1 (required)