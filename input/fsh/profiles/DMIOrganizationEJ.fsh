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
* identifier 2..
* identifier contains
    numeroTVAIntracommunautaire 0..1 and
    numeroSRN 0..*
* identifier[idNatSt] 1..1
* identifier[siren] 1..1
* identifier[finess] 0..1
* identifier[numeroTVAIntracommunautaire].type 1..
* identifier[numeroTVAIntracommunautaire].type = DMIDiscriminator#numeroTVAIntracommunautaire
* identifier[numeroSRN].type 1..
* identifier[numeroSRN].type = DMIDiscriminator#numeroSRN
* name 1..
* alias ..1
* address ..1