Profile: DMIOrganizationEJ
Parent: fr-core-organization
Id: dmi-organization-ej
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains 
    DMIIdentifiantLocalDistributeur named IdentifiantLocalDistributeur 0..* and
    DMIIdentifiantLocalFabricant named IdentifiantLocalFabricant 0..*
* extension[IdentifiantLocalDistributeur] only DMIIdentifiantLocalDistributeur
* extension[IdentifiantLocalFabricant] only DMIIdentifiantLocalFabricant
* identifier 1..
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.text"
* identifier ^slicing.rules = #open
* identifier contains
    IdNatStruct 1..1 and
    numSiren 1..1 and
    numFINESS 0..1 and
    numeroTVAIntracommunautaire 0..1 and
    numeroSRN 0..*
* identifier[numeroTVAIntracommunautaire].type.text 1..
* identifier[numeroTVAIntracommunautaire].type = DMIOrganizationIdentifier#numeroTVAIntracommunautaire
* identifier[numeroSRN].type 1..
* identifier[numeroSRN].type = DMIOrganizationIdentifier#numeroSRN
* name 1..
* alias ..1
* address ..1