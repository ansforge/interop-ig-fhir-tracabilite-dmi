# DMI Device - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

## Resource Profile: DMI Device 

 
Profil créé dans le cadre de ce volet pour représenter une instance physique d’un dispositif médical. 

**Usages:**

* Use this Profile: [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Examples for this Profile: [Device/dmi-device-example](Device-dmi-device-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.tdmi|current/StructureDefinition/StructureDefinition-dmi-device.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-dmi-device.csv), [Excel](../StructureDefinition-dmi-device.xlsx), [Schematron](../StructureDefinition-dmi-device.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-device",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-device",
  "version" : "3.0.0-ballot",
  "name" : "DMIDevice",
  "title" : "DMI Device",
  "status" : "draft",
  "date" : "2026-06-26T10:33:00+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Profil créé dans le cadre de ce volet pour représenter une instance physique d’un dispositif médical.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "udi",
    "uri" : "http://fda.gov/UDI",
    "name" : "UDI Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Device",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Device",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Device.extension",
      "path" : "Device.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Device.extension:IPIdLogiciel",
      "path" : "Device.extension",
      "sliceName" : "IPIdLogiciel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-ip-id-logiciel"]
      }]
    },
    {
      "id" : "Device.extension:MarquageCE",
      "path" : "Device.extension",
      "sliceName" : "MarquageCE",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-marquage-ce"]
      }]
    },
    {
      "id" : "Device.extension:CodeEMDN",
      "path" : "Device.extension",
      "sliceName" : "CodeEMDN",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-code-emdn"]
      }]
    },
    {
      "id" : "Device.definition",
      "path" : "Device.definition",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicedefinition"]
      }]
    }]
  }
}

```
