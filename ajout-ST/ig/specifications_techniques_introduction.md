# Volume 2 - Détail des transactions - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* **Volume 2 - Détail des transactions**

## Volume 2 - Détail des transactions

### Ressources utilisées

La principale ressource HL7 FHIR utilisée et son niveau de maturité (NM) sont les suivants :

* AuditEvent (NM 3)

Diverses ressources sont référencées par la ressource AuditEvent afin de représenter le contenu véhiculé dans la trace :

* Practionner (NM 3),
* PractionnerRole (NM 2),
* Device (NM 2),
* Organization (NM 3),
* Patient (NM N),
* SupplyRequest (NM 1),
* DeviceRequest (NM 1),
* SupplyDelivery (NM 1),
* Procedure (NM 3),
* Invoice (NM 0),
* Bundle (NM N),
* Binary (NM N).

### Profils utilisés

Le tableau ci-dessous liste les profils utilisés pour les ressources mentionnées dans ce document, y compris les profils définis spécifiquement pour le volet Traçabilité des Dispositifs Médicaux Implantables en Établissement de santé (préfixe DMI). Pour les ressources non mentionnées dans ce tableau, le profil à utiliser est celui défini par HL7 FHIR.

| | | | |
| :--- | :--- | :--- | :--- |
| AuditEvent | TDE_AuditEvent | 1.0 | Profil défini dans le volet générique « Traçabilité d’événements » |
| Patient | [DMI_Patient](https://simplifier.net/frenchprofiledfhirar/frpatient) | 1.0 | Profil créé dans le cadre de ce volet étendant le profil français « FrPatient » publié par Interop’Santé |
| Practitioner | DMI_Practitioner | 1.0 | Profil créé dans le cadre de ce volet étendant le profil « FrPractitionner» publié par Interop’Sante |
| PractitionerRole | [DMI_PractitionerRole](https://simplifier.net/modelisationdesstructuresetdesprofessionnels/practitionerroleprofessionalrolerass) | 1.0 | Profil créé dans le cadre de ce volet étendant le profil « PractitionnerRoleProfessionalRoleRASS » de l’annuaire national représentant un professionnel |
| Organization | DMI_Organization_EJ | 1.0 | Profil créé dans le cadre de ce volet étendant le profil « FrOrganization ». Ce profil est utilisé pour représenter le fabricant et les distributeurs des DM. |
| DMI_OrganizationInterne | 1.0 | Profil créé dans le cadre de ce volet permettant de représenter l’organisation interne (Service utilisateur). | |
| Device | DMI_Device | 1.0 | Profil créé dans le cadre de ce volet permet de représenter une instance physique d’un dispositif médical. |
| DeviceDefinition | DMI_DeviceDefinition | 1.0 | Profil créé dans le cadre de ce volet permet de représenter un modèle de dispositif médical. |
| SupplyRequest | DMI_SupplyRequestEnteteDemande | 1.0 | Profil créé dans le cadre de ce volet permet de transporter les informations général d’une demande de dispositif médical. |
| DMI_SupplyRequestEnteteCommande | 1.0 | Profil créé dans le cadre de ce volet permet transporter les informations générales d’une commande de dispositif médical. | |
| DMI_SupplyRequestEnteteReponse | 1.0 | Profil créé dans le cadre de ce volet permet de transporter les informations générales de la réponse à une demande de création ou de mise à jour de DMI. | |
| DeviceRequest | DMI_DeviceRequest | 1.0 | Profil créé dans le cadre de ce volet permettant d’effectuer une commande, demande, et la réponse à une demande de dispositif médical |
| SupplyDelivery | DMI_SupplyDeliveryEnteteLivraison | 1.0 | Profil créé dans le cadre de ce volet permet de représenter l’entête des informations de livraison de dispositifs médicaux. |
| DMI_SupplyDeliveryLigne | 1.0 | Profil créé dans le cadre de ce volet permet de représenter une ligne de livraison, de délivrance, de transport et de réception de dispositifs médicaux. | |
| DMI_SupplyDeliveryEnteteDelivrance | 1.0 | Profil créé dans le cadre de ce volet permet de représenter l’entête des informations de la délivrance de dispositifs médicaux. | |
| DMI_SupplyDeliveryTransport | 1.0 | Profil créé dans le cadre de ce volet permet de représenter les informations de transports des dispositifs médicaux. | |
| DMI_SupplyDeliveryEnteteReceptionDMI | 1.0 | Profil créé dans le cadre de ce volet permet de représenter l’entête des informations de réception des dispositifs médicaux. | |
| DMI_SupplyDeliveryReceptionUnitaire | 1.0 | Profil créé dans le cadre de ce volet permet de représenter les informations de réception d’un dispositif médical. | |
| Procedure | DMI_Procedure | 1.0 | Profil créé dans le cadre de ce volet permet représenter l’l’intervention clinique ou chirurgicale implantant un dispositif médical. |
| Invoice | DMI_Invoice | 1.0 | Profil créé dans le cadre de ce volet permet de représenter la facturation de dispositifs médicaux. |
| Bundle | DMI_BundleRequest | 1.0 | Profil créé dans le cadre de ce volet permet de transmettre au serveur l’ensemble des ressources permettant une commande, une demande et la réponse à la demande d’un DMI |
| DMI_BundleDelivery | 1.0 | Profil créé dans le cadre de ce volet permet de transmettre au serveur l’ensemble des ressources permettant la réception, la délivrance et la livraison d’un DMI | |
| DMI_BundleTransmissionTraces | 1.0 | Profil créé dans le cadre de ce volet permet de transmettre l’ensemble des ressources au serveur | |

 Profils utilisés pour les ressources 

### ANNEXE 2 : GLOSSAIRE

| | |
| :--- | :--- |
| API | Application Programming Interface |
| ANS | Agence du Numérique en Santé |
| CI-SIS | Cadre d’Interopérabilité des Systèmes d’Information de Santé |
| FHIR | Fast Healthcare Interoperability Resources |
| HL7 | Health Level 7 |
| DMI | Dispositif médical implantable |
| HTTP | HyperText Transfer Protocol |
| JDV | Jeu De valeurs |
| JSON | JavaScript Object Notation |
| REST | Representational State Transfer |
| TRE | Terminologie de Référence |

