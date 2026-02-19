Profile: DMIBundleTransmissionTraces
Parent: Bundle
Id: dmi-bundle-transmission-traces
* type = #transaction (exactly)
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
    DispositifMedical 0..* and
    DeviceDefinition 0..* and
    Patient 0..* and
    Professionnel 0..* and
    EntiteJuridique 0..* and
    OrganisationInterne 0..* and
    Invoice 0..* and
    Procedure 0..* and
    SupplyRequest 0..* and
    SupplyDelivery 0..* and
    AuditEvent 1..1 and
    BundleRequest 0..* and
    BundleDelivery 0..*
* entry[DispositifMedical].resource 1..
* entry[DispositifMedical].resource only DMIDevice
* entry[DeviceDefinition].resource 1..
* entry[DeviceDefinition].resource only DMIDeviceDefinition
* entry[Patient].resource 1..
* entry[Patient].resource only DMIPatient
* entry[Professionnel].resource 1..
* entry[Professionnel].resource only DMIPractitioner
* entry[EntiteJuridique].resource 1..
* entry[EntiteJuridique].resource only DMIOrganizationEJ
* entry[OrganisationInterne].resource 1..
* entry[OrganisationInterne].resource only DMIOrganizationInterne
* entry[Invoice].resource 1..
* entry[Invoice].resource only DMIInvoice
* entry[Procedure].resource 1..
* entry[Procedure].resource only DMIProcedure
* entry[SupplyRequest].resource only DMISupplyRequestEnteteDemande or DMISupplyRequestEnteteCommande or DMISupplyRequestEnteteReponse
* entry[SupplyDelivery].resource 1..
* entry[SupplyDelivery].resource only DMISupplyDeliveryReceptionUnitaire or DMISupplyDeliveryEnteteReception or DMISupplyDeliveryEnteteDelivrance or DMISupplyDeliveryEnteteLivraison or DMISupplyDeliveryLigne
* entry[AuditEvent].resource 1..
* entry[AuditEvent].resource only DMIAuditEvent
* entry[BundleRequest].resource 1..
* entry[BundleRequest].resource only DMIBundleRequest
* entry[BundleDelivery].resource only DMIBundleDelivery