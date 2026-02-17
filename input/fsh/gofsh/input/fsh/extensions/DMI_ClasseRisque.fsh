Extension: DMI_ClasseRisque
Id: dmi-classe-risque
Context: DeviceDefinition
* value[x] only CodeableConcept
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this"
* value[x] ^slicing.rules = #open
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^sliceName = "valueCodeableConcept"
* valueRelatedArtifact only RelatedArtifact
* valueRelatedArtifact ^sliceName = "valueRelatedArtifact"