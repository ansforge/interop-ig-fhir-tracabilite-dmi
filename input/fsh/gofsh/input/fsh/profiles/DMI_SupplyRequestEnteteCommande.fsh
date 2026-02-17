Profile: DMI_SupplyRequestEnteteCommande
Parent: SupplyRequest
Id: dmi-supplyrequest-entete-commande
* meta 1..
* identifier 1..1
* item[x] only CodeableConcept
* item[x] = $TRE_R254-TypeEvenement-FHIR.json#CDM (exactly)
* item[x] from $TRE_R254-TypeEvenement-FHIR.json (example)
* requester only Reference(Practitioner)
* deliverTo only Reference(Organization)