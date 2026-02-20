### Ressources utilisées

La principale ressource HL7 FHIR utilisée et son niveau de maturité (NM) sont les suivants :

- AuditEvent (NM 3)

Diverses ressources sont référencées par la ressource AuditEvent afin de représenter le contenu véhiculé dans la trace :

- Practionner (NM 3),

- PractionnerRole (NM 2),

- Device (NM 2),

- Organization (NM 3),

- Patient (NM N),

- SupplyRequest (NM 1),

- DeviceRequest (NM 1),

- SupplyDelivery (NM 1),

- Procedure (NM 3),

- Invoice (NM 0),

- Bundle (NM N),

- Binary (NM N).

### Profils utilisés

Le tableau ci-dessous liste les profils utilisés pour les ressources mentionnées dans ce document, y compris les profils définis spécifiquement pour le volet Traçabilité des Dispositifs Médicaux Implantables en Établissement de santé (préfixe DMI). Pour les ressources non mentionnées dans ce tableau, le profil à utiliser est celui défini par HL7 FHIR.

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 39%" />
<col style="width: 9%" />
<col style="width: 36%" />
</colgroup>
<thead>
<tr>
<th>Ressource</th>
<th>Profil</th>
<th>Version</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>AuditEvent</td>
<td>TDE_AuditEvent</td>
<td>1.0</td>
<td>Profil défini dans le volet générique « Traçabilité d’événements »</td>
</tr>
<tr>
<td>Patient</td>
<td>DMI_Patient</a></td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet étendant le profil français « FRCorePatientINSProfile » publié par Interop’Santé</td>
</tr>
<tr>
<td>Practitioner</td>
<td>DMI_Practitioner</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet étendant le profil « FRCorePractitionerProfile » publié par Interop’Sante</td>
</tr>
<tr>
<td>PractitionerRole</td>
<td>DMI_PractitionerRole</a></td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet étendant le profil « PractitionnerRoleProfessionalRoleRASS » de l’annuaire national
représentant un professionnel</td>
</tr>
<tr>
<td rowspan="2">Organization</td>
<td>DMI_Organization_EJ</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet étendant le profil « FRCoreOrganizationProfile ». Ce profil est utilisé pour représenter le fabricant et les distributeurs des DM.</td>
</tr>
<tr>
<td>DMI_OrganizationInterne</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permettant de représenter l’organisation interne (Service utilisateur).</td>
</tr>
<tr>
<td>Device</td>
<td>DMI_Device</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter une instance physique d’un dispositif médical.</td>
</tr>
<tr>
<td>DeviceDefinition</td>
<td>DMI_DeviceDefinition</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter un modèle de dispositif médical.</td>
</tr>
<tr>
<td rowspan="3">SupplyRequest</td>
<td>DMI_SupplyRequestEnteteDemande</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transporter les informations général d’une demande de dispositif médical.</td>
</tr>
<tr>
<td>DMI_SupplyRequestEnteteCommande</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet transporter les informations générales d’une commande de dispositif médical.</td>
</tr>
<tr>
<td>DMI_SupplyRequestEnteteReponse</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transporter les informations générales de la réponse à une demande de création ou de mise à jour de DMI.</td>
</tr>
<tr>
<td>DeviceRequest</td>
<td>DMI_DeviceRequest</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permettant d’effectuer une commande, demande, et la réponse à une demande de dispositif médical</td>
</tr>
<tr>
<td rowspan="6">SupplyDelivery</td>
<td>DMI_SupplyDeliveryEnteteLivraison</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter l’entête des informations de livraison de dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryLigne</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter une ligne de livraison, de délivrance, de transport et de réception de dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryEnteteDelivrance</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter l’entête des informations de la délivrance de dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryTransport</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter les informations de transports des dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryEnteteReceptionDMI</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter l’entête des informations de réception des dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryReceptionUnitaire</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter les informations de réception d’un dispositif médical.</td>
</tr>
<tr>
<td>Procedure</td>
<td>DMI_Procedure</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet représenter l’intervention clinique ou chirurgicale implantant un dispositif
médical.</td>
</tr>
<tr>
<td>Invoice</td>
<td>DMI_Invoice</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter la facturation de dispositifs médicaux.</td>
</tr>
<tr>
<td rowspan="3">Bundle</td>
<td>DMI_BundleRequest</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transmettre au serveur l’ensemble des ressources permettant une commande, une demande et la réponse à la demande d’un DMI</td>
</tr>
<tr>
<td>DMI_BundleDelivery</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transmettre au serveur l’ensemble des ressources permettant la réception, la délivrance et la livraison d’un DMI</td>
</tr>
<tr>
<td>DMI_BundleTransmissionTraces</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transmettre l’ensemble des ressources au serveur</td>
</tr>
</tbody>
</table>

<p style="text-align: center;">
Profils utilisés pour les ressources
</p>
