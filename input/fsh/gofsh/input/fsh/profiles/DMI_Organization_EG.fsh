Profile: DMI_Organization_EG
Parent: FrOrganization
Id: DMI_Organization_EG
* identifier 2..
* identifier contains
    IdNatStruct 1..1 and
    numeroTVAIntracommunautaire 0..1 and
    numeroSRN 0..1 and
* identifier[numeroTVAIntracommunautaire].type = DMIOrganizationIdentifierType#numeroTVAIntracommunautaire
* identifier[numeroSRN].type = DMIOrganizationIdentifierType#numeroSRN
* name 1..
* alias ..1
* address ..1