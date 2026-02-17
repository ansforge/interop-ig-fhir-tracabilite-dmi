Profile: DMI_SupplyRequestEnteteDemande
Parent: SupplyRequest
Id: DMI_SupplyRequestEnteteDemande
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDemande"
* ^version = "1.0"
* ^status = #draft
* ^date = "2022-11-21"
* meta 1..
* meta.profile 1..1
* meta.profile = "http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDemande" (exactly)
* identifier 1..1
* item[x] only CodeableConcept
* item[x] = $TRE_R254-TypeEvenement-FHIR.json#DEM "Creation demande" (exactly)
* item[x] from $TRE_R254-TypeEvenement-FHIR.json (example)
* item[x] ^fixedCodeableConcept.coding[1] = $TRE_R254-TypeEvenement-FHIR.json#SDM "Suppression demande"
* requester 1..
* requester only Reference(Practitioner)
* deliverTo 1..
* deliverTo only Reference(Organization)