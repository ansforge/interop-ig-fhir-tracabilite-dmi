Instance: dmi-supplyrequest-entete-reponse-example
InstanceOf: DMISupplyRequestEnteteReponse
Usage: #example

* identifier.value = "identifier-dmi-supplyrequest-entete-reponse-example"

* itemCodeableConcept.coding[SuppressionDemande].system = "https://mos.esante.gouv.fr/NOS/TRE_R254-TypeEvenement/FHIR/TRE-R254-TypeEvenement/TRE_R254-TypeEvenement-FHIR"
* itemCodeableConcept.coding[SuppressionDemande].code = #SDM
* itemCodeableConcept.coding[SuppressionDemande].display = "Suppression de la demande de dispositif médicaux"

* quantity.value = 2

* deliverTo = Reference(dmi-organization-interne-example)

* requester = Reference(dmi-practitioner-example)

