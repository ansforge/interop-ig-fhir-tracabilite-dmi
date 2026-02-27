Profile: DMISupplyRequestEnteteReponse
Parent: SupplyRequest
Id: dmi-supplyrequest-entetereponse
Title: "DMI SupplyRequest Entete Reponse"
Description: "Profil créé dans le cadre de ce volet pour transporter les informations générales de la réponse à une demande de création ou de mise à jour de DMI."

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
* requester only Reference(Practitioner)
* deliverTo only Reference(Organization)