Profile: DMI_SupplyRequestEnteteCommande
Parent: SupplyRequest
Id: DMI_SupplyRequestEnteteCommande
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteCommande"
* ^version = "1.0"
* ^status = #draft
* ^date = "2022-11-21"
* meta 1..
* meta.profile 1..1
* meta.profile = "http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyRequestEnteteCommande" (exactly)
* identifier 1..1
* item[x] only CodeableConcept
* item[x] = $TRE_R254-TypeEvenement-FHIR.json#CDM (exactly)
* item[x] from $TRE_R254-TypeEvenement-FHIR.json (example)
* requester only Reference(Practitioner)
* deliverTo only Reference(Organization)