Profile: DMISupplyRequestEnteteDemande
Parent: SupplyRequest
Id: dmi-supplyrequest-entete-demande
Title: "DMI SupplyRequest Entete Demande"
Description: "Profil créé dans le cadre de ce volet pour transporter les informations générales d’une demande de dispositif médical."

* identifier 1..1
* item[x] only CodeableConcept
* itemCodeableConcept.coding ^slicing.discriminator.type = #value
* itemCodeableConcept.coding ^slicing.discriminator.path = "code"

* itemCodeableConcept.coding ^slicing.rules = #open
* itemCodeableConcept.coding contains
    CreationDemande 0..1 and
    SuppressionDemande 0..1
* itemCodeableConcept.coding[CreationDemande].code 1..
* itemCodeableConcept.coding[CreationDemande].code = $TRE_R254-TypeEvenement-FHIR#DEM
* itemCodeableConcept.coding[SuppressionDemande].code 1..
* itemCodeableConcept.coding[SuppressionDemande].code = $TRE_R254-TypeEvenement-FHIR#SDM

* requester 1..
* requester only Reference(Practitioner)
* deliverTo 1..
* deliverTo only Reference(Organization)