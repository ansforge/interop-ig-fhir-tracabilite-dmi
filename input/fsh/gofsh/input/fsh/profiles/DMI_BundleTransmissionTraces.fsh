Profile: DMI_BundleTransmissionTraces
Parent: Bundle
Id: dmi-bundle-transmission-traces
* meta 1..
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
* entry[DispositifMedical].resource only DMI_Device
* entry[DeviceDefinition].resource 1..
* entry[DeviceDefinition].resource only DMI_DeviceDefinition
* entry[Patient].resource 1..
* entry[Patient].resource only DMI_Patient
* entry[Professionnel].resource 1..
* entry[Professionnel].resource only DMI_Practitioner
* entry[EntiteJuridique].resource 1..
* entry[EntiteJuridique].resource only DMI_OrganizationEJ
* entry[OrganisationInterne].resource 1..
* entry[OrganisationInterne].resource only DMI_OrganizationInterne
* entry[Invoice].resource 1..
* entry[Invoice].resource only DMI_Invoice
* entry[Procedure].resource 1..
* entry[Procedure].resource only DMI_Procedure
* entry[SupplyRequest].resource only DMI_SupplyRequestEnteteDemande or DMI_SupplyRequestEnteteCommande or DMI_SupplyRequestEnteteReponse
* entry[SupplyDelivery].resource 1..
* entry[SupplyDelivery].resource only DMI_SupplyDeliveryReceptionUnitaire or DMI_SupplyDeliveryEnteteReceptionDMI or DMI_SupplyDeliveryEnteteDelivrance or DMI_SupplyDeliveryEnteteLivraison or DMI_SupplyDeliveryLigne or DMI_SupplyDeliveryEntreeStockDMI
* entry[AuditEvent].resource 1..
* entry[AuditEvent].resource only DMI_AuditEvent
* entry[BundleRequest].resource 1..
* entry[BundleRequest].resource only DMI_BundleRequest
* entry[BundleDelivery].resource only DMI_BundleDelivery