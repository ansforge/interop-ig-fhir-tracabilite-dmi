Profile: DMI_Organization_EG
Parent: $FrOrganization
Id: DMI_Organization_EG
* ^status = #draft
* meta 1..
* identifier 1..
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.text"
* identifier ^slicing.rules = #open
* identifier contains
    IdNatStruct 1..1 and
    numSiren 1..1 and
    numFINESS 0..1 and
    numeroTVAIntracommunautaire 0..1
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