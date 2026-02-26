Instance: dmi-supplyrequest-entete-demande-example
InstanceOf: DMISupplyRequestEnteteDemande
Usage: #example

* identifier.value = "identifier-dmi-supplyrequest-entete-demande-example"

* itemCodeableConcept.coding[CreationDemande].system = "https://mos.esante.gouv.fr/NOS/TRE_R254-TypeEvenement/FHIR/TRE-R254-TypeEvenement/TRE_R254-TypeEvenement-FHIR"
* itemCodeableConcept.coding[CreationDemande].code = #DEM
* itemCodeableConcept.coding[CreationDemande].display = "Demande de dispositifs médicaux à la pharmacie de l'établissement de santé"

* quantity.value = 2

* deliverTo = Reference(dmi-organization-interne-example)

* requester = Reference(dmi-practitioner-example)

