Instance: dmi-bundle-transmission-traces-example
InstanceOf: DMIBundleTransmissionTraces
Usage: #example

* entry[0].resource = dmi-devicedefinition-example
* entry[0].fullUrl = "https://test-server.fr/DeviceDefinition/dmi-devicedefinition-example"
* entry[0].request.method = #POST
* entry[0].request.url = "DMIDeviceDefinition"
* entry[1].resource = dmi-device-example
* entry[1].fullUrl = "https://test-server.fr/Device/dmi-device-example"
* entry[1].request.method = #POST
* entry[1].request.url = "DMIDeviceExample"
* entry[2].resource = dmi-patient-example
* entry[2].fullUrl = "https://test-server.fr/Patient/dmi-patient-example"
* entry[2].request.method = #POST
* entry[2].request.url = "DMIPatient"
* entry[3].resource = tde-auditevent-example
* entry[3].fullUrl = "https://test-server.fr/AuditEvent/tde-auditevent-example"
* entry[3].request.method = #POST
* entry[3].request.url = "AuditEvent"
