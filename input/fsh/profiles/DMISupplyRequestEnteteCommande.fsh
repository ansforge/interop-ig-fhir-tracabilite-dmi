Profile: DMISupplyRequestEnteteCommande
Parent: SupplyRequest
Id: dmi-supplyrequest-entete-commande
Title: "DMI SupplyRequest Entete Commande"
Description: "Profil créé dans le cadre de ce volet permet transporter les informations générales d’une commande de dispositif médical."

* identifier 1..1
* item[x] only CodeableConcept
* itemCodeableConcept = $TRE_R254-TypeEvenement-FHIR#CDM
* requester only Reference(Practitioner)
* deliverTo only Reference(Organization)