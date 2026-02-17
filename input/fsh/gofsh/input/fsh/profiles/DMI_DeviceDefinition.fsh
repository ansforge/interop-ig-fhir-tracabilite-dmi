Profile: DMI_DeviceDefinition
Parent: DeviceDefinition
Id: DMI_DeviceDefinition
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    DMI_ClasseRisque named ClasseRisque 0..1 and
    DMI_CodeEMDN named CodeEMDN 0..1 and
    DMI_ReferenceDistributeur named referenceDistributeur 0..1
* extension[ClasseRisque] ^isModifier = false
* extension[CodeEMDN] ^isModifier = false
* extension[referenceDistributeur] ^isModifier = false
* physicalCharacteristics.extension ^slicing.discriminator.type = #value
* physicalCharacteristics.extension ^slicing.discriminator.path = "url"
* physicalCharacteristics.extension ^slicing.rules = #open
* physicalCharacteristics.extension ^min = 0
* physicalCharacteristics.extension contains DMI_InternalDiameter named InternalDiameter 0..1
* physicalCharacteristics.extension[InternalDiameter] ^isModifier = false
* property ^slicing.discriminator.type = #value
* property ^slicing.discriminator.path = "type.text"
* property ^slicing.rules = #open
* property contains
    UsageUnique 0..1 and
    NbReutilisation 0..1 and
    EmballageSterile 0..1 and
    SterilisationAvantUtilisation 0..1 and
    Implantable 0..1 and
    Actif 0..1
* property[UsageUnique].type.text = "UsageUnique" (exactly)
* property[NbReutilisation].type.text 1..
* property[NbReutilisation].type.text = "NbReutilisation" (exactly)
* property[EmballageSterile].type.text 1..
* property[EmballageSterile].type.text = "EmballageSterile" (exactly)
* property[SterilisationAvantUtilisation].type.text 1..
* property[SterilisationAvantUtilisation].type.text = "SterilisationAvantUtilisation" (exactly)
* property[Implantable].type.text 1..
* property[Implantable].type.text = "Implantable" (exactly)
* property[Actif].type.text 1..
* property[Actif].type.text = "Actif" (exactly)