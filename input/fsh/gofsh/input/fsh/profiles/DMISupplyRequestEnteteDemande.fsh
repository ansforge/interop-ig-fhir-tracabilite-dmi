Profile: DMISupplyRequestEnteteDemande
Parent: SupplyRequest
Id: dmi-supplyrequest-entete-demande
* identifier 1..1
* item[x] only CodeableConcept
* item[x] = $TRE_R254-TypeEvenement-FHIR.json#DEM "Creation demande" 
* item[x] from $TRE_R254-TypeEvenement-FHIR.json (example)
* item[x] ^fixedCodeableConcept.coding[1] = $TRE_R254-TypeEvenement-FHIR.json#SDM "Suppression demande"
* requester 1..
* requester only Reference(Practitioner)
* deliverTo 1..
* deliverTo only Reference(Organization)