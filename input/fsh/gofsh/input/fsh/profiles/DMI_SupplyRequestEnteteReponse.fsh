Profile: DMI_SupplyRequestEnteteReponse
Parent: SupplyRequest
Id: DMI_SupplyRequestEnteteReponse
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteReponse"
* ^version = "1.0"
* ^status = #draft
* ^date = "2022-11-21"
* meta 1..
* meta.profile 1..1
* meta.profile = "http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyRequestEnteteReponse" (exactly)
* identifier 1..1
* item[x] only CodeableConcept
* item[x] = $TRE_R254-TypeEvenement-FHIR.json#DEM "Reponse Creation demande" (exactly)
* item[x] from $TRE_R254-TypeEvenement-FHIR.json (example)
* item[x] ^fixedCodeableConcept.coding[1] = $TRE_R254-TypeEvenement-FHIR.json#SDM "Reponse Suppression demande"
* requester only Reference(Practitioner)
* deliverTo only Reference(Organization)