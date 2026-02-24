Profile: DMIDeviceDefinition
Parent: DeviceDefinition
Id: dmi-devicedefinition
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    DMIClasseRisque named ClasseRisque 0..1 and
    DMICodeEMDN named CodeEMDN 0..1 and
    DMIReferenceDistributeur named ReferenceDistributeur 0..1
* physicalCharacteristics.extension ^slicing.discriminator.type = #value
* physicalCharacteristics.extension ^slicing.discriminator.path = "url"
* physicalCharacteristics.extension ^slicing.rules = #open
* physicalCharacteristics.extension contains DMIInternalDiameter named InternalDiameter 0..1
* property ^slicing.discriminator.type = #value
* property ^slicing.discriminator.path = "type"
* property ^slicing.rules = #open
* property contains
    UsageUnique 0..1 and
    NbReutilisation 0..1 and
    EmballageSterile 0..1 and
    SterilisationAvantUtilisation 0..1 and
    Implantable 0..1 and
    Actif 0..1

* property[UsageUnique].type = DMIDiscriminator#UsageUnique
* property[NbReutilisation].type 1..
* property[NbReutilisation].type = DMIDiscriminator#NbReutilisation 
* property[EmballageSterile].type 1..
* property[EmballageSterile].type = DMIDiscriminator#EmballageSterile
* property[SterilisationAvantUtilisation].type 1..
* property[SterilisationAvantUtilisation].type = DMIDiscriminator#SterilisationAvantUtilisation
* property[Implantable].type 1..
* property[Implantable].type = DMIDiscriminator#Implantable 
* property[Actif].type 1..
* property[Actif].type = DMIDiscriminator#Actif