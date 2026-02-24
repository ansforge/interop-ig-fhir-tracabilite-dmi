Profile: DMISupplyRequestEnteteCommande
Parent: SupplyRequest
Id: dmi-supplyrequest-entete-commande
* identifier 1..1
* item[x] only CodeableConcept
* itemCodeableConcept = $TRE_R254-TypeEvenement-FHIR#CDM
* requester only Reference(Practitioner)
* deliverTo only Reference(Organization)