# Artifacts Summary - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [SearchParameter DMI Device definitionType](SearchParameter-DMI-Device-definition-type.md) | Permet la recherche sur le type de définition du DMI |
| [SearchParameter DMI Device lotNumber](SearchParameter-DMI-Device-lotNumber.md) | Permet de faire une recherche sur le numéro de lot du DMI |
| [SearchParameter DMI Device serialNumber](SearchParameter-DMI-Device-serialNumber.md) | Permet la recherche sur le numéro de série du DMI |
| [SearchParameter DMI Patient INS](SearchParameter-DMI-Patient-INS.md) | Permet la recherche sur le code EMDN |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| |
| :--- |
| [DMIBundleDelivery](StructureDefinition-dmi-bundledelivery.md) |
| [DMIBundleRequest](StructureDefinition-dmi-bundle-request.md) |
| [DMIBundleTransmissionTraces](StructureDefinition-dmi-bundle-transmission-traces.md) |
| [DMIDevice](StructureDefinition-dmi-device.md) |
| [DMIDeviceDefinition](StructureDefinition-dmi-devicedefinition.md) |
| [DMIDeviceRequest](StructureDefinition-dmi-devicerequest.md) |
| [DMIInvoice](StructureDefinition-dmi-invoice.md) |
| [DMIOrganizationEJ](StructureDefinition-dmi-organization-ej.md) |
| [DMIOrganizationInterne](StructureDefinition-dmi-organization-interne.md) |
| [DMIPatient](StructureDefinition-dmi-patient.md) |
| [DMIPractitioner](StructureDefinition-dmi-practitioner.md) |
| [DMIProcedure](StructureDefinition-dmi-procedure.md) |
| [DMISupplyDeliveryEnteteDelivrance](StructureDefinition-dmi-supplydelivery-entete-delivrance.md) |
| [DMISupplyDeliveryEnteteLivraison](StructureDefinition-dmi-supplydelivery-entete-livraison.md) |
| [DMISupplyDeliveryEnteteReception](StructureDefinition-dmi-supplydelivery-enteter-reception.md) |
| [DMISupplyDeliveryLigne](StructureDefinition-dmi-supplydelivery-ligne.md) |
| [DMISupplyDeliveryReceptionUnitaire](StructureDefinition-dmi-supplydelivery-reception-unitaire.md) |
| [DMISupplyDeliveryTransport](StructureDefinition-dmi-supplydelivery-transport.md) |
| [DMISupplyRequestEnteteCommande](StructureDefinition-dmi-supplyrequest-entete-commande.md) |
| [DMISupplyRequestEnteteDemande](StructureDefinition-dmi-supplyrequest-entete-demande.md) |
| [DMISupplyRequestEnteteReponse](StructureDefinition-dmi-supplyrequest-entetereponse.md) |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [DMIClasseRisque](StructureDefinition-dmi-classe-risque.md) |  |
| [DMICodeEMDN](StructureDefinition-dmi-code-emdn.md) |  |
| [DMICodeLPP](StructureDefinition-dmi-code-lpp.md) |  |
| [DMIFacture](StructureDefinition-dmi-facture.md) |  |
| [DMIIPIdLogiciel](StructureDefinition-dmi-ip-id-logiciel.md) |  |
| [DMIIdentifiantLocalDistributeur](StructureDefinition-dmi-identifiant-local-distributeur.md) |  |
| [DMIIdentifiantLocalFabricant](StructureDefinition-dmi-identifiant-local-fabricant.md) |  |
| [DMIInternalDiameter](StructureDefinition-dmi-internal-diameter.md) |  |
| [DMIMarquageCE](StructureDefinition-dmi-marquage-ce.md) |  |
| [DMINomDistributeur](StructureDefinition-dmi-nom-distributeur.md) |  |
| [DMIOrganizationLocation](StructureDefinition-dmi-organization-location.md) |  |
| [DMIReferenceDistributeur](StructureDefinition-dmi-reference-distributeur.md) |  |
| [DMIReferenceOrganisationInterne](StructureDefinition-dmi-reference-organisation-interne.md) |  |
| [DMITransport](StructureDefinition-dmi-transport.md) |  |
| [Extension DMI referenceFabricant](StructureDefinition-dmi-reference-fabricant.md) | Extension pour référencer l'organisation fabricant du DMI |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [DMI Discriminator](CodeSystem-dmi-discriminator.md) | CodeSystem définissant les codes discriminants. |

