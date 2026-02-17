Profile: DMI_OrganizationEJ
Parent: fr-core-organization
Id: dmi-organization-ej
* meta 1..
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains 
    DMI_IdentifiantLocalDistributeur named IdentifiantLocalDistributeur 0..* and
    DMI_IdentifiantLocalFabricant named IdentifiantLocalFabricant 0..*
* extension[IdentifiantLocalDistributeur] only DMI_IdentifiantLocalDistributeur
* extension[IdentifiantLocalDistributeur] ^sliceName = "IdentifiantLocalDistributeur"
* extension[IdentifiantLocalDistributeur] ^min = 0
* extension[IdentifiantLocalDistributeur] ^isModifier = false
* extension[IdentifiantLocalFabricant] only DMI_IdentifiantLocalFabricant
* extension[IdentifiantLocalFabricant] ^sliceName = "IdentifiantLocalFabricant"
* extension[IdentifiantLocalFabricant] ^min = 0
* extension[IdentifiantLocalFabricant] ^isModifier = false
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
* identifier[IdNatStruct].type.text 1..
* identifier[IdNatStruct].type.text = "IdNatStruct" (exactly)
* identifier[numSiren].type.text 1..
* identifier[numSiren].type.text = "numSiren" (exactly)
* identifier[numFINESS].type.text 1..
* identifier[numFINESS].type.text = "numFINESS" (exactly)
* identifier[numeroTVAIntracommunautaire].type.text 1..
* identifier[numeroTVAIntracommunautaire].type.text = "numeroTVAIntracommunautaire" (exactly)
* identifier[numeroSRN] ^sliceName = "numeroSRN"
* identifier[numeroSRN].type.text 1..
* identifier[numeroSRN].type.text = "numeroSRN" (exactly)
* name 1..
* alias ..1
* address ..1