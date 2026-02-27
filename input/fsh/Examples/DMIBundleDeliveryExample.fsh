Instance: dmi-bundle-delivery-example
InstanceOf: DMIBundleDelivery
Usage: #example

* entry[0].resource = dmi-supplydelivery-transport-example
* entry[0].fullUrl = "https://test-server.fr/SupplyDelivery/dmi-supplydelivery-transport-example"
* entry[0].request.method = #POST
* entry[0].request.url = "DMISupplyDeliveryTransport"
* entry[1].resource = dmi-supplydelivery-ligne-example
* entry[1].fullUrl = "https://test-server.fr/SupplyDelivery/dmi-supplydelivery-ligne-example"
* entry[1].request.method = #POST
* entry[1].request.url = "DMISupplyDeliveryLigne"
