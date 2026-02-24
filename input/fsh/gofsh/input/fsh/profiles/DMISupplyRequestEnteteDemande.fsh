Profile: DMISupplyRequestEnteteDemande
Parent: SupplyRequest
Id: dmi-supplyrequest-entete-demande
* identifier 1..1
* item[x] only CodeableConcept
* item[x].CodeableConcept.coding^slicing.discriminator.type = #value
* item[x].CodeableConcept.coding^slicing.discriminator.path = "code"

* item[x].CodeableConcept.coding^slicing.rules = #open
* item[x].CodeableConcept.coding contains
    CreationDemande named CreationDemande 0..1 and
    SuppressionDemande named SuppressionDemande 0..1
* item[x].CodeableConcept.coding[CreationDemande].code 1..
* item[x].CodeableConcept.coding[CreationDemande].code = $TRE_R254-TypeEvenement-FHIR.json#DEM
* item[x].CodeableConcept.coding[SuppressionDemande].code 1..
* item[x].CodeableConcept.coding[SuppressionDemande] = $TRE_R254-TypeEvenement-FHIR.json#SDM

* requester 1..
* requester only Reference(Practitioner)
* deliverTo 1..
* deliverTo only Reference(Organization)