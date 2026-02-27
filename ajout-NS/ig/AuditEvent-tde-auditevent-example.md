# tde-auditevent-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **tde-auditevent-example**

## Example AuditEvent: tde-auditevent-example

Profil: [TdE AuditEvent](https://interop.esante.gouv.fr/ig/fhir/tde/2.0.0-ballot/StructureDefinition-tde-auditevent.html)

**type**: [DICOM: 110100](http://hl7.org/fhir/R4/codesystem-dicom-dcim.html#dicom-dcim-110100) (Application Activity)

**recorded**: 2026-02-24 00:00:00+0000

### Agents

| | | |
| :--- | :--- | :--- |
| - | **Who** | **Requestor** |
| * | [Organization DMI Organization Interne Example Name](Organization-dmi-organization-interne-example.md) | true |

### Sources

| | |
| :--- | :--- |
| - | **Observer** |
| * | [Practitioner : identifier = http://www.acme.com/identifiers#identifier-dmi-practitioner-example; telecom = dmi-practitioner-example@example.com](Practitioner-dmi-practitioner-example.md) |



## Resource Content

```json
{
  "resourceType" : "AuditEvent",
  "id" : "tde-auditevent-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent"]
  },
  "type" : {
    "system" : "http://dicom.nema.org/resources/ontology/DCM",
    "code" : "110100",
    "display" : "Application Activity"
  },
  "recorded" : "2026-02-24T00:00:00Z",
  "agent" : [{
    "who" : {
      "reference" : "Organization/dmi-organization-interne-example"
    },
    "requestor" : true
  }],
  "source" : {
    "observer" : {
      "reference" : "Practitioner/dmi-practitioner-example"
    }
  }
}

```
