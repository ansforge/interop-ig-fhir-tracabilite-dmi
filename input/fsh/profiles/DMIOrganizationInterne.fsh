Profile: DMIOrganizationInterne
Parent: fr-core-organization
Id: dmi-organization-interne
Title: "DMI Organization Interne"
Description: "Profil créé dans le cadre de ce volet permettant de représenter l’organisation interne (Service utilisateur)."


* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    DMIIdentifiantLocalDistributeur named IdentifiantLocalDistributeur 0..* and
    DMIIdentifiantLocalFabricant named IdentifiantLocalFabricant 0..* and
    DMIOrganizationLocation named OrganizationLocation 0..*
* type contains
    TypeOrganizationInterne 1..1 and
    CategorieOrganisation 0..1
* type[TypeOrganizationInterne].coding.system = $TRE_R207-TypeOrganisationInterne
* type[CategorieOrganisation].coding.system = $TRE_R244-CategorieOrganisation 