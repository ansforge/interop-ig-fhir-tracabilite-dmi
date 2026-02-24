# dmi-devicerequest-example - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **dmi-devicerequest-example**

## Example DeviceRequest: dmi-devicerequest-example

Profil: [DMIDeviceRequest](StructureDefinition-dmi-devicerequest.md)

**basedOn**: [SupplyRequest : identifier = identifier-dmi-supplyrequest-entete-commande-example; item[x] = Commande de dispositifs médicaux; quantity = 2](SupplyRequest-dmi-supplyrequest-entete-commande-example.md)

**intent**: Order

**code**: [Device : extension = IPIdLogiciel example,](Device-dmi-device-example.md)

**subject**: [Device : extension = IPIdLogiciel example,](Device-dmi-device-example.md)



## Resource Content

```json
{
  "resourceType" : "DeviceRequest",
  "id" : "dmi-devicerequest-example",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-devicerequest"]
  },
  "basedOn" : [{
    "reference" : "SupplyRequest/dmi-supplyrequest-entete-commande-example"
  }],
  "intent" : "order",
  "codeReference" : {
    "reference" : "Device/dmi-device-example"
  },
  "subject" : {
    "reference" : "Device/dmi-device-example"
  }
}

```
