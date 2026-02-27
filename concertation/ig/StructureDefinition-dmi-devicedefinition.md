# DMI DeviceDefinition - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DMI DeviceDefinition**

## Resource Profile: DMI DeviceDefinition 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicedefinition | *Version*:3.0.0-ballot |
| Draft as of 2026-02-27 | *Computable Name*:DMIDeviceDefinition |

 
Profil créé dans le cadre de ce volet pour représenter un modèle de dispositif médical. 

**Utilisations:**

* Utilise ce/t/te Profil: [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md)
* Référence ce Profil: [DMI Device](StructureDefinition-dmi-device.md)
* Exemples pour ce/t/te Profil: [DeviceDefinition/dmi-devicedefinition-example](DeviceDefinition-dmi-devicedefinition-example.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.tdmi|current/StructureDefinition/dmi-devicedefinition)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-dmi-devicedefinition.csv), [Excel](StructureDefinition-dmi-devicedefinition.xlsx), [Schematron](StructureDefinition-dmi-devicedefinition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "dmi-devicedefinition",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicedefinition",
  "version" : "3.0.0-ballot",
  "name" : "DMIDeviceDefinition",
  "title" : "DMI DeviceDefinition",
  "status" : "draft",
  "date" : "2026-02-27T11:53:01+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Profil créé dans le cadre de ce volet pour représenter un modèle de dispositif médical.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DeviceDefinition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DeviceDefinition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DeviceDefinition.extension",
      "path" : "DeviceDefinition.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "DeviceDefinition.extension:ClasseRisque",
      "path" : "DeviceDefinition.extension",
      "sliceName" : "ClasseRisque",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-classe-risque"]
      }]
    },
    {
      "id" : "DeviceDefinition.extension:ReferenceDistributeur",
      "path" : "DeviceDefinition.extension",
      "sliceName" : "ReferenceDistributeur",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-distributeur"]
      }]
    },
    {
      "id" : "DeviceDefinition.extension:CodeEMDN",
      "path" : "DeviceDefinition.extension",
      "sliceName" : "CodeEMDN",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-code-emdn"]
      }]
    },
    {
      "id" : "DeviceDefinition.physicalCharacteristics.extension:InternalDiameter",
      "path" : "DeviceDefinition.physicalCharacteristics.extension",
      "sliceName" : "InternalDiameter",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-internal-diameter"]
      }]
    },
    {
      "id" : "DeviceDefinition.property",
      "path" : "DeviceDefinition.property",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "DeviceDefinition.property:UsageUnique",
      "path" : "DeviceDefinition.property",
      "sliceName" : "UsageUnique",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "DeviceDefinition.property:UsageUnique.type",
      "path" : "DeviceDefinition.property.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "UsageUnique"
        }]
      }
    },
    {
      "id" : "DeviceDefinition.property:NbReutilisation",
      "path" : "DeviceDefinition.property",
      "sliceName" : "NbReutilisation",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "DeviceDefinition.property:NbReutilisation.type",
      "path" : "DeviceDefinition.property.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "NbReutilisation"
        }]
      }
    },
    {
      "id" : "DeviceDefinition.property:EmballageSterile",
      "path" : "DeviceDefinition.property",
      "sliceName" : "EmballageSterile",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "DeviceDefinition.property:EmballageSterile.type",
      "path" : "DeviceDefinition.property.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "EmballageSterile"
        }]
      }
    },
    {
      "id" : "DeviceDefinition.property:SterilisationAvantUtilisation",
      "path" : "DeviceDefinition.property",
      "sliceName" : "SterilisationAvantUtilisation",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "DeviceDefinition.property:SterilisationAvantUtilisation.type",
      "path" : "DeviceDefinition.property.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "SterilisationAvantUtilisation"
        }]
      }
    },
    {
      "id" : "DeviceDefinition.property:Implantable",
      "path" : "DeviceDefinition.property",
      "sliceName" : "Implantable",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "DeviceDefinition.property:Implantable.type",
      "path" : "DeviceDefinition.property.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "Implantable"
        }]
      }
    },
    {
      "id" : "DeviceDefinition.property:Actif",
      "path" : "DeviceDefinition.property",
      "sliceName" : "Actif",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "DeviceDefinition.property:Actif.type",
      "path" : "DeviceDefinition.property.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://interop.esante.gouv.fr/ig/fhir/tdmi/CodeSystem/dmi-discriminator",
          "code" : "Actif"
        }]
      }
    }]
  }
}

```
