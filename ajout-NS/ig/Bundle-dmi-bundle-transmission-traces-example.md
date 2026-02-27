# dmi-bundle-transmission-traces-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-bundle-transmission-traces-example**

## Example Bundle: dmi-bundle-transmission-traces-example



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "dmi-bundle-transmission-traces-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-bundle-transmission-traces"]
  },
  "type" : "transaction",
  "entry" : [{
    "fullUrl" : "https://test-server.fr/DeviceDefinition/dmi-devicedefinition-example",
    "resource" : {
      "resourceType" : "DeviceDefinition",
      "id" : "dmi-devicedefinition-example",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicedefinition"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"DeviceDefinition_dmi-devicedefinition-example\"> </a><p class=\"res-header-id\"><b>Narratif généré : DéfinitionDeDispositif dmi-devicedefinition-example</b></p><a name=\"dmi-devicedefinition-example\"> </a><a name=\"hcdmi-devicedefinition-example\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"StructureDefinition-dmi-devicedefinition.html\">DMI DeviceDefinition</a></p></div><p><b>DMI Classe Risque</b>: ClasseRisqueExample</p><h3>Properties</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>ValueQuantity</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes :{https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator NbReutilisation}\">Nombre de réutilisation</span></td><td>5</td></tr></table></div>"
      },
      "extension" : [{
        "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-classe-risque",
        "valueCode" : "ClasseRisqueExample"
      }],
      "property" : [{
        "type" : {
          "coding" : [{
            "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
            "code" : "NbReutilisation"
          }]
        },
        "valueQuantity" : [{
          "value" : 5
        }]
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "DMIDeviceDefinition"
    }
  },
  {
    "fullUrl" : "https://test-server.fr/Device/dmi-device-example",
    "resource" : {
      "resourceType" : "Device",
      "id" : "dmi-device-example",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-device"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Device_dmi-device-example\"> </a><p class=\"res-header-id\"><b>Narratif généré : Dispositif dmi-device-example</b></p><a name=\"dmi-device-example\"> </a><a name=\"hcdmi-device-example\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"StructureDefinition-dmi-device.html\">DMI Device</a></p></div><p><b>DMI IP Id logiciel</b>: IPIdLogiciel example</p><blockquote><p><b>DMI Marquage CE</b></p><ul><li>organismeNotifie: <a href=\"Organization-dmi-organization-interne-example.html\">Organization DMI Organization Interne Example Name</a></li><li>libelleAutorisation: MarquageCE libelleAutorisation example</li></ul></blockquote></div>"
      },
      "extension" : [{
        "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-ip-id-logiciel",
        "valueString" : "IPIdLogiciel example"
      },
      {
        "extension" : [{
          "url" : "organismeNotifie",
          "valueReference" : {
            "reference" : "Organization/dmi-organization-interne-example"
          }
        },
        {
          "url" : "libelleAutorisation",
          "valueString" : "MarquageCE libelleAutorisation example"
        }],
        "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-marquage-ce"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "DMIDeviceExample"
    }
  },
  {
    "fullUrl" : "https://test-server.fr/Patient/dmi-patient-example",
    "resource" : {
      "resourceType" : "Patient",
      "id" : "dmi-patient-example",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-patient"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Patient_dmi-patient-example\"> </a><p class=\"res-header-id\"><b>Narratif généré : Patient dmi-patient-example</b></p><a name=\"dmi-patient-example\"> </a><a name=\"hcdmi-patient-example\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"StructureDefinition-dmi-patient.html\">DMI Patient</a></p></div><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( identifier-dmi-patient-example)</p><hr/><table class=\"grid\"><tr><td style=\"background-color: #f3f5da\" title=\"Moyens de contacter le Patient\">Coordonnées</td><td colspan=\"3\"><a href=\"mailto:dmi-patient-example@example.com\">dmi-patient-example@example.com</a></td></tr></table></div>"
      },
      "identifier" : [{
        "value" : "identifier-dmi-patient-example"
      }],
      "telecom" : [{
        "system" : "email",
        "value" : "dmi-patient-example@example.com"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "DMIPatient"
    }
  },
  {
    "fullUrl" : "https://test-server.fr/AuditEvent/tde-auditevent-example",
    "resource" : {
      "resourceType" : "AuditEvent",
      "id" : "tde-auditevent-example",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tde/StructureDefinition/tde-auditevent"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"AuditEvent_tde-auditevent-example\"> </a><p class=\"res-header-id\"><b>Narratif généré : ÉvènementSécurité tde-auditevent-example</b></p><a name=\"tde-auditevent-example\"> </a><a name=\"hctde-auditevent-example\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"https://interop.esante.gouv.fr/ig/fhir/tde/2.0.0-ballot/StructureDefinition-tde-auditevent.html\">TdE AuditEvent</a></p></div><p><b>type</b>: <a href=\"http://hl7.org/fhir/R4/codesystem-dicom-dcim.html#dicom-dcim-110100\">DICOM: 110100</a> (Application Activity)</p><p><b>recorded</b>: 2026-02-24 00:00:00+0000</p><h3>Agents</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Who</b></td><td><b>Requestor</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Organization-dmi-organization-interne-example.html\">Organization DMI Organization Interne Example Name</a></td><td>true</td></tr></table><h3>Sources</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Observer</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Practitioner-dmi-practitioner-example.html\">Practitioner : identifier = http://www.acme.com/identifiers#identifier-dmi-practitioner-example; telecom = dmi-practitioner-example@example.com</a></td></tr></table></div>"
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
    },
    "request" : {
      "method" : "POST",
      "url" : "AuditEvent"
    }
  }]
}

```
