Profile: DMISupplyRequestEnteteReponse
Parent: SupplyRequest
Id: dmi-supplyrequest-entetereponse
* meta 1..
* identifier 1..1
* item[x] only CodeableConcept
* item[x] = $TRE_R254-TypeEvenement-FHIR.json#DEM "Reponse Creation demande" (exactly)
* item[x] from $TRE_R254-TypeEvenement-FHIR.json (example)
* item[x] ^fixedCodeableConcept.coding[1] = $TRE_R254-TypeEvenement-FHIR.json#SDM "Reponse Suppression demande"
* requester only Reference(Practitioner)
* deliverTo only Reference(Organization)