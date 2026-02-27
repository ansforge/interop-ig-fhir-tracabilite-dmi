Instance: tde-auditevent-example
InstanceOf: TDEAuditEvent
Usage: #example

* type.system = "http://dicom.nema.org/resources/ontology/DCM"
* type.code = #110100
* type.display = "Application Activity"

* recorded = 2026-02-24T00:00:00Z

* agent.requestor = true
* agent.who = Reference(dmi-organization-interne-example)

* source.observer = Reference(dmi-practitioner-example)