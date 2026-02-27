Instance: dmi-supplyrequest-entete-commande-example
InstanceOf: DMISupplyRequestEnteteCommande
Usage: #example

* identifier.value = "identifier-dmi-supplyrequest-entete-commande-example"

* itemCodeableConcept.coding.system = "https://mos.esante.gouv.fr/NOS/TRE_R254-TypeEvenement/FHIR/TRE-R254-TypeEvenement/TRE_R254-TypeEvenement-FHIR"
* itemCodeableConcept.coding.code = #CDM
* itemCodeableConcept.coding.display = "Commande de dispositifs médicaux"

* quantity.value = 2

* deliverTo = Reference(dmi-organization-interne-example)

* requester = Reference(dmi-practitioner-example)