Profile: DMIOrganizationInterne
Parent: FrOrganization
Id: dmi-organization-interne
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    DMIIdentifiantLocalDistributeur named IdentifiantLocalDistributeur 0..* and
    DMIIdentifiantLocalFabricant named IdentifiantLocalFabricant 0..* and
    DMIOrganizationLocation named OrganizationLocation 0..*
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "id"
* type ^slicing.rules = #open
* type contains
    TypeOrganizationInterne 1..1 and
    CategorieOrganisation 0..1
* type[TypeOrganizationInterne].coding.system = $TRE_R207-TypeOrganisationInterne
* type[CategorieOrganisation].coding.system = $_1 