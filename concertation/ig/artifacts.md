# Artifacts Summary - Traçabilité des Dispositifs Médicaux Implantables v3.0.0-ballot

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [SearchParameter DMI Device definitionType](SearchParameter-dmi-device-definition-type.md) | Permet la recherche sur le Code EMDN |
| [SearchParameter DMI Device lotNumber](SearchParameter-dmi-device-lotNumber.md) | Permet de faire une recherche sur le numéro de lot du DMI |
| [SearchParameter DMI Device serialNumber](SearchParameter-dmi-device-serialNumber.md) | Permet la recherche sur le numéro de série du DMI |
| [SearchParameter DMI Patient INS](SearchParameter-DMI-Patient-INS.md) | Permet la recherche sur l'ins du patient |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [DMI Bundle Delivery](StructureDefinition-dmi-bundledelivery.md) | Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant la réception, la délivrance et la livraison d’un DMI. |
| [DMI Bundle Request](StructureDefinition-dmi-bundle-request.md) | Profil créé dans le cadre de ce volet pour transmettre au serveur l’ensemble des ressources permettant une commande, une demande et la réponse à la demande d’un DMI. |
| [DMI Bundle Transmission Traces](StructureDefinition-dmi-bundle-transmission-traces.md) | Profil créé dans le cadre de ce volet pour transmettre l’ensemble des ressources au serveur. |
| [DMI Device](StructureDefinition-dmi-device.md) | Profil créé dans le cadre de ce volet pour représenter une instance physique d’un dispositif médical. |
| [DMI DeviceDefinition](StructureDefinition-dmi-devicedefinition.md) | Profil créé dans le cadre de ce volet pour représenter un modèle de dispositif médical. |
| [DMI DeviceRequest](StructureDefinition-dmi-devicerequest.md) | Profil créé dans le cadre de ce volet permettant d’effectuer une commande, demande, et la réponse à une demande de dispositif médical. |
| [DMI Invoice](StructureDefinition-dmi-invoice.md) | Profil créé dans le cadre de ce volet pour représenter la facturation de dispositifs médicaux. |
| [DMI Organization EJ](StructureDefinition-dmi-organization-ej.md) | Profil créé dans le cadre de ce volet étendant le profil « FrOrganization ». Ce profil est utilisé pour représenter le fabricant et les distributeurs des DM. |
| [DMI Organization Interne](StructureDefinition-dmi-organization-interne.md) | Profil créé dans le cadre de ce volet permettant de représenter l’organisation interne (Service utilisateur). |
| [DMI Patient](StructureDefinition-dmi-patient.md) | Profil créé dans le cadre de ce volet étendant le profil français « FrPatient » publié par Interop’Santé. |
| [DMI Practitioner](StructureDefinition-dmi-practitioner.md) | Profil créé dans le cadre de ce volet étendant le profil « FrPractitionner» publié par Interop’Santé. |
| [DMI Procedure](StructureDefinition-dmi-procedure.md) | Profil créé dans le cadre de ce volet pour représenter l’intervention clinique ou chirurgicale implantant un dispositif médical. |
| [DMI SupplyDelivery Entete Delivrance](StructureDefinition-dmi-supplydelivery-entete-delivrance.md) | Profil créé dans le cadre de ce volet pour représenter l’entête des informations de la délivrance de dispositifs médicaux. |
| [DMI SupplyDelivery Entete Livraison](StructureDefinition-dmi-supplydelivery-entete-livraison.md) | Profil créé dans le cadre de ce volet pour représenter l’entête des informations de livraison de dispositifs médicaux. |
| [DMI SupplyDelivery Entete Reception](StructureDefinition-dmi-supplydelivery-enteter-reception.md) | Profil créé dans le cadre de ce volet pour représenter l’entête des informations de réception des dispositifs médicaux. |
| [DMI SupplyDelivery Ligne](StructureDefinition-dmi-supplydelivery-ligne.md) | Profil créé dans le cadre de ce volet pour représenter une ligne de livraison, de délivrance. |
| [DMI SupplyDelivery Reception Unitaire](StructureDefinition-dmi-supplydelivery-reception-unitaire.md) | Profil créé dans le cadre de ce volet pour représenter les informations de réception d’un dispositif médical. |
| [DMI SupplyDelivery Transport](StructureDefinition-dmi-supplydelivery-transport.md) | Profil créé dans le cadre de ce volet pour représenter les informations de transports des dispositifs médicaux. |
| [DMI SupplyRequest Entete Commande](StructureDefinition-dmi-supplyrequest-entete-commande.md) | Profil créé dans le cadre de ce volet permet transporter les informations générales d’une commande de dispositif médical. |
| [DMI SupplyRequest Entete Demande](StructureDefinition-dmi-supplyrequest-entete-demande.md) | Profil créé dans le cadre de ce volet pour transporter les informations générales d’une demande de dispositif médical. |
| [DMI SupplyRequest Entete Reponse](StructureDefinition-dmi-supplyrequest-entetereponse.md) | Profil créé dans le cadre de ce volet pour transporter les informations générales de la réponse à une demande de création ou de mise à jour de DMI. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [DMI Classe Risque](StructureDefinition-dmi-classe-risque.md) | Extension créée dans ce volet pour représenter la classe de risque. |
| [DMI Code EMDN](StructureDefinition-dmi-code-emdn.md) | Extension créée dans ce volet pour représenter le code EMDN. |
| [DMI Code LPP](StructureDefinition-dmi-code-lpp.md) | Extension créée dans ce volet pour représenter le code LPP. |
| [DMI Facture](StructureDefinition-dmi-facture.md) | Extension créée dans ce volet pour représenter une facture. |
| [DMI IP Id logiciel](StructureDefinition-dmi-ip-id-logiciel.md) | Extension créée dans ce volet pour représenter l'IP Id logiciel. |
| [DMI Identifiant Local Distributeur](StructureDefinition-dmi-identifiant-local-distributeur.md) | Extension créée dans ce volet pour représenter l'identifiant local distributeur. |
| [DMI Identifiant Local Fabricant](StructureDefinition-dmi-identifiant-local-fabricant.md) | Extension créée dans ce volet pour représenter l'identifiant local fabricant. |
| [DMI Internal Diameter](StructureDefinition-dmi-internal-diameter.md) | Extension créée dans ce volet pour représenter le diamètre interne. |
| [DMI Marquage CE](StructureDefinition-dmi-marquage-ce.md) | Extension créée dans ce volet pour représenter le marquage CE. |
| [DMI Nom Distributeur](StructureDefinition-dmi-nom-distributeur.md) | Extension créée dans ce volet pour représenter le nom distributeur. |
| [DMI Organization Location](StructureDefinition-dmi-organization-location.md) | Extension créée dans ce volet pour représenter le lieu de l'organisation. |
| [DMI Reference Distributeur](StructureDefinition-dmi-reference-distributeur.md) | Extension créée dans ce volet pour représenter la référence distributeur. |
| [DMI Reference Organisation Interne](StructureDefinition-dmi-reference-organisation-interne.md) | Extension créée dans ce volet pour référencer l'organisation fabricant du DMI. |
| [DMI Transport](StructureDefinition-dmi-transport.md) | Extension créée dans ce volet pour représenter le transport. |
| [Extension DMI Reference Fabricant](StructureDefinition-dmi-reference-fabricant.md) | Extension créée dans ce volet pour référencer l'organisation fabricant du DMI. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [DMI Discriminator](CodeSystem-dmi-discriminator.md) | CodeSystem définissant les codes discriminants. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| |
| :--- |
| [dmi-bundle-delivery-example](Bundle-dmi-bundle-delivery-example.md) |
| [dmi-bundle-request-example](Bundle-dmi-bundle-request-example.md) |
| [dmi-bundle-transmission-traces-example](Bundle-dmi-bundle-transmission-traces-example.md) |
| [dmi-device-example](Device-dmi-device-example.md) |
| [dmi-devicedefinition-example](DeviceDefinition-dmi-devicedefinition-example.md) |
| [dmi-devicerequest-example](DeviceRequest-dmi-devicerequest-example.md) |
| [dmi-invoice-example](Invoice-dmi-invoice-example.md) |
| [dmi-organization-ej-example](Organization-dmi-organization-ej-example.md) |
| [dmi-organization-interne-example](Organization-dmi-organization-interne-example.md) |
| [dmi-patient-example](Patient-dmi-patient-example.md) |
| [dmi-practitioner-example](Practitioner-dmi-practitioner-example.md) |
| [dmi-procedure-example](Procedure-dmi-procedure-example.md) |
| [dmi-supplydelivery-entete-delivrance-example](SupplyDelivery-dmi-supplydelivery-entete-delivrance-example.md) |
| [dmi-supplydelivery-entete-livraison-example](SupplyDelivery-dmi-supplydelivery-entete-livraison-example.md) |
| [dmi-supplydelivery-entete-reception-example](SupplyDelivery-dmi-supplydelivery-entete-reception-example.md) |
| [dmi-supplydelivery-ligne-example](SupplyDelivery-dmi-supplydelivery-ligne-example.md) |
| [dmi-supplydelivery-reception-unitaire-example](SupplyDelivery-dmi-supplydelivery-reception-unitaire-example.md) |
| [dmi-supplydelivery-transport-example](SupplyDelivery-dmi-supplydelivery-transport-example.md) |
| [dmi-supplyrequest-entete-commande-example](SupplyRequest-dmi-supplyrequest-entete-commande-example.md) |
| [dmi-supplyrequest-entete-demande-example](SupplyRequest-dmi-supplyrequest-entete-demande-example.md) |
| [dmi-supplyrequest-entete-reponse-example](SupplyRequest-dmi-supplyrequest-entete-reponse-example.md) |
| [tde-auditevent-example](AuditEvent-tde-auditevent-example.md) |

