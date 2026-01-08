### INTRODUCTION

Ce document présente les spécifications techniques d’interopérabilité de
mise en œuvre du volet « Traçabilité des Dispositifs Médicaux
Implantables en Établissement de santé ».

Sa production est basée sur l’étude métier et l’étude des normes et
standards de ce volet (*cf. \[1\] et* \[2\]).

Ce volet est une instance du volet générique [« Traçabilité
d’événements »](https://esante.gouv.fr/volet-tracabilite-devenements)
qui s’appuie sur le profil ATNA (Audit Trail and Node Authentication) et
plus particulièrement le supplément RESTful ATNA[^1] défini par IHE
(Integrating the Healthcare Entreprise).

#### Lectorat cible

Ce document s’adresse aux maîtrises d’œuvre des systèmes d’information
qui implémentent des fonctionnalités de traçabilité des Dispositifs
Médicaux Implantables (DMI) en établissement de santé.

L’hypothèse est faite que le lecteur est familier au standard HL7 FHIR
R4 et au profil IHE ATNA.

#### Standards utilisés

Ces spécifications techniques se basent sur le supplément RESTful ATNA
qui vise à ajouter des interfaces HL7 FHIR R4 aux acteurs impliqués dans
ce profil IHE.

Ces spécifications font ainsi référence à la ressource « AuditEvent » de
FHIR et au profilage de cette ressource : TDE_AuditEvent ainsi qu’aux
spécifications de l’API REST FHIR.

A noter qu’il est possible de se baser sur le profil ATNA qui utilise le
protocole Syslog pour la transmission et une API HTTP REST pour la
recherche et la consultation. Il est préconisé d’utiliser le message
DICOM[^2] « AuditMessage » pour véhiculer les messages de sécurité mais
l’implémentation n’est pas limitée à ce seul format.

##### Ressources utilisées

La principale ressource HL7 FHIR utilisée et son niveau de maturité (NM)
sont les suivants :

- AuditEvent (NM 3)

Diverses ressources sont référencées par la ressource AuditEvent afin de
représenter le contenu véhiculé dans la trace :

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

##### Profils utilisés

Le tableau ci-dessous liste les profils utilisés pour les ressources
mentionnées dans ce document, y compris les profils définis
spécifiquement pour le volet Traçabilité des Dispositifs Médicaux
Implantables en Établissement de santé (préfixe DMI). Pour les
ressources non mentionnées dans ce tableau, le profil à utiliser est
celui défini par HL7 FHIR.

<table>
<caption><p>Tableau 1 : Profils utilisés pour les
ressources</p></caption>
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
<td>Profil défini dans le volet générique « Traçabilité
d’événements »</td>
</tr>
<tr>
<td>Patient</td>
<td><a
href="https://simplifier.net/frenchprofiledfhirar/frpatient">DMI_Patient</a></td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet étendant le profil français
« FrPatient » publié par Interop’Santé</td>
</tr>
<tr>
<td>Practitioner</td>
<td>DMI_Practitioner</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet étendant le profil
« FrPractitionner» publié par Interop’Sante</td>
</tr>
<tr>
<td>PractitionerRole</td>
<td><a
href="https://simplifier.net/modelisationdesstructuresetdesprofessionnels/practitionerroleprofessionalrolerass">DMI_PractitionerRole</a></td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet étendant le profil
« PractitionnerRoleProfessionalRoleRASS » de l’annuaire national
représentant un professionnel</td>
</tr>
<tr>
<td rowspan="2">Organization</td>
<td>DMI_Organization_EJ</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet étendant le profil
« FrOrganization ». Ce profil est utilisé pour représenter le fabricant
et les distributeurs des DM.</td>
</tr>
<tr>
<td>DMI_OrganizationInterne</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permettant de représenter
l’organisation interne (Service utilisateur).</td>
</tr>
<tr>
<td>Device</td>
<td>DMI_Device</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter une
instance physique d’un dispositif médical.</td>
</tr>
<tr>
<td>DeviceDefinition</td>
<td>DMI_DeviceDefinition</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter un
modèle de dispositif médical.</td>
</tr>
<tr>
<td rowspan="3">SupplyRequest</td>
<td>DMI_SupplyRequestEnteteDemande</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transporter les
informations général d’une demande de dispositif médical.</td>
</tr>
<tr>
<td>DMI_SupplyRequestEnteteCommande</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet transporter les
informations générales d’une commande de dispositif médical.</td>
</tr>
<tr>
<td>DMI_SupplyRequestEnteteReponse</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transporter les
informations générales de la réponse à une demande de création ou de
mise à jour de DMI.</td>
</tr>
<tr>
<td>DeviceRequest</td>
<td>DMI_DeviceRequest</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permettant d’effectuer une
commande, demande, et la réponse à une demande de dispositif
médical</td>
</tr>
<tr>
<td rowspan="6">SupplyDelivery</td>
<td>DMI_SupplyDeliveryEnteteLivraison</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter l’entête
des informations de livraison de dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryLigne</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter une
ligne de livraison, de délivrance, de transport et de réception de
dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryEnteteDelivrance</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter l’entête
des informations de la délivrance de dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryTransport</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter les
informations de transports des dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryEnteteReceptionDMI</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter l’entête
des informations de réception des dispositifs médicaux.</td>
</tr>
<tr>
<td>DMI_SupplyDeliveryReceptionUnitaire</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter les
informations de réception d’un dispositif médical.</td>
</tr>
<tr>
<td>Procedure</td>
<td>DMI_Procedure</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet représenter
l’l’intervention clinique ou chirurgicale implantant un dispositif
médical.</td>
</tr>
<tr>
<td>Invoice</td>
<td>DMI_Invoice</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de représenter la
facturation de dispositifs médicaux.</td>
</tr>
<tr>
<td rowspan="3">Bundle</td>
<td>DMI_BundleRequest</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transmettre au
serveur l’ensemble des ressources permettant une commande, une demande
et la réponse à la demande d’un DMI</td>
</tr>
<tr>
<td>DMI_BundleDelivery</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transmettre au
serveur l’ensemble des ressources permettant la réception, la délivrance
et la livraison d’un DMI</td>
</tr>
<tr>
<td>DMI_BundleTransmissionTraces</td>
<td>1.0</td>
<td>Profil créé dans le cadre de ce volet permet de transmettre
l’ensemble des ressources au serveur</td>
</tr>
</tbody>
</table>

#### Utilisation

Les spécifications d'interopérabilité présentées dans ce volet ne
présagent pas des conditions de leur mise en œuvre dans le cadre d'un
système d'information partagé. Il appartient à tout responsable de
traitement de s'assurer que les services utilisant ces spécifications
respectent les cadres et bonnes pratiques applicables à ce genre de
service (ex : cadre juridique, bonnes pratiques de sécurité, ergonomie,
accessibilité ...). Il est à noter que les contraintes de sécurité
concernant les flux échangés ne sont pas traitées dans ce document.
Celles-ci sont du ressort de chaque responsable de l’implémentation du
mécanisme qui est dans l’obligation de se conformer au cadre juridique
en la matière. L’ANS propose des référentiels dédiés à la politique de
sécurité (la PGSSI-S[^3]) et des mécanismes de sécurisation sont définis
dans les volets de la couche Transport[^4] du Cadre d’Interopérabilité
des systèmes d’information de santé (CI-SIS).

1.  **CONTENU STRUCTURE DES FLUX**

#### Correspondance entre objets métier et objets du standard HL7 FHIR

Dans cette section, une mise en correspondance est faite entre :

Les objets métier identifiés à l’issue de l’étude métier,

Les ressources et éléments, du standard HL7 FHIR,

Pour chaque objet métier, les tableaux ci-après reprennent l’ensemble
des éléments métier identifiés dans l’étude métier du cas d’usage. Pour
chaque attribut de chaque classe métier, la ressource FHIR et plus
particulièrement l’élément de cette ressource sera identifié pour
véhiculer l’information.

Ce travail concerne les flux structurés énumérés ci-dessous :

Flux 22 – TransmissionTrace : pour transmettre les informations de
traçabilité d’un évènement.

Divers flux dérivent de ce flux général de transmission de traces :

Flux 1c - TracabiliteDemande: enregistrement de la demande ou de la
suppression de la demande de DMI.

Flux 2a - TracabiliteReponse: Ce flux permet au service utilisateur
d’avoir des informations sur le traitement de leur demande.

Flux 27 – TracabiliteCommande : enregistrement de la commande d’un DMI
auprès du gestionnaire de traçabilité

Flux 5 - TracabiliteLivraisonValide: Ce flux permet au gestionnaire de
réception de tracer la conformité de la totalité de la commande de DMI
par rapport aux bons de livraison dans le gestionnaire de traçabilité.

Flux 5a – TracabiliteLivraisonRejet : Ce flux permet au gestionnaire de
réception de tracer l'incohérence de la livraison avec les bons de
réception des DMI dans le gestionnaire de traçabilité..

Flux 5c – TracabiliteEntreeStockDMI : Ce flux permet au gestionnaire de
réception de tracer l'entrée au stock au sein de l'établissement du
nouveau DMI dans le gestionnaire de traçabilité.

Flux 5d – TracabiliteReceptionDMI :Ce flux permet au gestionnaire de
réception de tracer la réception du DMI au sein de l'établissement dans
le gestionnaire de traçabilité.

Flux 5e – TracabiliteRejetDMI : Ce flux permet au gestionnaire de
réception de tracer l'incohérence de la livraison avec les bons de
réception des DMI dans le gestionnaire de traçabilité.

Flux 6a – TracabiliteSortieStock : Ce flux permet au gestionnaire de DMI
de tracer la sortie du stock de la PUI du (des) DMI délivrés.

Flux 7 – TracabiliteDelivranceSU :Ce flux permet au service utilisateur
de tracer la délivrance du (des) DMI au service utilisateur..

Flux 9 – TracabiliteTransportDMI : enregistrement du transport du (des)
DMI délivrés au service utilisateur.

Flux 11 – TracabiliteEntreStock : enregistrement de l’entrée en stock du
(des) DMI au sein du service utilisateur.

Flux 12 – TracabiliteReceptionSU : enregistrement de la réception du
(des) DMI au sein du service utilisateur.

Flux 13a – TracabiliteRefusDMI : enregistrement du refus d’utiliser le
DMI durant l’opération.

Flux 14 – TracabiliteEchecPose : enregistrement de l’échec de la pose du
DMI durant l’opération.

Flux 15 -TracabilitePose : Ce flux permet au service utilisateur de
tracer l'acte de pose du DMI chez le patient.

Flux 16a – TracabiliteReassortDMI : enregistrement du réassort en DMI.

Flux 18 – TracabiliteFacturationDMI : enregistrement du paiement de la
facture du DMI.

Flux 28 – TracabiliteRejetDMI : Ce flux permet au gestionnaire de
réception du service utilisateur de tracer la cause du rejet de la
réception du DMI dans le gestionnaire de traçabilité.

Flux 30 – TracabiliteSortieStockSU : Ce flux permet au service
utilisateur de tracer la sortie du stock du service utilisateur du (des)
DMI. Flux 23 - RechercheTraces : pour la recherche de traces concernant
un ou plusieurs évènements selon une liste de critères de recherche
défini.

Flux 24 – ReponseRechercheTraces : pour obtenir le résultat de la
recherche de traces.

Flux 25 – ConsulterTrace : pour la demande de consultation d’une trace
d’un évènement en particulier.

Flux 26 – ReponseConsulterTrace : Ce flux porte les informations
répondant à la requête du Flux 25.

##### Flux 22 : TransmissionTrace

Ce flux permet à la source de traçabilité de transmettre les
informations de traçabilité du DMI pour un évènement au gestionnaire de
traçabilité.

Il correspond au « Flux 1 -TransmissionTrace » du volet « Traçabilité
des événements » avec la ressource profilée TDE_AuditEvent :

<table style="width:89%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 18%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td style="text-align: left;">identifiant [0..1] : Identifiant</td>
<td rowspan="11" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">id [0..1] id</td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
<td style="text-align: left;">identifiant [0..1] : Identifiant</td>
<td style="text-align: center;"><p>source[1..1].observer[1..1].
identifier [0..*] Identifier</p>
<p>Reference (PractitionerRole|Practitioner|
Organization|Device|Patient|RelatedPerson)</p></td>
</tr>
<tr>
<td rowspan="5" style="text-align: left;">Événement [1..1]</td>
<td style="text-align: left;">typeEvenement [0..1] Code</td>
<td style="text-align: center;"><p>type [1..1] Coding</p>
<p><em>TRE R254-TypeEvenement</em></p></td>
</tr>
<tr>
<td style="text-align: left;">sousTypeEvenement [0..1] Code</td>
<td style="text-align: center;"><p>subtype [0..1] Coding</p>
<p><em>N’est pas utilisé dans le context de ce volet.</em></p></td>
</tr>
<tr>
<td style="text-align: left;">occurence [0..1] DateHeure</td>
<td style="text-align: center;">period[0..1].start [1..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">declaration [0..1] DateHeure</td>
<td style="text-align: center;">recorded [1..1] instant</td>
</tr>
<tr>
<td style="text-align: left;">description [0..1] Texte</td>
<td style="text-align: center;">outcomeDesc [0..1] string</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ActeurEvenement [0..2]</td>
<td style="text-align: left;">identifiant [1..1] Identifiant</td>
<td style="text-align: center;"><p>agent[1..2].who[1..1].</p>
<p>Reference (PractitionerRole|Practitioner|Organization|
Device|Patient|RelatedPerson)</p></td>
</tr>
<tr>
<td style="text-align: left;">role [1..1] Code</td>
<td style="text-align: left;">agent[1..2].role [0..*]
CodeableConcept</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;">contenu [0..1] ObjetBinaire</td>
<td style="text-align: center;"><p>entity[0..*].what [0..1] reference
“Any”</p>
<p>ou entity[0..*].detail [0..*] BackBoneElement</p></td>
</tr>
</tbody>
</table>

Tableau 2 Mise en correspondance des contenus métiers/standard du flux
22

Le contenu de l’évènement (ObjetEvenement) varie en fonction du cas
d’utilisation. Il sera détaillé dans les flux suivants.

Le contenu peut être structuré et ainsi transporter les classes des
objets métiers. Le contenu peut aussi être non-structuré et ainsi
transporter les informations métiers encodés en binaire.

Si possible il faut privilégier l’utilisation d’un contenu structuré.

##### Flux 1c – TracabiliteDemande

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux
occurrences de la classe ObjetEvenement :

<table style="width:95%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 14%" />
<col style="width: 34%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: left;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu [0..1]</strong>
ObjetBinaire <a href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference
(Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Demande [1..1]</td>
<td style="text-align: left;">EntêteDemande [1..1]</td>
<td rowspan="2" style="text-align: center;">Bundle<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td rowspan="2" style="text-align: center;">Entry [0..*]
BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">LigneDemande [1..*]</td>
</tr>
<tr>
<td rowspan="10" style="text-align: left;">EntêteDemande [1..1]</td>
<td style="text-align: left;">reference : [1..1] Identifiant</td>
<td rowspan="10" style="text-align: center;">SupplyRequest<a href="#fn3"
class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a></td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">natureDemande : [0..1] Texte</td>
<td style="text-align: center;">category [0..1] codeableConcept</td>
</tr>
<tr>
<td style="text-align: left;">quantiteTotale : [0..1] Numerique</td>
<td style="text-align: center;">quantity [1..1] Quantity</td>
</tr>
<tr>
<td style="text-align: left;">dateDem : [0..1] Date</td>
<td style="text-align: center;">authoredOn [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">supprDemande : [0..1] boolean</td>
<td style="text-align: center;">status [0..1] code</td>
</tr>
<tr>
<td style="text-align: left;">motifSuppr : [0..1] Texte</td>
<td style="text-align: center;">text [0..1] Narrative</td>
</tr>
<tr>
<td style="text-align: left;">Type événement [0..1] : Code</td>
<td style="text-align: center;"><p>Item [1..1].itemCodeableConcept
CodeableConcept</p>
<p>TRE_R254-TypeEvenement</p></td>
</tr>
<tr>
<td style="text-align: left;">metadonnee [1..1] : Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">Professionnel [1..1]<a href="#fn4"
class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: center;">Requester[0..1]
Reference(Practitioner)</td>
</tr>
<tr>
<td style="text-align: left;">OrganisationInterne [1..1]<a href="#fn5"
class="footnote-ref" id="fnref5"
role="doc-noteref"><sup>5</sup></a></td>
<td style="text-align: center;">deliverTo[0..1]Reference
(Organization)</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">LigneDemande [1..*]</td>
<td style="text-align: left;">IdLigneAssocieeEntete [0..1]</td>
<td rowspan="7" style="text-align: center;">DeviceRequest<a href="#fn6"
class="footnote-ref" id="fnref6"
role="doc-noteref"><sup>6</sup></a></td>
<td style="text-align: center;">groupIdentifier [0..1] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">EnteteDemandeAssociee [1..1]</td>
<td style="text-align: left;">basedOn [0..1] Reference
(SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">DispositifMedical [1..1]<a href="#fn7"
class="footnote-ref" id="fnref7"
role="doc-noteref"><sup>7</sup></a></td>
<td style="text-align: center;">Subject [1..1] Reference (<a
href="http://hl7.org/fhir/patient.html">Patient</a> | <a
href="http://hl7.org/fhir/group.html">Group</a> | <a
href="http://hl7.org/fhir/location.html">Location</a> | <a
href="http://hl7.org/fhir/device.html">Device</a>)</td>
</tr>
<tr>
<td style="text-align: left;">TypeLigneDemande [1..1]</td>
<td style="text-align: center;">Intent [1..1] Code</td>
</tr>
<tr>
<td style="text-align: left;">dateUtilisation [0..1] Date</td>
<td style="text-align: center;">OccurenceDateTime [0..1] Date</td>
</tr>
<tr>
<td style="text-align: left;">Metadonne : [1..1] Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">NomDispositifDemande [1..1]</td>
<td style="text-align: center;"><p>code
[1..1].codeCodeableConcept.text</p>
<p>String</p></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu [0..1] :</strong>
ObjetBinaire<a href="#fn8" class="footnote-ref" id="fnref8"
role="doc-noteref"><sup>8</sup></a></td>
<td style="text-align: left;">entity[0..*].detail
[0..1].valueBase64Binary [1..1] base64Binary </td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est une demande. Cet
élément est décrit dans une partie spécifique « Demande ».<a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Suit le profil DMI_BundleRequest<a href="#fnref2"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Suit le profil DMI_SupplyRequestEnteteDemande<a
href="#fnref3" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Le détail du professionnel est décrit dans une partie
spécifique « <a href="#classe-dispositifmedical">7.11
Professionnel </a>».<a href="#fnref4" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>Le détail de l’organisationInterne est décrit dans une
partie spécifique « <a href="#classe-dispositifmedical">7.5
OrganisationInterne </a>» .<a href="#fnref5" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn6"><p>Pour chaque occurrence de l’élément LigneDemande on va
créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest<a
href="#fnref6" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn7"><p>Le détail du dispositif médical est décrit dans une
partie spécifique « <a href="#classe-dispositifmedical">7.1
DispositifMedical </a>» .<a href="#fnref7" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn8"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré de la demande.<a href="#fnref8" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

Tableau 3 : Mise en correspondance des contenus métiers/standard du flux
1c

##### Flux 2a - TracabilitéReponse

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux
occurrences de la classe ObjetEvenement :

<table style="width:96%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 18%" />
<col style="width: 32%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: left;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu [0..1]</strong>
ObjetBinaire <a href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: left;">entity[0..*].what [0..1] Reference
(Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Reponse [1..1]</td>
<td style="text-align: left;">EntêteReponse [1..1]</td>
<td rowspan="2" style="text-align: left;">Bundle<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td rowspan="2" style="text-align: left;">Entry [0..*]
BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">DetailReponse [1..*]</td>
</tr>
<tr>
<td rowspan="6" style="text-align: left;">EntêteReponse [1..1]</td>
<td style="text-align: left;">reference : [1..1] Identifiant</td>
<td rowspan="6" style="text-align: left;">SupplyRequest<a href="#fn3"
class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a></td>
<td style="text-align: left;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">dateDem : [0..1] Date</td>
<td style="text-align: left;">authoredOn [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">quantiteTotale : [0..1] Numerique</td>
<td style="text-align: left;">quantity [1..1] Quantity</td>
</tr>
<tr>
<td style="text-align: left;">infoCompl : [0..1] Texte</td>
<td style="text-align: left;">text [0..1] Narrative</td>
</tr>
<tr>
<td style="text-align: left;">TypeEvenement [1..1] Code</td>
<td style="text-align: left;"><p>Item [1..1].itemCodeableConcept
CodeableConcept</p>
<p>TRE_R254-TypeEvenement</p></td>
</tr>
<tr>
<td style="text-align: left;">metadonnee [1..1] : Metadonnee</td>
<td style="text-align: left;">meta [0..1] Meta</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">DetailReponse [1..*]</td>
<td style="text-align: left;">IdDetailReponseAssocieEnteteReponse
[0..1]</td>
<td rowspan="7" style="text-align: center;">DeviceRequest<a href="#fn4"
class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: left;">groupIdentifier [0..1] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">EntêteReponseAssociee [0..1]</td>
<td style="text-align: left;">basedOn [0..1] Reference
(SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">NomDispostifDemande [1..1]</td>
<td style="text-align: left;"><p>code
[1..1].codeCodeableConcept.text</p>
<p>String</p></td>
</tr>
<tr>
<td style="text-align: left;">TypeDetailReponse [1..1]</td>
<td style="text-align: center;">Intent [1..1] Code</td>
</tr>
<tr>
<td style="text-align: left;">dateDelivrance : [0..1] Date</td>
<td style="text-align: center;">occurenceDateTime [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee [1..1] : Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">DispositifMedical [1..1]<a href="#fn5"
class="footnote-ref" id="fnref5"
role="doc-noteref"><sup>5</sup></a></td>
<td style="text-align: center;">Subject [1..1] Reference (<a
href="http://hl7.org/fhir/patient.html">Patient</a> | <a
href="http://hl7.org/fhir/group.html">Group</a> | <a
href="http://hl7.org/fhir/location.html">Location</a> | <a
href="http://hl7.org/fhir/device.html">Device</a>)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu : [0..1]
ObjetBinaire</strong><a href="#fn6" class="footnote-ref" id="fnref6"
role="doc-noteref"><sup>6</sup></a></td>
<td style="text-align: left;">entity[0..*].detail [0..1].
valueBase64Binary  [1..1] base64Binary </td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est une « Reponse ». Cet
élément est décrit dans une partie spécifique « Reponse ».<a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Suit le profil DMI_BundleRequest<a href="#fnref2"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Suit le profil DMI_SupplyRequestEnteteReponse<a
href="#fnref3" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Pour chaque occurrence de l’élément DetailReponse on va
créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest<a
href="#fnref4" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>La ligne est décrite dans une partie spécifique « <a
href="#classe-dispositifmedical">7.1 DispositifMedical </a>» .<a
href="#fnref5" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn6"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré de la « Reponse ».<a href="#fnref6" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

Tableau 4 : Mise en correspondance des contenus métiers/standard du flux
2a

##### Flux 27 – TracabiliteCommande

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »,
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement, ObjetEvenement.

<table style="width:89%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 18%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: left;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu : [0..1]
ObjetBinaire</strong><a href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference
(Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Commande [1..1]</td>
<td style="text-align: left;">EntêteCommande [1..1]</td>
<td rowspan="2" style="text-align: center;">Bundle<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td rowspan="2" style="text-align: center;">Entry [0..*]
BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">Ligne [1..*]</td>
</tr>
<tr>
<td rowspan="8" style="text-align: left;">EntêteCommande [1..1]</td>
<td style="text-align: left;">refCommande : [1..1] Identifiant</td>
<td rowspan="8" style="text-align: center;">SupplyRequest<a href="#fn3"
class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a></td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">type : [0..1] Code</td>
<td style="text-align: center;">category [0..1] CodeableConcept</td>
</tr>
<tr>
<td style="text-align: left;">quantiteTotale : [0..1] Numerique</td>
<td style="text-align: center;">quantity [1..1] Quantity</td>
</tr>
<tr>
<td style="text-align: left;">date : [0..1] DateHeure</td>
<td style="text-align: center;">authoredOn [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">TypeEvenement [1..1] Code</td>
<td style="text-align: center;"><p>Item [1..1].itemCodeableConcept
CodeableConcept</p>
<p>TRE_R254-TypeEvenement</p></td>
</tr>
<tr>
<td style="text-align: left;">metadonnee [1..1] : Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;"><strong>OrganisationInterne
[0..1]</strong> <a href="#fn4" class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: center;">deliverTo[0..1]
Reference(Organization)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Professionnel [0..1]</strong><a
href="#fn5" class="footnote-ref" id="fnref5"
role="doc-noteref"><sup>5</sup></a></td>
<td style="text-align: center;">Requester[0..1]
Reference(Practitioner)</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">LigneCommande [1..*]</td>
<td style="text-align: left;">IdLigneAssocieeEnteteCommande [0..1]</td>
<td rowspan="7" style="text-align: center;">DeviceRequest<a href="#fn6"
class="footnote-ref" id="fnref6"
role="doc-noteref"><sup>6</sup></a></td>
<td style="text-align: center;">groupIdentifier [0..1] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">EnteteCommandeAssociee [1..1]</td>
<td style="text-align: center;">basedOn [0..1] Reference
(SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">DispositifMedical [1..1]<a href="#fn7"
class="footnote-ref" id="fnref7"
role="doc-noteref"><sup>7</sup></a></td>
<td style="text-align: center;">Subject [1..1] Reference (<a
href="http://hl7.org/fhir/patient.html">Patient</a> | <a
href="http://hl7.org/fhir/group.html">Group</a> | <a
href="http://hl7.org/fhir/location.html">Location</a> | <a
href="http://hl7.org/fhir/device.html">Device</a>)</td>
</tr>
<tr>
<td style="text-align: left;">TypeLigneCommande [1..1</td>
<td style="text-align: center;">Intent [1..1] Code</td>
</tr>
<tr>
<td style="text-align: left;">dateUtilisation : [0..1] Date</td>
<td style="text-align: center;">Occurrence [0..1].occurenceDateTime
dateTime</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">DispostifCommande [1..1]</td>
<td style="text-align: center;">code[1..1].codeReference
Reference(Device)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu [0..1]:</strong>
ObjetBinaire <a href="#fn8" class="footnote-ref" id="fnref8"
role="doc-noteref"><sup>8</sup></a></td>
<td style="text-align: left;">entity[0..*].detail [0..1].
valueBase64Binary [1..1] base64Binary</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est une commande. Cet
élément est décrit dans une partie spécifique « Commande ».<a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Suit le profil DMI_BundleRequest<a href="#fnref2"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Suit le profil DMI_SupplyRequestEnteteCommande<a
href="#fnref3" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Le détail de l’organisation interne est décrit dans une
partie spécifique « 7.5 OrganisationInterne ».<a href="#fnref4"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>Le détail du professionnel est décrit dans une partie
spécifique « <a href="#classe-dispositifmedical">7.11
Professionnel </a>».<a href="#fnref5" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn6"><p>Pour chaque occurrence de l’élément LigneCommande on va
créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest<a
href="#fnref6" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn7"><p>Le détail du dipositif médical est décrit dans une
partie spécifique « <a href="#classe-dispositifmedical">7.1
DispositifMedical </a>».<a href="#fnref7" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn8"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré de la commande.<a href="#fnref8" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

Tableau 5 : Mise en correspondance des contenus métiers/standard du flux
27

##### Flux 5 – TracabiliteLivraisonValide

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux
occurrences de la classe ObjetEvenement :

<table style="width:89%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 18%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: left;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu : [0..1] Objet
binaire</strong><a href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference
(Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Livraison [1..1]</td>
<td style="text-align: left;">EnteteLivraison [1..1]</td>
<td rowspan="2" style="text-align: left;">Bundle<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td rowspan="2" style="text-align: center;">Entry [0..*]
BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">LigneLivraison [1..*]</td>
</tr>
<tr>
<td rowspan="8" style="text-align: left;">EnteteLivraison [1..1]</td>
<td style="text-align: left;">referenceCommande : [1..1]
Identifiant</td>
<td rowspan="8" style="text-align: left;">SupplyDelivery<a href="#fn3"
class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a></td>
<td style="text-align: center;">basedOn [0..*] Reference
(SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">quantiteTotale : [0..1] Numerique</td>
<td style="text-align: center;">suppliedItem[0..1].quantity [0..1]
SimpleQuantity</td>
</tr>
<tr>
<td style="text-align: left;">dateLivraison : [1..1] DateHeure</td>
<td style="text-align: center;">occurrenceDateTime [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">livraisonConforme : [0..1] boolean</td>
<td style="text-align: center;">status [0..1] code</td>
</tr>
<tr>
<td style="text-align: left;">motifRejet : [0..1] Texte</td>
<td style="text-align: center;">text [0..1] Narrative</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee [1..1] : Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Professionnel [1..1]</strong><a
href="#fn4" class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: center;"><p>Receiver [0..*] Reference</p>
<p>(Practitioner | PractitionerRole)</p></td>
</tr>
<tr>
<td style="text-align: left;"><strong>OrganisationInterne
[1..1]</strong> <a href="#fn5" class="footnote-ref" id="fnref5"
role="doc-noteref"><sup>5</sup></a></td>
<td style="text-align: center;"><em>Extension :
DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)</em></td>
</tr>
<tr>
<td rowspan="6" style="text-align: left;">LigneLivraison [1..*]</td>
<td style="text-align: left;">ReferenceCommandeAssociee [1..1]</td>
<td rowspan="6" style="text-align: center;">SupplyDelivery<a href="#fn6"
class="footnote-ref" id="fnref6"
role="doc-noteref"><sup>6</sup></a></td>
<td style="text-align: center;">basedOn[0..*] Reference
(SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">ReferenceEntêteLivraison [1..1]</td>
<td style="text-align: center;">Part of [0..*] Reference
(SupplyDelivery)</td>
</tr>
<tr>
<td style="text-align: left;">dateLivraison : [1..1] DateHeure</td>
<td style="text-align: center;">occurrenceDateTime [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">livraisonConforme : [0..1] boolean</td>
<td style="text-align: center;">status [0..1] code</td>
</tr>
<tr>
<td style="text-align: left;">motifRejet : [0..1] Texte</td>
<td style="text-align: center;">text [0..1] Narrative</td>
</tr>
<tr>
<td style="text-align: left;"><strong>DispositifMedical
[1..*]</strong><a href="#fn7" class="footnote-ref" id="fnref7"
role="doc-noteref"><sup>7</sup></a></td>
<td style="text-align: center;"><p>suppliedItem[0..1].itemReference
[0..1] Reference</p>
<p>(Medication | Substance | Device)</p></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu : Objet binaire
[0..1]</strong><a href="#fn8" class="footnote-ref" id="fnref8"
role="doc-noteref"><sup>8</sup></a></td>
<td style="text-align: left;">entity[0..*].detail [0..1].
valuebase64Binary </td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est une livraison. Cet
élément est décrit dans une partie spécifique « Livraison ».<a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Suit le profil DMI_BundleDelivery<a href="#fnref2"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Suit le profil DMI_SupplyDeliveryEntêteLivraison<a
href="#fnref3" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Le détail du professionnel est décrit dans une partie
spécifique « <a href="#classe-dispositifmedical">7.11
Professionnel </a>».<a href="#fnref4" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>Le détail de l’organisation interne est décrit dans une
partie spécifique « 7.5 OrganisationInterne ».<a href="#fnref5"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn6"><p>Pour chaque occurrence de l’élément LigneLivraison on va
créer une ressource SupplyDelivery suivant le profil
DMI_SupplyDeliveryLigne<a href="#fnref6" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn7"><p>Le détail du dispositif médical est décrit dans une
partie spécifique « 7.1 DispositifMedical ».<a href="#fnref7"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn8"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré de la « Livraison ».<a href="#fnref8" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

Tableau 6 : Mise en correspondance des contenus métiers/standard du flux
5

##### Flux 5a - TracabiliteLivraisonRejet 

Ce flux reprend les mêmes éléments que le flux 5 (cf Tableau
6).<span id="_Flux_5c_–" class="anchor"></span>

##### Flux 5c – TracabiliteEntreeStockDMI 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux
occurrences de la classe ObjetEvenement :

<table>
<caption><p>Tableau 7 : Mise en correspondance des contenus
métiers/standard du flux 5c</p></caption>
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 20%" />
<col style="width: 34%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu :
[0..1]ObjetBinaire</strong><a href="#fn1" class="footnote-ref"
id="fnref1" role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: left;">entity[0..*].what [0..1] Reference
(SupplyDelivery)</td>
</tr>
<tr>
<td rowspan="4" style="text-align: left;">ReceptionUnitaire [1..1]</td>
<td style="text-align: left;">StatutReception [1..1]</td>
<td rowspan="7" style="text-align: center;">SupplyDelivery<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td style="text-align: left;">Cet élément est décrit dans une partie
spécifique « StatutReception ».</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Professionnel [1..1]</strong><a
href="#fn3" class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a></td>
<td style="text-align: center;"><p>Receiver [0..*] Reference</p>
<p>(Practitioner | PractitionerRole)</p></td>
</tr>
<tr>
<td style="text-align: left;"><strong>OrganisationInterne
[1..1]</strong> <a href="#fn4" class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: left;"><em>Extension :
DMI_ReferenceOrganisationInterne[1..1] Reference
(Organization)</em></td>
</tr>
<tr>
<td style="text-align: left;"><strong>DispositifMedical
[1..1]</strong><a href="#fn5" class="footnote-ref" id="fnref5"
role="doc-noteref"><sup>5</sup></a></td>
<td style="text-align: center;"><p>suppliedItem[0..1].itemReference
[0..1] Reference</p>
<p>(Medication | Substance | Device)</p></td>
</tr>
<tr>
<td rowspan="3" style="text-align: left;">StatutReception [1..1]</td>
<td style="text-align: left;">receptionConforme : [1..1] boolean</td>
<td style="text-align: center;">statut [0..1] code</td>
</tr>
<tr>
<td style="text-align: left;">motifRejet : [0..1] Texte</td>
<td style="text-align: center;">text [0..1] Narrative</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu: [0..1]
ObjetBinaire</strong><a href="#fn6" class="footnote-ref" id="fnref6"
role="doc-noteref"><sup>6</sup></a></td>
<td style="text-align: left;">entity[0..*].detail [0..1].
valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est l’ensemble des
éléments Cet élément est décrit dans une partie spécifique
« ReceptionUnitaire ».<a href="#fnref1" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Suit le profil DMI_SupplyDeliveryReceptionUnitaire<a
href="#fnref2" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Le détail du professionnel est décrit dans une partie
spécifique « <a href="#classe-dispositifmedical">7.11
Professionnel </a>».<a href="#fnref3" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Le détail de l’organisation interne est décrit dans une
partie spécifique « 7.5 OrganisationInterne ».<a href="#fnref4"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>Le détail du dispositif médical est décrit dans une
partie spécifique « 7.1 DispositifMedical ».<a href="#fnref5"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn6"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré de la « ReceptionUnitaire ».<a href="#fnref6"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

##### Flux 5d – TracabiliteReceptionDMI

Ce flux reprend les mêmes éléments que le flux 5c (cf 7Tableau 7).

##### Flux 5e – TracabiliteRejetDMI  

Ce flux reprend les mêmes éléments que le flux 5c (cf [Tableau
7](#_Flux_5c_–)).

##### Flux 6a – TracabiliteSortieStock 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux
occurrences de la classe ObjetEvenement :

<table style="width:89%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 18%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: left;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu : [0..1]
ObjetBinaire</strong><a href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference
(Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Délivrance [1..1]</td>
<td style="text-align: left;">EntêteDelivrance [1..1]</td>
<td rowspan="2" style="text-align: left;">Bundle<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">LigneDelivrance [1..*]</td>
<td style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">EntêteDelivrance [1..1]</td>
<td style="text-align: left;">referenceDelivrance : [1..1]
Identifiant</td>
<td rowspan="7" style="text-align: left;">SupplyDelivery<a href="#fn3"
class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a></td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">dateDelivrance : [0..1] Date</td>
<td style="text-align: center;">occurrenceDateTime [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">quantiteDelivree : [0..1] Numerique</td>
<td style="text-align: center;">suppliedItem[0..1].quantity [0..1]
SimpleQuantity</td>
</tr>
<tr>
<td style="text-align: left;">informationComplementaire : [0..1]
Texte</td>
<td style="text-align: center;">text [0..1] Narrative</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee [1..1] : Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">OrganisationInterne [1..1]<a href="#fn4"
class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: center;">Extension :
DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)</td>
</tr>
<tr>
<td style="text-align: left;">LigneDelivrance [1..*]</td>
<td style="text-align: center;">Cet élément est décrit dans une partie
spécifique « LigneDelivrance ».</td>
</tr>
<tr>
<td rowspan="5" style="text-align: left;">LigneDelivrance [1..*]</td>
<td style="text-align: left;">ReferenceDemandeAssociee [1..1]</td>
<td rowspan="5" style="text-align: center;">SupplyDelivery<a href="#fn5"
class="footnote-ref" id="fnref5"
role="doc-noteref"><sup>5</sup></a></td>
<td style="text-align: center;">basedOn[0..*] Reference
(SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">ReferenceEntêteDelivrance [1..1]</td>
<td style="text-align: center;">Part of [0..*]
Reference(SupplyDelivery)</td>
</tr>
<tr>
<td style="text-align: left;">dateDelivrance : [1..1] DateHeure</td>
<td style="text-align: center;">occurrenceDateTime [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">informationComplementaire : [0..1]
Texte</td>
<td style="text-align: center;">text [0..1] Narrative</td>
</tr>
<tr>
<td style="text-align: left;"><strong>DispositifMedical
[1..1]</strong><a href="#fn6" class="footnote-ref" id="fnref6"
role="doc-noteref"><sup>6</sup></a></td>
<td style="text-align: center;"><p>suppliedItem[0..1].itemReference
[0..1] Reference</p>
<p>(Medication | Substance | Device)</p></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu :
[0..1]ObjetBinaire</strong> <a href="#fn7" class="footnote-ref"
id="fnref7" role="doc-noteref"><sup>7</sup></a></td>
<td style="text-align: left;">entity[0..*].detail [0..1].
valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est une délivrance. Cet
élément est décrit dans une partie spécifique « Delivrance ».<a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Suit le profil DMI_BundleDelivery<a href="#fnref2"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Suit le profil DMI_SupplyDeliveryEnteteDelivrance<a
href="#fnref3" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Le détail de l’organisation interne est décrit dans une
partie spécifique « <a href="#classe-dispositifmedical">7.5
OrganisationInterne </a>».<a href="#fnref4" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>Pour chaque occurrence de l’élément LigneDelivrance on
va créer une ressource SupplyDelivery suivant le profil
DMI_SupplyDeliveryLigne<a href="#fnref5" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn6"><p>Le détail du dispositif médical est décrit dans une
partie spécifique « <a href="#classe-dispositifmedical">7.1
DispositifMedical </a>».<a href="#fnref6" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn7"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré de la délivrance.<a href="#fnref7" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

Tableau 8 : Mise en correspondance des contenus métiers/standard du flux
6a

##### Flux 7 – TracabiliteDelivranceSU 

Ce flux reprend les mêmes éléments que le flux 6a (cf [Tableau
8](#flux-6a-tracabilitesortiestock)).

##### Flux 9 – TracabiliteTransportDMI 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux
occurrences de la classe ObjetEvenement :

<table style="width:89%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 17%" />
<col style="width: 24%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: left;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu :
[0..1]ObjetBinaire</strong> <a href="#fn1" class="footnote-ref"
id="fnref1" role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference
(SupplyDelivery)</td>
</tr>
<tr>
<td rowspan="9" style="text-align: left;">Transport [1..1]</td>
<td style="text-align: left;">referenceTransport : [1..1]
Identifiant</td>
<td rowspan="9" style="text-align: center;">SupplyDelivery<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td style="text-align: center;"><em>Extension(Complex) :
DMI_transport[0..1].refTransport [1..1] Identifier</em></td>
</tr>
<tr>
<td style="text-align: left;">referenceDelivrance : [1..1]
Identifiant</td>
<td style="text-align: center;"><em>Extension(Complex) :
DMI_transport[0..1].refDelivery [1..1] Identifier</em></td>
</tr>
<tr>
<td style="text-align: left;">dateDelivrance : [0..1] Date</td>
<td style="text-align: center;">occurence [0..1].occurenceDateTime
dateTime</td>
</tr>
<tr>
<td style="text-align: left;">quantiteTransportee : [0..1]
Numerique</td>
<td style="text-align: center;">suppliedItem [0..1].quantity
SimpleQuantity</td>
</tr>
<tr>
<td style="text-align: left;">IncidentTransport : [0..1] boolean</td>
<td style="text-align: center;"><em>Extension(Complex) :
DMI_transport[0..1].incident [0..1] code</em></td>
</tr>
<tr>
<td style="text-align: left;">detailIncident : [0..1] Texte</td>
<td style="text-align: center;"><em>Extension(Complex) :
DMI_transport[0..1].detailIncident [0..1] string</em></td>
</tr>
<tr>
<td style="text-align: left;">informationComplementaire : [0..1]
Texte</td>
<td style="text-align: center;"><em>Extension(Complex) :
DMI_transport[0..1].text [0..1] string</em></td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: center;"><em>Extension(Complex) :
DMI_transport[0..1].meta [1..1] Meta</em></td>
</tr>
<tr>
<td style="text-align: left;">Professionnel [1..1]<a href="#fn3"
class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a></td>
<td style="text-align: center;">Receiver [0..*] Reference
(Practitionner, PractitionnerRole)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu [0..1] : Objet
binaire</strong><a href="#fn4" class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: left;">entity[0..*].detail [0..1].
valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est un transport. Cet
élément est décrit dans une partie spécifique « Transport ».<a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Suit le profil DMI_SupplyDeliveryTransport<a
href="#fnref2" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Le détail du professionnel est décrit dans une partie
spécifique « <a href="#classe-dispositifmedical">7.11
Professionnel </a>».<a href="#fnref3" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré du transport.<a href="#fnref4" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

Tableau 9 : Mise en correspondance des contenus métiers/standard du flux
9

##### Flux 11 – TracabiliteEntreStock 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux
occurrences de la classe ObjetEvenement :

<table style="width:96%;">
<colgroup>
<col style="width: 22%" />
<col style="width: 23%" />
<col style="width: 18%" />
<col style="width: 32%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: left;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu : [0..1] Objet
binaire</strong><a href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference
(Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ReceptionDMI [1..1]</td>
<td style="text-align: left;">EntêteReceptionDMI [1..1]</td>
<td rowspan="2" style="text-align: center;">Bundle<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">LigneReceptionDMI [1..*]</td>
<td style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">EntêteReceptionDMI [1..1]</td>
<td style="text-align: left;">referenceReception : [1..1]
Identifiant</td>
<td rowspan="7" style="text-align: center;">SupplyDelivery<a href="#fn3"
class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a></td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">referenceDelivrance : [1..1]
Identifiant</td>
<td style="text-align: center;">basedOn [0..1] Reference
(SupplyDelivery)</td>
</tr>
<tr>
<td style="text-align: left;">quantiteReceptionnee : [0..1]
Numerique</td>
<td style="text-align: center;">suppliedItem[0..1].quantity [0..1]
SimpleQuantity</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;"><strong>OrganisationInterne
[1..1]</strong><a href="#fn4" class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: center;"><em>Extension :
DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)</em></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Professionnel [1..1]</strong><a
href="#fn5" class="footnote-ref" id="fnref5"
role="doc-noteref"><sup>5</sup></a></td>
<td style="text-align: center;"><p>receiver [0..*] Reference</p>
<p>(Practitioner | PractitionerRole)</p></td>
</tr>
<tr>
<td style="text-align: left;">LigneReceptionDMI [1.*]</td>
<td style="text-align: center;">Cet élément est décrit dans une partie
spécifique “LigneReceptionDMI”</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">LigneReceptionDMI [1..*]</td>
<td style="text-align: left;">ReferenceDemandeAssociee [1..1]</td>
<td rowspan="7" style="text-align: center;">SupplyDelivery<a href="#fn6"
class="footnote-ref" id="fnref6"
role="doc-noteref"><sup>6</sup></a></td>
<td style="text-align: center;">basedOn[0..*] Reference
(SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">ReferenceEntêteReceptionDMI [1..1]</td>
<td style="text-align: center;">Part of [0..*]
Reference(SupplyDelivery)</td>
</tr>
<tr>
<td style="text-align: left;">dateReceptionSU [1..1] DateHeure</td>
<td style="text-align: center;">Occurrence [0..1].occurenceDateTime
dateTime</td>
</tr>
<tr>
<td style="text-align: left;">receptionConforme : [1..1] boolean</td>
<td style="text-align: center;">Status [0..1] code</td>
</tr>
<tr>
<td style="text-align: left;">motifRejet : [0..1] Texte</td>
<td style="text-align: center;">text [0..1] Narrative</td>
</tr>
<tr>
<td style="text-align: left;">Metadonnee [1..1] : Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;"><strong>DispositifMedical
[1..1]</strong><a href="#fn7" class="footnote-ref" id="fnref7"
role="doc-noteref"><sup>7</sup></a></td>
<td style="text-align: center;"><p>suppliedItem[0..1].itemReference
[0..1] Reference</p>
<p>(Medication | Substance | Device)</p></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu[0..1] Objet
binaire</strong><a href="#fn8" class="footnote-ref" id="fnref8"
role="doc-noteref"><sup>8</sup></a></td>
<td style="text-align: left;">entity[0..*].detail [0..1].
valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est la réception du DMI.
Cet élément est décrit dans une partie spécifique « ReceptionDMI ».<a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Suit le profil DMI_BundleDelivery<a href="#fnref2"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Suit le profil DMI_SupplyDeliveryEntêteReceptionDMI<a
href="#fnref3" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Le détail de l’organisation interne est décrit dans une
partie spécifique « <a href="#classe-dispositifmedical">7.5
OrganisationInterne </a>».<a href="#fnref4" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>Le détail du professionnel est décrit dans une partie
spécifique « <a href="#classe-dispositifmedical">7.11</a>
Professionnel».<a href="#fnref5" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn6"><p>Pour chaque occurrence de l’élément LigneReceptionDMI on
va créer une ressource SupplyDelivery suivant le profil
DMI_SupplyDeliveryLigne<a href="#fnref6" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn7"><p>Le détail du dispositif médical est décrit dans une
partie spécifique « <a href="#classe-dispositifmedical">7.1
DispositifMedical </a>».<a href="#fnref7" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn8"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré de la réception.<a href="#fnref8" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

Tableau 10 : Mise en correspondance des contenus métiers/standard du
flux 11

##### Flux 12 – TracabiliteReceptionSU 

Ce flux reprend les mêmes éléments que le flux 11 (cf Tableau 10).

##### Flux 28- TracabiliteRejetDMI

Ce flux reprend les mêmes éléments que le flux 11 (cf Tableau 10).

##### Flux 15 -TracabilitePose

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux
occurrences de la classe ObjetEvenement :

<table>
<caption><p>Tableau 11 : Mise en correspondance des contenus
métiers/standard du flux 15</p></caption>
<colgroup>
<col style="width: 22%" />
<col style="width: 20%" />
<col style="width: 18%" />
<col style="width: 38%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: left;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu [0..1]</strong>
ObjetBinaire <a href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference
(Procedure)</td>
</tr>
<tr>
<td rowspan="11" style="text-align: left;">InterventionMedicale
[1..1]</td>
<td style="text-align: left;">idIntervention : [1..1] Identifiant</td>
<td rowspan="11" style="text-align: left;">Procedure<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">numSejour : [0..1] Identifiant</td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">typeIntervention : [0..1] Code</td>
<td style="text-align: center;">category [0..1] CodeableConcept</td>
</tr>
<tr>
<td style="text-align: left;">dateIntervention : [1..1] DateHeure</td>
<td style="text-align: center;">performedDateTime [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">emplacementDMI : [1..1] Texte</td>
<td style="text-align: center;">bodySite [0..*] CodeableConcept</td>
</tr>
<tr>
<td style="text-align: left;">poseConforme : [1..1] Boolean</td>
<td rowspan="2" style="text-align: center;">Complication [0..*]
CodeableConcept</td>
</tr>
<tr>
<td style="text-align: left;">motifEchec : [0..1] Texte</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">Professionnel : [1..1]<a href="#fn3"
class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a></td>
<td style="text-align: center;"><p>performer[0..*].actor [1..1]
Reference</p>
<p>(<a href="https://hl7.org/FHIR/practitioner.html">Practitioner</a> |
<a
href="https://hl7.org/FHIR/practitionerrole.html">PractitionerRole</a>)</p></td>
</tr>
<tr>
<td style="text-align: left;">OrganisationInterne : [1..1]<a href="#fn4"
class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: center;">performer [0..*].onBehalfOf Reference
(Organization)</td>
</tr>
<tr>
<td style="text-align: left;">DispositifMedical : [1.1].<a href="#fn5"
class="footnote-ref" id="fnref5"
role="doc-noteref"><sup>5</sup></a></td>
<td style="text-align: center;"><p>focalDevice[0..*].manipulated [1..1]
Reference</p>
<p>(Device)</p></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu : [0..1] Objet
binaire</strong> <a href="#fn6" class="footnote-ref" id="fnref6"
role="doc-noteref"><sup>6</sup></a></td>
<td style="text-align: left;">entity[0..*].detail [0..1].
valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est une intervention
médicale. Cet élément est décrit dans une partie spécifique
« InterventionMedicale ».<a href="#fnref1" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Pour l’élément InterventionMedicale on va créer une
ressource Procedure suivant le profil DMI_Procedure<a href="#fnref2"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Le détail du professionnel est décrit dans une partie
spécifique «7.11 Professionnel ».<a href="#fnref3" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Le détail de l’organisation interne est décrit dans une
partie spécifique «7.5 OrganisationInterne ».<a href="#fnref4"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>Le détail du dispositif médical est décrit dans une
partie spécifique « 7.1 DispositifMedical».<a href="#fnref5"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn6"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré de l’intervention médicale.<a href="#fnref6"
class="footnote-back" role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

##### Flux 13a – TracabiliteRefusDMI 

Ce flux reprend les mêmes éléments que le flux 15 (cf [Tableau
1](#flux-15--tracabilitepose)1).

##### Flux 30 – TracabiliteSortieStockSU

Ce flux reprend les mêmes éléments que le flux 15 (cf [Tableau
1](#flux-15--tracabilitepose)1).

##### Flux 14 – TracabiliteEchecPose 

Ce flux reprend les mêmes éléments que le flux 15 (cf [Tableau
1](#flux-15--tracabilitepose)1).

##### Flux 16a – TracabiliteReassortDMI 

Ce flux reprend les mêmes éléments que le flux 27 (cf Tableau 5).

##### Flux 18 – TracabiliteFacturationDMI 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace »
précédemment présenté. Il reprend tel quel la structure des classes
Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux
occurrences de la classe ObjetEvenement :

<table style="width:95%;">
<caption><p><span id="_Flux_23_-" class="anchor"></span>Tableau 13 :
Mise en correspondance des contenus métiers/standard du flux
18</p></caption>
<colgroup>
<col style="width: 25%" />
<col style="width: 26%" />
<col style="width: 18%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace [1..1]</td>
<td rowspan="4" style="text-align: left;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau 2</a></td>
</tr>
<tr>
<td style="text-align: left;">SourceTrace [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">Événement [1..1]</td>
</tr>
<tr>
<td style="text-align: left;">ActeurEvenement [0..2]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: left;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu [0..1]</strong>
ObjetBinaire <a href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a></td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference
(Invoice)</td>
</tr>
<tr>
<td rowspan="10" style="text-align: left;">Facture [1..1]</td>
<td style="text-align: left;">refFacture : [1..1] Identifiant</td>
<td rowspan="10" style="text-align: left;">Invoice<a href="#fn2"
class="footnote-ref" id="fnref2"
role="doc-noteref"><sup>2</sup></a></td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">facture : [0..1] ObjetBinaire</td>
<td style="text-align: center;"><em>Extension : DMI_Facture [0..1]
Reference (Binary)</em></td>
</tr>
<tr>
<td style="text-align: left;">typeFacture : [0..1] Code</td>
<td style="text-align: center;">type [0..1] CodeableConcept</td>
</tr>
<tr>
<td style="text-align: left;">refCommande : [1..1] Identifiant</td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">dateEmission : [0..1] Date</td>
<td style="text-align: center;">date [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">instructionPaiement : [0..1] Texte</td>
<td style="text-align: center;">paymentTerms [0..1] markdown</td>
</tr>
<tr>
<td style="text-align: left;">montantTotal : [0..1] Numerique</td>
<td style="text-align: center;">totalNet [0..1] Money</td>
</tr>
<tr>
<td style="text-align: left;">Devise [0..1] code</td>
<td style="text-align: center;">totalNet[0..1].currency [0..1] code</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Ligne : [1.*]</strong><a
href="#fn3" class="footnote-ref" id="fnref3"
role="doc-noteref"><sup>3</sup></a><strong>.</strong></td>
<td style="text-align: center;">L’élément ligne est décrit dans une
partie spécifique “Ligne”</td>
</tr>
<tr>
<td rowspan="3" style="text-align: left;">Ligne [1..*]</td>
<td style="text-align: left;">dateAchat : [1..1] Date</td>
<td rowspan="3" style="text-align: center;">Invoice</td>
<td
style="text-align: center;">lineItem[0..*].chargeItemReference[1..1].occurenceDateTime[0..1]</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">DispositifMedical : [1..1]<a href="#fn4"
class="footnote-ref" id="fnref4"
role="doc-noteref"><sup>4</sup></a></td>
<td style="text-align: center;">lineItem [0..*].chargeItem
[1..1].chargeItem.productReference [0..1]</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu : [0..1] Objet
binaire</strong><a href="#fn5" class="footnote-ref" id="fnref5"
role="doc-noteref"><sup>5</sup></a></td>
<td style="text-align: center;">entity[0..*].detail [0..1].
valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Le contenu de l’ObjetEvenement est une facture. Cet
élément est décrit dans une partie spécifique « Facture ».<a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Pour l’élémentFacture on va créer une ressource Invoice
suivant le profil DMI_Invoice<a href="#fnref2" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Cet élément est décrit dans une partie spécifique
« Ligne ».<a href="#fnref3" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>Le détail du dispositif médical est décrit dans une
partie spécifique « <a href="#classe-dispositifmedical">7.1</a>
DispositifMedical».<a href="#fnref4" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>Le contenu de l’ObjetEvenement est le contenu non
structuré de la facture.<a href="#fnref5" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

##### Flux 23 - RechercheTraces

Ce flux intervient lorsque le consommateur effectue une recherche de
traces d’un ou de plusieurs DMI se trouvant dans l’établissement de
santé auprès du gestionnaire de traçabilité en précisant les critères de
sa recherche.

Il correspond au « Flux 4 -RechercheTraces » du volet « Traçabilité des
évènements ».

Ci-dessous les critères de recherches. Les critères apparaissant *en
italique et en rouge* correspondent à des paramètres de recherche créés
pour répondre au besoin :

<table>
<caption><p>Tableau 14 : Mise en correspondance des contenus
métiers/standards du flux 23</p></caption>
<colgroup>
<col style="width: 34%" />
<col style="width: 11%" />
<col style="width: 23%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr>
<th rowspan="2" style="text-align: center;">Critère de recherche
SFE</th>
<th colspan="3" style="text-align: center;">Paramètre de recherche</th>
</tr>
<tr>
<th style="text-align: center;">Ressource</th>
<th style="text-align: center;">Paramètre identifié dans le volet
« Généricisation : Traçabilité des évènements  »</th>
<th style="text-align: center;">Paramètre supplémentaire identifié par
ce volet</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">Evenement/typeEvenement</td>
<td rowspan="8" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">type : token</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;">Evenement/declaration</td>
<td style="text-align: center;">date : date</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;">Evenement/sousTypeEvenement</td>
<td style="text-align: center;">subtype : token</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td rowspan="4"
style="text-align: center;">ActeurEvenement/identifiant</td>
<td style="text-align: center;">agent : reference</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;">agent-name : string</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;">altId : token</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td style="text-align: center;">patient : reference</td>
</tr>
<tr>
<td style="text-align: center;">ActeurEvenement/role</td>
<td style="text-align: center;">agent-role : token</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;">DispositifMedical/support/IUD-ID</td>
<td rowspan="6" style="text-align: center;">Device</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">Device-udi-di : String</td>
</tr>
<tr>
<td
style="text-align: center;">DispositifMedical/support/identifiantHRF</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"><table style="width:15%;">
<colgroup>
<col style="width: 0%" />
<col style="width: 14%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;"></th>
<th style="text-align: center;">Device-udi-carrier</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
<p>: String</p></td>
</tr>
<tr>
<td
style="text-align: center;">DispositifMedical/referenceFabricant</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">manufacturer: String</td>
</tr>
<tr>
<td
style="text-align: center;">DispositifMedical/support/IUD-IPNumLot</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"><em>DMI_Device_lotNumber :
string</em></td>
</tr>
<tr>
<td
style="text-align: center;">DispositifMedical/support/IUD-IPNumSerie</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"><em>DMI_Device_serialNumber :
string</em></td>
</tr>
<tr>
<td style="text-align: center;">DispositifMedical/codeEMDN</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"><em>DMI_Device_definition-type :
token</em></td>
</tr>
<tr>
<td style="text-align: center;">Patient/identite/matriculeINS</td>
<td style="text-align: center;">Patient</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"><em>DMI_Patient_INS : token</em></td>
</tr>
</tbody>
</table>

##### Flux 24 – ReponseRechercheTraces 

Il s’agit du résultat de la recherche de traces retourné par le
gestionnaire de traçabilté. La recherche de traces retourne une
ressource Bundle de type SearchSet contenant les ressources AuditEvent
correspondant aux critères de recherche fournis par le consommateur.

Il correspond au « Flux 5 -ReponseRechercheTraces » du volet
« Traçabilité des évènements ».

##### Flux 25 – ConsulterTrace 

Ce flux intervient lorsque le consommateur demande à consulter la trace
d’un évènement auprès du gestionnaire de traçabilité.

Il correspond au « Flux 2 -ConsultationTrace » du volet « Traçabilité
des évènements » :

<table style="width:89%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 18%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: left;">Éléments métier</th>
<th colspan="2" style="text-align: center;">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Nom classes</strong></td>
<td style="text-align: left;"><strong>Nom attributs</strong></td>
<td style="text-align: center;"><strong>Ressource</strong></td>
<td style="text-align: center;"><strong>Elément</strong></td>
</tr>
<tr>
<td style="text-align: left;">Trace</td>
<td style="text-align: left;">identifiant [0..1] : Identifiant</td>
<td style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">id [1..1] id</td>
</tr>
</tbody>
</table>

Tableau 15 : Mise en correspondance des contenus métiers/standards du
flux 25

##### Flux 26 – ReponseConsulterTrace

Il s’agit du résultat de la demande de consultation de la trace d’un
évènement retourné par le gestionnaire de traçabilité. Le corps de la
réponse est la ressource AuditEvent identifiée lors de la demande.

Il correspond au « Flux 3 - ReponseConsultationTrace » du volet
« Traçabilité des évènements ».

### Contenu FHIR des flux structurés

Cette section décrit les ressources FHIR identifiées dans la section
précédente et identifie les profils applicables.

Ressource « Audit Event » :

Les flux de traçabilité sont basés sur la ressource « AuditEvent » telle
que spécifiée dans le volet « Traçabilité d’événements».

Cette ressource décrit les données liées à un évènement de sécurité
ainsi que les données de traçabilité en vue de maintenir un référentiel
de traces de sécurité.

Ressources représentant l’objet de l’évènement :

La ressource « AuditEvent » porte l’objet de l’évènement à travers
l’élément « entity » qui peut faire référence à plusieurs ressources :

- Ressource « Patient »

La ressource Patient représente la personne prise en charge. Pour ce
volet, le profil DMI_Patient étendant le profil FrPatient
d’Interop’Santé doit être utilisé. Dans l’étude métier (annexe 1.12),
seules les informations minimales d’identification et du patient sont
mentionnées, cependant, les autres éléments de la ressource peuvent
aussi être utilisés.

Profil DMI_Patient étendant le profil FrPatient vient modifier plusieurs
attributs :

- Passer la cardinalité de « Identifier » à \[1..\*\] pour véhiculer
  l’identité INS du patient

- Passer la cardinalité de « Telecom » à \[1..\*\] et changer le binding
  de « telecom.system » vers la TRE_R200-CanalCommunication

- Modifier le binding de « Address.type » vers la
  [TRE_R35-TypeVoie](https://mos.esante.gouv.fr/NOS/TRE_R35-TypeVoie/TRE_R35-TypeVoie.pdf)

- Passer la cardinalité de « Meta » à \[1..1\]

- Ressource « Device» et « DeviceDefinition »

  Device décrit une instance physique de DM. Cette ressource porte des
  informations caractérisant cette instance particulière (numéro de lot,
  numéro de série, date d'expiration, etc.).

  DeviceDefinition décrit un modèle de DM. Cette ressource porte des
  informations plus générales partagées par l'ensemble des instances
  d'un même modèle (classe de risque, stérilité, etc.).

  La ressource Device peut référencer la ressource DeviceDefinition.

  Afin de répondre aux besoins non couverts dans la version R4 de FHIR,
  des évolutions sur ces deux ressources ont été discutées dans le cadre
  d'un groupe de travail piloté par Interop'Santé/PHAST/ANS. Ces
  évolutions ont été proposées à HL7 afin d'être intégrées dans la
  prochaine version de FHIR (R5). Il s'agit notamment de l'ajout d'un
  élément DeviceDefinition.classification ou encore de la modification
  de l'élément DeviceDefinition.property

  La ressource Device suit le profil DMI_Device dont le mapping est
  présenté en annexe 1.5

<table>
<colgroup>
<col style="width: 11%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 31%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="6">Device</td>
<td>DMI_MarquageCE</td>
<td>Extension</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>DMI_IPIdLogiciel</td>
<td>Extension</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Definition</td>
<td>Reference (DeviceDefinition)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>udiCarrier</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td rowspan="4">udiCarrier</td>
<td>deviceIndentifier</td>
<td>String</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>carrierHRF</td>
<td>String</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>carrierAIDC</td>
<td>Base64Binary</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>entryType</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td rowspan="2">Device</td>
<td>serialNumber</td>
<td>String</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>lotNumber</td>
<td>String</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td rowspan="16">Device</td>
<td>manufactureDate</td>
<td>dateTime</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>expirationDate</td>
<td>dateTime</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>modelNumber</td>
<td>String</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>partNumber</td>
<td>String</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Specialization</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>version</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Property</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Patient</td>
<td>Reference(Patient)</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1] dans le cas du flux 13 au flux 15 et le
flux 30.</td>
<td></td>
</tr>
<tr>
<td>Owner</td>
<td>Reference (Organization)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Contact</td>
<td>ContactPoint</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Location</td>
<td>Reference (Location)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>url</td>
<td>url</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Note</td>
<td>Annotation</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Safety</td>
<td>CodeableConcept</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Parent</td>
<td>Reference (Device)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

Extension DMI_MarquageCE :

<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 23%" />
<col style="width: 17%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th rowspan="2">DMI_MarquageCE</th>
<th>organismeNotifie</th>
<th>Reference (Organization)</th>
<th>[0..1]</th>
<th></th>
<th></th>
</tr>
<tr>
<th>libelleAutorisation</th>
<th>String</th>
<th>[1..1]</th>
<th></th>
<th></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

Extension DMI_IPIdLogiciel :

| DMI_IPIdLogiciel | Value | String | \[0..1\] |     |     |
|------------------|-------|--------|----------|-----|-----|

La ressource DeviceDefinition suit le profil DMI_DeviceDefinition dont
le mapping est présenté en annexe 1.10 :

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 23%" />
<col style="width: 17%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="6">DeviceDefinition</td>
<td>DMI_ClasseRisque</td>
<td>Extension</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>DMI_ReferenceDistributeur</td>
<td>Extension</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>DMI_CodeLPP</td>
<td>Extension</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>DMI_CodeEMDN</td>
<td>Extension</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>physicalCharacteristics</td>
<td>ProdCharacteristic</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>physicalCharacteristics</td>
<td>DMI_InternalDiameter</td>
<td>Extension</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

Extension DMI_ClasseRisque

| DMI_ClasseRisque | Value | Code | \[0..1\] |
|------------------|-------|------|----------|

Extension DMI_InternalDiameter

| DMI_InternalDiameter | Value | Quantity | \[0..1\] |
|----------------------|-------|----------|----------|

Extension DMI_ReferenceDistributeur

| DMI_ReferenceDistributeur | Value | Identifier | \[0..1\] |
|---------------------------|-------|------------|----------|

Extension DMI_CodeLPP

| DMI_CodeLPP | Value | Code | \[0..1\] |
|-------------|-------|------|----------|

Extension DMI_CodeEMDN

| DMI_CodeEMDN | Value | Code | \[0..1\] |
|--------------|-------|------|----------|

- Ressources « Practionner » et « PrationnerRole »

Les ressources Practitioner et PractitionerRole représentent
respectivement le professionnel et sa situation  
d’exercice professionnel au sein d’un établissement.

Dans le cadre de l’annuaire national, l’ANS met à disposition un service
de publication au format FHIR. Ce volet utilise les profils
DMI_Practitioner et DMI_PractitionerRole étendant respectivement les
profils
[FrPractitioner](https://simplifier.net/modelisationdesstructuresetdesprofessionnels/practitionerrass)
d’InteropSanté
et[PractitionerRoleProfessionalRoleRASS](https://simplifier.net/modelisationdesstructuresetdesprofessionnels/practitionerroleprofessionalrolerass)
de l’annuaire santé.

Profil DMI_Practitioner étendant le profil FrPractitioner vient modifier
plusieurs attributs de ce dernier :

- Modifier la cardinalité de l’élément « identifier » à \[1..\*\]

- Modifier la cardinalité de l’élément  « Telecom » ) \[1..1\] et
  modifier son binding vers la TRE_R200-CanalCommunication

- Modifier le binding de l’élement « address.type » vers la
  [TRE_R35-TypeVoie](https://mos.esante.gouv.fr/NOS/TRE_R35-TypeVoie/TRE_R35-TypeVoie.pdf)

- Modifier la cardinalité de l’élément « meta » à \[1..1\]

- Ressources « Organization »

La ressource Organization représente un établissement (une entité
géographique et juridique) qui peut être lié à un service de soins. La
ressource Organization représente aussi un fabricant ou un distributeur
de DM.

Pour représenter l’entité juridique, le distributeur et le fabricant on
va utiliser créer un profil DMI_Organization_EJ étendant le profil
FrOrganization. Pour représenter l’organisation interne on vient créer
un profil DMI_OrganizationInterne.

Profil DMI_Organization_EJ étendant le profil FrOrganization vient
modifier plusieurs attributs de ce dernier :

- Slicing de l’élément « Identifier » et passage de sa cardinalité à
  \[1..\*\]

- Ajout des extensions DMI_IdentifiantLocalDistributeur et
  DMI_IdentifiantLocalFabricant

- Extension DMI_IdentifiantLocalDistributeur :

| DMI_IdentifiantLocalDistributeur | Value | Identifier | \[0..\*\] |     |     |
|----------------------------------|-------|------------|-----------|-----|-----|

- Extension DMI_IdentifiantLocalFabricant :

| DMI_IdentifiantLocalFabricant  | Value | Identifier | \[0..\*\] |     |     |
|--------------------------------|-------|------------|-----------|-----|-----|

Profil DMI_OrganizationInterne :

<table style="width:100%;">
<colgroup>
<col style="width: 21%" />
<col style="width: 22%" />
<col style="width: 15%" />
<col style="width: 9%" />
<col style="width: 19%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="7">Organization</td>
<td>DMI_OrganizationLocation</td>
<td>Extension</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Name</td>
<td>String</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Alias</td>
<td>String</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Active</td>
<td>Boolean</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td>cardinalité fixée à [1..*] et Slicing de l’élément et discriminator
fixé sur value : id</td>
<td></td>
</tr>
<tr>
<td>Type : Slice</td>
<td>TypeOrganisationInterne</td>
<td>CodeableConcept</td>
<td>[1..1]</td>
<td>sliceName fixé à « TypeOrganisationInterne »</td>
<td></td>
</tr>
<tr>
<td rowspan="2">TypeOrganisationInterne</td>
<td>id</td>
<td>String</td>
<td>[1..1]</td>
<td>Valeur fixée à « TypeOrganisationInterne »</td>
<td></td>
</tr>
<tr>
<td>Value</td>
<td>CodeableConcept</td>
<td>[1..1]</td>
<td>Coding fixé à TRE_R207- TypeOrganisationInterne</td>
<td></td>
</tr>
<tr>
<td>Type : Slice</td>
<td>CategorieOrganisation</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td>sliceName fixé à « CategorieOrganisation»</td>
<td></td>
</tr>
<tr>
<td rowspan="2">CategorieOrganisation</td>
<td>id</td>
<td>String</td>
<td>[1..1]</td>
<td>Valeur fixée à « CategorieOrganisation »</td>
<td></td>
</tr>
<tr>
<td>Value</td>
<td>CodeableConcept</td>
<td>[1..1]</td>
<td>Coding fixé à TRE_R244- CategorieOrganisation</td>
<td></td>
</tr>
<tr>
<td rowspan="4">Organization</td>
<td>Telecom</td>
<td>ContactPoint</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Address</td>
<td>Address</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Partof</td>
<td>Reference (Organization)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Contact</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

Extension DMI_OrganizationLocation :

| DMI_OrganizationLocation | Value | Reference (Location) | \[0..1\] |     |     |
|--------------------------|-------|----------------------|----------|-----|-----|

- Ressource « SupplyRequest »

  La ressource SupplyRequest permet de représenter l’entête d’une
  commande, d’une demande de dispositifs médicaux et leurs réponses.
  Elle permet d’identifier un besoin ou d’engager une transaction
  commerciale et identifie l’objet de la commande. Ce volet exploite
  plusieurs profils créés dans le cadre de ce volet :

  DMI_SupplyRequestEnteteDemande

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 19%" />
<col style="width: 18%" />
<col style="width: 16%" />
<col style="width: 14%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="17">SupplyRequest</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité contrainte à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Category</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Quantity</td>
<td>Quantity</td>
<td>[1..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>authoredOn</td>
<td>DateTime</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Priority</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Quantity</td>
<td>Quantity</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Parameter</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>deliverTo</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1] et référence fixée à Organization</td>
<td></td>
</tr>
<tr>
<td>Requester</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1] et référence fixée à Practitioner</td>
<td></td>
</tr>
<tr>
<td>Supplier</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>OccurrenceDateTime</td>
<td>Date</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>ItemCodeableConcept</td>
<td>CodeableConcept</td>
<td>[1..1]</td>
<td>valeur fixé à « DEM » pour la création d’une demande et fixée à
« SDM » pour la suppression d’une demande</td>
<td></td>
</tr>
<tr>
<td>ReasonCode</td>
<td>CodeableConcept</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>ReasonReference</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>deliverFrom</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

DMI_SupplyRequestEnteteCommande

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 19%" />
<col style="width: 18%" />
<col style="width: 16%" />
<col style="width: 14%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="17">SupplyRequest</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité contrainte à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Category</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Quantity</td>
<td>Quantity</td>
<td>[1..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>authoredOn</td>
<td>DateTime</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Priority</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Quantity</td>
<td>Quantity</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Parameter</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>deliverTo</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Référence fixée à Organization</td>
<td></td>
</tr>
<tr>
<td>Requester</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Référence fixée à Practitioner</td>
<td></td>
</tr>
<tr>
<td>Supplier</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>OccurrenceDateTime</td>
<td>Date</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>ItemCodeableConcept</td>
<td>CodeableConcept</td>
<td>[1..1]</td>
<td>Valeur fixée à « CDM »</td>
<td></td>
</tr>
<tr>
<td>ReasonCode</td>
<td>CodeableConcept</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>ReasonReference</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>deliverFrom</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

DMI_SupplyRequestEnteteReponse

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 19%" />
<col style="width: 18%" />
<col style="width: 16%" />
<col style="width: 14%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="17">SupplyRequest</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité contrainte à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Category</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Quantity</td>
<td>Quantity</td>
<td>[1..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>authoredOn</td>
<td>DateTime</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Priority</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Quantity</td>
<td>Quantity</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Parameter</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>deliverTo</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Référence fixée à Organization</td>
<td></td>
</tr>
<tr>
<td>Requester</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Référence fixée à Practitioner</td>
<td></td>
</tr>
<tr>
<td>Supplier</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>OccurrenceDateTime</td>
<td>Date</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>ItemCodeableConcept</td>
<td>CodeableConcept</td>
<td>[1..1]</td>
<td>Valeur fixée à « DEM » pour la réponse à la demande et « SDM » pour
la réponse à une suppression</td>
<td></td>
</tr>
<tr>
<td>ReasonCode</td>
<td>CodeableConcept</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>ReasonReference</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>deliverFrom</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

- Ressource « DeviceRequest »

  La ressource DeviceRequest représente la ligne de la demande, de la
  commande et de la réponse à une demande.

  Ce volet exploite plusieurs profils créés dans le cadre de ce volet :

  DMI_DeviceRequest :

<table style="width:100%;">
<colgroup>
<col style="width: 14%" />
<col style="width: 24%" />
<col style="width: 23%" />
<col style="width: 11%" />
<col style="width: 14%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="24">DeviceRequest</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td><a
href="http://hl7.org/fhir/devicerequest-definitions.html#DeviceRequest.instantiatesCanonical">instantiatesCanonical</a></td>
<td><a
href="http://hl7.org/fhir/datatypes.html#canonical">canonical</a>(<a
href="http://hl7.org/fhir/activitydefinition.html">ActivityDefinition</a>
| <a
href="http://hl7.org/fhir/plandefinition.html">PlanDefinition</a>)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td><a
href="http://hl7.org/fhir/devicerequest-definitions.html#DeviceRequest.instantiatesUri">instantiatesUri</a></td>
<td>uri</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>basedOn</td>
<td>Reference (Any)</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1] et référence fixée à SupplyRequest</td>
<td>On utilise la référence pour relier la ligne à l’entête
associée.</td>
</tr>
<tr>
<td>priorRequest</td>
<td>Reference (Any)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>groupIdentifier</td>
<td>Identifier</td>
<td>[0..1]</td>
<td></td>
<td>Represente un identifiant commun à toute les lignes associées à la
même entête</td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Intent</td>
<td>Code</td>
<td>[1..1]</td>
<td>Valeur fixée à « order »</td>
<td></td>
</tr>
<tr>
<td>Priority</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Code.codeCodeableConcept</td>
<td>CodeableaConcept</td>
<td>[1..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Parameter</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Subject</td>
<td>Reference (<a href="http://hl7.org/fhir/patient.html">Patient</a> |
<a href="http://hl7.org/fhir/group.html">Group</a> | <a
href="http://hl7.org/fhir/location.html">Location</a> | <a
href="http://hl7.org/fhir/device.html">Device</a>)</td>
<td>[1..1]</td>
<td>Référence fixée à Device</td>
<td></td>
</tr>
<tr>
<td>Encounter</td>
<td>Reference (Encounter)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Requester</td>
<td>Reference (Device, Practitioner, PractitionerRole,
Organization)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>performerType</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Performer</td>
<td><a
href="http://hl7.org/fhir/references.html#Reference">Reference</a>(<a
href="http://hl7.org/fhir/practitioner.html">Practitioner</a> | <a
href="http://hl7.org/fhir/practitionerrole.html">PractitionerRole</a> |
<a href="http://hl7.org/fhir/organization.html">Organization</a> | <a
href="http://hl7.org/fhir/careteam.html">CareTeam</a> | <a
href="http://hl7.org/fhir/healthcareservice.html">HealthcareService</a>
| <a href="http://hl7.org/fhir/patient.html">Patient</a> | <a
href="http://hl7.org/fhir/device.html">Device</a> | <a
href="http://hl7.org/fhir/relatedperson.html">RelatedPerson</a>)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>OccurrenceDateTime</td>
<td>Date</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>ReasonCode</td>
<td>CodeableConcept</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>ReasonReference</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td><a
href="http://hl7.org/fhir/devicerequest-definitions.html#DeviceRequest.insurance">insurance</a></td>
<td><a
href="http://hl7.org/fhir/references.html#Reference">Reference</a>(<a
href="http://hl7.org/fhir/coverage.html">Coverage</a> | <a
href="http://hl7.org/fhir/claimresponse.html">ClaimResponse</a>)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td><a
href="http://hl7.org/fhir/devicerequest-definitions.html#DeviceRequest.supportingInfo">supportingInfo</a></td>
<td><a
href="http://hl7.org/fhir/references.html#Reference">Reference</a>(<a
href="http://hl7.org/fhir/resourcelist.html">Any</a>)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>note</td>
<td><a
href="http://hl7.org/fhir/datatypes.html#Annotation">Annotation</a></td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>relevantHistory</td>
<td><a
href="http://hl7.org/fhir/references.html#Reference">Reference</a>(<a
href="http://hl7.org/fhir/provenance.html">Provenance</a>)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

- Ressource « SupplyDelivery »

  La ressource SupplyDelivery représente la livraison, le transport, la
  reception, la délivrance, et l’entrée en stock de dispositifs
  médicaux. Ce volet exploite plusieurs profils créés dans le cadre de
  ce volet :

  DMI_SupplyDeliveryTransport 

<table>
<colgroup>
<col style="width: 14%" />
<col style="width: 30%" />
<col style="width: 16%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 14%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="3">SupplyDelivery</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>DMI_Transport</td>
<td>Extension</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td rowspan="3">SupplyDelivery</td>
<td>DMI_ReferenceOrganisationInterne</td>
<td>Extension</td>
<td>[1.1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>basedOn</td>
<td>Reference (SupplyRequest)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>partOf</td>
<td>Reference (SupplyDelivery, Contract)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td rowspan="4">SupplyDelivery</td>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1] dans le flux 5c</td>
<td></td>
</tr>
<tr>
<td>Patient</td>
<td>Reference(Patient)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>SuppliedItem</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td rowspan="2">SuppliedItem</td>
<td>Quantity</td>
<td>Quantity</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>itemReference</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Référence fixée à Device</td>
<td></td>
</tr>
<tr>
<td rowspan="4">SupplyDelivery</td>
<td>OccurenceDateTime</td>
<td>dateTime</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Supplier</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Destination</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Receiver</td>
<td>Reference</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
</tbody>
</table>

Extension DMI_Transport :

<table>
<colgroup>
<col style="width: 26%" />
<col style="width: 26%" />
<col style="width: 14%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr>
<th rowspan="6">DMI_Transport</th>
<th>refTransport</th>
<th>Identifier</th>
<th>[1..1]</th>
<th></th>
<th></th>
</tr>
<tr>
<th>refDelivery</th>
<th>Identifier</th>
<th>[1..1]</th>
<th></th>
<th></th>
</tr>
<tr>
<th>Incident</th>
<th>Code</th>
<th>[0..1]</th>
<th></th>
<th></th>
</tr>
<tr>
<th>detailIncident</th>
<th>String</th>
<th>[0..1]</th>
<th></th>
<th></th>
</tr>
<tr>
<th>Text</th>
<th>String</th>
<th>[0..1]</th>
<th></th>
<th></th>
</tr>
<tr>
<th>Meta</th>
<th>Meta</th>
<th>[1..1]</th>
<th></th>
<th></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | \[1.1\] |     |     |
|----------------------------------|-------|-----------|---------|-----|-----|

DMI_SupplyDeliveryReceptionUnitaire :

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 29%" />
<col style="width: 16%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="9">SupplyDelivery</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>DMI_ReferenceOrganisationInterne</td>
<td>Extension</td>
<td>[1.1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>basedOn</td>
<td>Reference (SupplyRequest)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>partOf</td>
<td>Reference (SupplyDelivery, Contract)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Patient</td>
<td>Reference(Patient)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>SuppliedItem</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td rowspan="2">SuppliedItem</td>
<td>Quantity</td>
<td>Quantity</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>itemReference</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Référence fixée à Device</td>
<td></td>
</tr>
<tr>
<td rowspan="4">SupplyDelivery</td>
<td>OccurenceDateTime</td>
<td>dateTime</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Supplier</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Destination</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Receiver</td>
<td>Reference</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
</tbody>
</table>

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | \[1.1\] |     |     |
|----------------------------------|-------|-----------|---------|-----|-----|

DMI_SupplyDeliveryEntêteReceptionDMI :

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 29%" />
<col style="width: 16%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="13">SupplyDelivery</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>DMI_ReferenceOrganisationInterne</td>
<td>Extension</td>
<td>[1.1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>basedOn</td>
<td>Reference (SupplyRequest)</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td>On utilise la référence pour relier la ligne de livraison à la
commande, la demande associée</td>
</tr>
<tr>
<td>partOf</td>
<td>Reference (SupplyDelivery, Contract)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Patient</td>
<td>Reference(Patient)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>SuppliedItem</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>OccurenceDateTime</td>
<td>dateTime</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Supplier</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Destination</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Receiver</td>
<td>Reference</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
</tbody>
</table>

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | \[1.1\] |     |     |
|----------------------------------|-------|-----------|---------|-----|-----|

DMI_SupplyDeliveryEntêteDelivrance :

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 29%" />
<col style="width: 16%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="13">SupplyDelivery</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>DMI_ReferenceOrganisationInterne</td>
<td>Extension</td>
<td>[1.1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>basedOn</td>
<td>Reference (SupplyRequest)</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td>On utilise la référence pour relier la ligne de livraison à la
commande, la demande associée</td>
</tr>
<tr>
<td>partOf</td>
<td>Reference (SupplyDelivery, Contract)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Patient</td>
<td>Reference(Patient)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>SuppliedItem</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>OccurenceDateTime</td>
<td>dateTime</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Supplier</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Destination</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Receiver</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | \[1.1\] |     |     |
|----------------------------------|-------|-----------|---------|-----|-----|

DMI_SupplyDeliveryEntêteLivraison :

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 29%" />
<col style="width: 16%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="13">SupplyDelivery</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>DMI_ReferenceOrganisationInterne</td>
<td>Extension</td>
<td>[1.1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>basedOn</td>
<td>Reference (SupplyRequest)</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td>On utilise la référence pour relier la ligne de livraison à la
commande, la demande associée</td>
</tr>
<tr>
<td>partOf</td>
<td>Reference (SupplyDelivery, Contract)</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Patient</td>
<td>Reference(Patient)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>SuppliedItem.itemReference</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>OccurenceDateTime</td>
<td>dateTime</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Supplier</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Destination</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Receiver</td>
<td>Reference</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
</tbody>
</table>

ExtensionDMI_ReferenceOrganisationInterne :

| DMI_ReferenceOrganisationInterne | Value | Reference | \[1.1\] |     |     |
|----------------------------------|-------|-----------|---------|-----|-----|

DMI_SupplyDeliveryLigne :

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 29%" />
<col style="width: 16%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="12">SupplyDelivery</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>basedOn</td>
<td>Reference (SupplyRequest)</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td>On utilise la référence pour relier la ligne de livraison à la
commande, la demande associée</td>
</tr>
<tr>
<td>partOf</td>
<td>Reference (SupplyDelivery, Contract)</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td>On utilise la référence pour relier la ligne à l’entête
associée</td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1] dans le cadre du flux 11, 12 et 13</td>
<td></td>
</tr>
<tr>
<td>Patient</td>
<td>Reference(Patient)</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>SuppliedItem</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>OccurenceDateTime</td>
<td>dateTime</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Supplier</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Destination</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Receiver</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

- Ressource « Procedure »

  La ressource Procedure représente l’intervention clinique ou
  chirurgicale implantant un dispositif médical. Cette ressource est
  liée à un professionnel de santé (ressource Practitioner) et au
  patient (ressource Patient). Ce volet exploite le profil
  DMI_Procedure.

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 17%" />
<col style="width: 17%" />
<col style="width: 17%" />
<col style="width: 15%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td>Procedure</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>cardinalité fixée à [1..*] et slicing de l’élément et discriminator
fixé à Value : Type.text</td>
<td></td>
</tr>
<tr>
<td>Procedure</td>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Identifier : Slice</td>
<td>idIntervention</td>
<td>identifier</td>
<td>[1..1]</td>
<td>sliceName fixé à « idIntervention »</td>
<td></td>
</tr>
<tr>
<td rowspan="2">idIntervention</td>
<td>Type.text</td>
<td>String</td>
<td>[0..1]</td>
<td>Valeur fixée à « idIntervention » et cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>value</td>
<td>String</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Identifier : Slice</td>
<td>numSejour</td>
<td>identifier</td>
<td>[0..1]</td>
<td>sliceName fixé à « numSejour »</td>
<td></td>
</tr>
<tr>
<td rowspan="2">numSejour</td>
<td>Type.text</td>
<td>String</td>
<td>[0..1]</td>
<td>Valeur fixée à « numSejour » et cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>value</td>
<td>String</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td rowspan="13">Procedure</td>
<td>instantiatesUri</td>
<td>Uri</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>basedOn</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>partOf</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Status</td>
<td>Code</td>
<td>[1..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>statusReason</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Category</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Code</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Subject</td>
<td>Reference</td>
<td>[1..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Encounter</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>performedDateTime</td>
<td>dateTime</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Recorder</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Asserter</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Performer</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td rowspan="2">Perfomer</td>
<td>Actor</td>
<td>Reference</td>
<td>[1..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>onBehalfOf</td>
<td>Reference</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td rowspan="10">Procedure</td>
<td>Location</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>reasonCode</td>
<td>CodeableConcept</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>reasonReference</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>bodySite</td>
<td>CodeableConcept</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Outcome</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>report</td>
<td>Reference</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Complication</td>
<td>CodeableConcept</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td>On utilise le code pour véhiculer l’information sur la pose conforme
et si la pose est non conforme on vient remplir le l’attribut texte avec
le motif de l’échec</td>
</tr>
<tr>
<td>followUp</td>
<td>CodeableConcept</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Note</td>
<td>Annotation</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>focalDevice</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>FocalDevice</td>
<td>Manipulated</td>
<td>Reference (Device)</td>
<td>[1..1]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

- Ressource « Invoice »

  La ressource Invoice représente la facturation de dispositifs
  médicaux. Ce volet exploite le profil DMI_Invoice.

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 17%" />
<col style="width: 17%" />
<col style="width: 17%" />
<col style="width: 16%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="3">Invoice</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td>Cardinalité fixée à [1..*] et slicing de l’attribut, discriminator
fixé sur value : Type.text</td>
<td></td>
</tr>
<tr>
<td>DMI_Facture</td>
<td>Extension</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Meta</td>
<td>Meta</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Identifier : Slice</td>
<td>refFacture</td>
<td>identifier</td>
<td>[1..1]</td>
<td>sliceName fixé à « refFacture »</td>
<td></td>
</tr>
<tr>
<td rowspan="2">refFacture</td>
<td>Type.text</td>
<td>String</td>
<td>[0..1]</td>
<td>Valeur fixée à « refFacture » et cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>value</td>
<td>String</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Identifier : Slice</td>
<td>refCommande</td>
<td>identifier</td>
<td>[1..1]</td>
<td>sliceName fixé à « refCommande »</td>
<td></td>
</tr>
<tr>
<td rowspan="2">Identifier.slice (refCommande)</td>
<td>Type.text</td>
<td>String</td>
<td>[0..1]</td>
<td>Valeur fixée à « refCommande » et cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>value</td>
<td>String</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td rowspan="14">Invoice</td>
<td>Status</td>
<td>Code</td>
<td>[1..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>CancelledReason</td>
<td>String</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>CodeableConcept</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Subject</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>recipient</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>date</td>
<td>DateTime</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Participant</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Issuer</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Account</td>
<td>Reference</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>lineItem</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>totalNet</td>
<td>Money</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>totalGross</td>
<td>Money</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>paymentTerms</td>
<td>markdown</td>
<td>[0..1]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Note</td>
<td>Annotation</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

Extension DMI_Facture :

| DMI_Facture | Value | Binary | \[0..1\] |     |     |
|-------------|-------|--------|----------|-----|-----|

- Ressource « Binary »

  La ressource Binary est utilisée pour supporter le contenu non
  structuré d’un évènement. Ce volet exploite la ressource FHIR.

Ressources transportant l’objet de l’évènement :

La ressource Bundle est utilisée pour transporter les différents objets
des évènements. Dans le cadre de ce volet 3 profils sont créés :

DMI_BundleRequest :

<table>
<colgroup>
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 12%" />
<col style="width: 8%" />
<col style="width: 40%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="3">Bundle</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>Code</td>
<td>[1..1]</td>
<td>Valeur fixée à « transaction »</td>
<td></td>
</tr>
<tr>
<td>Entry</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td>Slicing de l’attribut sur le profile des ressources</td>
<td></td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:SupplyRequest</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Entry:SupplyRequest</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td style="text-align: left;">Valeur fixée à
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteReponse »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteCommande »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDemande »
et cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:DeviceRequest</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..1]</td>
<td></td>
</tr>
<tr>
<td>Entry:DeviceRequest</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceRequest »
et cardinalité fixée à [1..1]</td>
<td></td>
</tr>
</tbody>
</table>

DMI_BundleDelivery :

<table>
<colgroup>
<col style="width: 13%" />
<col style="width: 13%" />
<col style="width: 12%" />
<col style="width: 8%" />
<col style="width: 41%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="3">Bundle</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>Code</td>
<td>[1..1]</td>
<td>Valeur fixée à « transaction »</td>
<td></td>
</tr>
<tr>
<td>Entry</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td>Slicing de l’attribut sur le profile des ressources</td>
<td></td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:SupplyDelivery</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:SupplyDelivery</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td style="text-align: left;">Valeur fixée à
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryTransport »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteReceptionDMI »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteDelivrance »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliverytEnteteLivraison»,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne »,
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryReceptionUnitaire»
et cardinalité fixée à [1..1]</td>
<td></td>
</tr>
</tbody>
</table>

DMI_BundleTransmissionTraces

<table>
<colgroup>
<col style="width: 13%" />
<col style="width: 15%" />
<col style="width: 11%" />
<col style="width: 8%" />
<col style="width: 38%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th><em><strong>Elements parents</strong></em></th>
<th><em><strong>Nom attributs</strong></em></th>
<th><em><strong>Type</strong></em></th>
<th><em><strong>Cardinalité</strong></em></th>
<th><em><strong>Contraintes</strong></em></th>
<th><em><strong>Description</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="3">Bundle</td>
<td>Identifier</td>
<td>Identifier</td>
<td>[0..*]</td>
<td></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td>Code</td>
<td>[1..1]</td>
<td>Valeur fixée à « transaction »</td>
<td></td>
</tr>
<tr>
<td>Entry</td>
<td>BackboneElement</td>
<td>[0..*]</td>
<td>Slicing de l’attribut sur le profil des ressources</td>
<td></td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:AuditEvent</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [1..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:SupplyDelivery</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_AuditEvent »
et cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil d’AuditEvent</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:SupplyDelivery</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:SupplyDelivery</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td style="text-align: left;">Valeur fixée à
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryTransport »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteReceptionDMI »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteDelivrance »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliverytEnteteLivraison»,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne »,
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryReceptionUnitaire»
et cardinalité fixée à [1..1]</td>
<td>Entrées pour les différents profils de SupplyDelivery</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:SupplyRequest</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:SupplyRequest</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td style="text-align: left;">Valeur fixée à
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteReponse »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteCommande »,
«http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDemande »
et cardinalité fixée à [1..1]</td>
<td>Entrées pour les différents profils de SupplyRequest</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:DeviceRequest</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:DeviceRequest</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceRequest »
et cardinalité fixée à [1..1]</td>
<td>Entrées pour les différents profils de DeviceRequest</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:BundleRequest</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:BundleRequest</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleRequest»
et cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de BundleRequest</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:BundleDelivery</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:BundleDelivery</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleDelivery»
et cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de BundleDelivery</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:Device</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:Device</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Device» et
cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de Device</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:DeviceDefinition</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:DeviceDefinition</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceDefinition»
et cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de DeviceDefinition</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:Patient</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry:Patient</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Patient» et
cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de Patient</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:Professionnel</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry: Professionnel</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Practitioner»
et cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de Practitioner</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:EntiteJuridique</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry: EntiteJuridique</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Organization_EJ»
et cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de Organization (EntiteJuridique)</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:OrganisationInterne</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry: OrganisationInterne</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_OrganizationInterne»
et cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de Organization (OrganisationInterne)</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:Invoice</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry: Invoice</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
« http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Invoice» et
cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de Invoice</td>
</tr>
<tr>
<td>Entry</td>
<td>Entry:Procedure</td>
<td>BackboneElement</td>
<td>[0..1]</td>
<td>Cardinalité fixée à [0..*]</td>
<td></td>
</tr>
<tr>
<td>Entry: Procedure</td>
<td>Resource</td>
<td>Resource</td>
<td>[0..1]</td>
<td>Valeur fixée à
http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Procedure» et
cardinalité fixée à [1..1]</td>
<td>Entrées pour le profil de Procedure</td>
</tr>
</tbody>
</table>

### Construction des flux

La construction des flux se base sur le supplément RESTful ATNA. Cela
consiste en la construction de requêtes et de réponses HTTP de l’API
REST de FHIR.

<img src="media/media/image7.png"
style="width:7.0875in;height:2.74583in" alt="PlantUML diagram" />

Figure 1 : Diagramme de séquence des flux

A noter que si l’implémentation est basée sur le profil ATNA, la
construction des flux consiste en la construction des requêtes ou des
réponses syslog (pour la transmission de trace) et HTTP (pour la
consultation et la recherche de trace).

#### 3.1 Flux de transmission des traces 

Les flux transmettant les informations de traçabilité d’un évènement
sont les suivants :

- Flux 22 – TransmissionTrace 

- Flux 1c - TracabiliteDemande

- Flux 2a - TracabiliteReponse

- Flux 5 - TracabiliteLivraisonValide

- Flux 5a – TracabiliteLivraisonRejet

- Flux 5c – TracabiliteEntreeStockDMI

- Flux 5d – TracabiliteReceptionDMI 

- Flux 5e – TracabiliteRejetDMI 

- Flux 6a – TracabiliteSortieStock 

- Flux 7 – TracabiliteDelivranceSU 

- Flux 9 – TracabiliteTransportDMI 

- Flux 11 – TracabiliteEntreStock 

- Flux 12 – TracabiliteReceptionSU 

- Flux 13a – TracabiliteRefusDMI 

- Flux 14 – TracabiliteEchecPose 

- Flux 15 -TracabilitePose 

- Flux 16a – TracabiliteReassortDMI 

- Flux 18 – TracabiliteFacturationDMI 

- Flux 27 – TracabiliteCommande

- Flux 28 – TracabiliteRejetDMI

- Flux 30 - TracabiliteSortieStockSU

Ils sont construits selon les exigences de la transaction IHE ITI-20[^5]
« Record Audit Event » dans sa version HL7 FHIR où une seule trace est
transmise à la fois : « Send Audit Resource Request Message - FHIR Feed
Interaction ».

Ce flux se base sur l’interaction « create »[^6] de l’API REST de FHIR.
Il s’agit d’une requête HTTP POST dont le corps de la requête est une
ressource Bundle suivant le profil DMI_BundleTransmissionTraces :

<table style="width:100%;">
<colgroup>
<col style="width: 99%" />
</colgroup>
<thead>
<tr>
<th><p>POST [base]/Bundle</p>
<p>Où [base] est le point de contact FHIR défini par le Gestionnaire de
trace.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

Si la transaction a été correctement effectuée et donc que la création
du cercle de soins est correctement effectuée, un code HTTP 200 *ok* est
retourné[^7]. Un Bundle de type transaction-response doit être renvoyé
dans le corps de la réponse[^8]. Ce dernier doit contenir les ressources
telles qu’elles ont été créées par le gestionnaire ou, a minima, les
identifiants logiques des ressources ayant été attribués par le
gestionnaire (dans Bundle.entry.fullUrl et/ou Bundle.entry.resource.id).

Sinon, un code HTTP 500 *Internal Server Error* est retourné avec une
ressource OperationOutcome contenant le détail des erreurs et
avertissements résultant du traitement des entrées du Bundle.

#### 3.2 Flux 23 - RechercheTraces 

Ce flux est utilisé par le consommateur pour faire une recherche de
traces auprès du gestionnaire de traçabilité.

Ce flux est construit selon les exigences de la transaction IHE
ITI-81[^9] « Retrieve ATNA Audit Event » qui se base sur l’interaction
« search »[^10] de l’API REST de FHIR. Il s’agit d’une requête HTTP GET
adressant la ressource auditEvent.

La transaction \[ITI-81\] Retrieve ATNA Audit Event exige que la
recherche de traces soit bornée dans le temps. C’est-à-dire que le
paramètre de recherche « date » qui correspond à la date
d’enregistrement de l’évènement est présent pour préciser une limite de
temps (avant, après ou un intervalle).

La recherche est transmise de la façon suivante :

<table style="width:100%;">
<colgroup>
<col style="width: 99%" />
</colgroup>
<thead>
<tr>
<th><p>GET
[base]/AuditEvent?date=ge[start-time]&amp;date=le[stop-time]&amp;&lt;query&gt;</p>
<p>Où [base] est le point de contact FHIR du gestionnaire de traces,</p>
<p>[start-time] et [stop-time] indique l’intervalle de temps dans lequel
les traces sont recherchées (date se réfère à la date d’enregistrement
de l’évènement).</p>
<p>&lt;query&gt; représente les autres paramètres, sous la forme
param=valeur, permettant d’affiner la recherche (Cf <a
href="#_Flux_23_-">Tableau 13</a>).</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

#### 3.3 Flux 24 : ReponseRechercheTraces 

Ce flux véhicule le résultat de la recherche de traces.

Dans le contexte d’un échange basé sur le standard HL7 FHIR, ce flux est
basé sur les ressources FHIR Bundle, AuditEvent et OperationOutcome (en
cas d’erreur) telles qu’utilisées dans la transaction IHE ITI-81
« Retrieve ATNA Audit Event ».

Conformément au supplément RESTful ATNA du profil IHE ATNA, la réponse
retournée par le Gestionnaire de trace au Consommateur de traces est
composée d’un Bundle de ressources AuditEvent.

La ressource Bundle de type search set constituera alors le corps de la
réponse HTTP 200 ok. Un exemple est donné en annexe :

Pour des informations sur les autres codes HTTP (HTTP status code)
retournés en cas d’échec, consultez la documentation relative à
l’interaction « read » de l’API REST FHIR.

#### 3.4 Flux 25 : ConsulterTrace 

Le Flux 25 « ConsultationTrace » permet au consommateur de demander la
consultation d’une trace dont l’identifiant est connu au gestionnaire de
traçabilité.

Ce flux utilise l’interaction « read »[^11] de l’API REST de HL7 FHIR.
Il s’agit d’une requête HTTP GET adressant la ressource auditEvent.

La première étape de construction de ce flux consiste à récupérer
l’identifiant de la ressource AuditEvent représentant la trace à
consulter.

Cet identifiant est utilisé dans la requête GET suivante :

<table style="width:100%;">
<colgroup>
<col style="width: 99%" />
</colgroup>
<thead>
<tr>
<th><p>GET [base]/AuditEvent/[id]</p>
<p>Où [base] est le point de contact défini par le gestionnaire de
trace et [id] l’identifiant système de la ressource AuditEvent à
consulter.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

#### 3.5 Flux 26 : ReponseConsulterTrace

Le Flux 26 « ReponseConsulterTrace » correspond à la réponse du
Gestionnaire de traçabilité à la demande du Consommateur de consulter
une trace dont il connaît l’identifiant système (Flux 25).

Le flux se compose d’un code HTTP 200 ok et d’un contenu. Le corps de la
réponse HTTP est constituée de la ressource AuditEvent identifiée dans
la demande.

Pour des informations sur les autres codes HTTP (HTTP status code)
retournés en cas d’échec, consultez la documentation relative à
l’interaction « read » de l’API REST FHIR.

### Disposition de sécurité

Les données véhiculées à travers les flux de ce volet générique peuvent
être des données à caractère personnel contenant notamment les noms des
patients et des professionnels.

Cette section présente les éventuelles recommandations de sécurité qui
s’appliquent au volet « Traçabilité des Dispositifs Médicaux Implantable
en Établissement de santé ». Il s’agit d’un sous-ensemble lié à la
dimension interopérabilité de dispositions de sécurité plus globales
visant à couvrir les exigences de sécurité d’un système cible.

Il est du ressort du responsable de traitement du système cible de
mettre en œuvre des dispositions de sécurité adaptées à son analyse de
risques pour le service. En fonction de sa politique de sécurité, il
peut choisir ou pas de mettre en œuvre les dispositions spécifiques
décrites dans cette section. Les référentiels de sécurité édités par
l’ANS fournissent des recommandations sur ce sujet.

#### Authentification et droit d’accès 

Pas de disposition spécifique à ce volet.

#### Confidentialité 

Pas de disposition spécifique à ce volet.

#### Intégrité 

Pas de disposition spécifique à ce volet.

#### Traçabilité 

Pas de disposition spécifique à ce volet.

#### Imputabilité 

Pas de disposition spécifique à ce volet.

#### Disponibilité 

Pas de disposition spécifique à ce volet.

### ANNEXE 1 : RESSOURCES DE CONFORMITE

Des extensions sont définies dans ce volet sur les ressources
SupplyRequest, SupplyDelivery et Invoice :

| Extension | URL | Version |
|----|----|----|
| DMI_Transport | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Transport | 1.0 |
| DMI_Facture | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Facture | 1.0 |
| DMI_ClasseRisque | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_ClasseRisque | 1.0 |
| DMI_CodeLPP | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_CodeLPP | 1.0 |
| DMI_CodeEMDN | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_CodeEMDN | 1.0 |
| DMI_ReferenceDistributeur | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_ReferenceDistributeur | 1.0 |
| DMI_MarquageCE | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_MarquageCE | 1.0 |
| DMI_IdentifiantLocalDistributeur | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_IdentifiantLocalDistributeur | 1.0 |
| DMI_IdentifiantLocalFabricant | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_IdentifiantLocalFabricant | 1.0 |
| DMI_OrganizationLocation | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_OrganizationLocation | 1.0 |
| DMI_InternalDiameter | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_InternalDiameter | 1.0 |
| DMI_ReferenceOrganisationInterne | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_ReferenceOrganisationInterne | 1.0 |

Des paramètres de recherche sont créés pour la ressource Device :

| Paramètre de recherche | URL | Version |
|----|----|----|
| DMI_Device_lotNumber | http://esante.gouv.fr/ci-sis/fhir/SearchParameter/DMI_Device_lotNumber | 1.0 |
| DMI\_ Device_serialNumber | http://esante.gouv.fr/ci-sis/fhir/SearchParameter/DMI\_ Device_serialNumber | 1.0 |
| DMI\_ Device_definition-type | http://esante.gouv.fr/ci-sis/fhir/SearchParameter/DMI\_ Device_definition-type | 1.0 |

Un paramètre de recherche est créé pour la ressource Patient :

| Paramètre de recherche | URL | Version |
|----|----|----|
| DMI_Patient_INS | http://esante.gouv.fr/ci-sis/fhir/SearchParameter/DMI_Patient_INS | 1.0 |

Des profils sont créés :

| Nom du profil | URL | Version |
|----|----|----|
| DMI_Device | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Device | 1.0 |
| DMI_DeviceDefinition | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceDefinition | 1.0 |
| DMI_DeviceRequest | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_DeviceRequest | 1.0 |
| DMI_Organization_EJ | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Organization_EJ | 1.0 |
| DMI_OrganizationInterne | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_OrganizationInterne | 1.0 |
| DMI_Patient | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Patient | 1.0 |
| DMI_Practitioner | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Practitioner | 1.0 |
| DMI_PractitionerRole | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_PractitionerRole | 1.0 |
| DMI_SupplyRequestEnteteDemande | [http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDema](http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyRequestEnteteDema)nde | 1.0 |
| DMI_SupplyRequestEnteteCommande | [http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteComma](http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyRequestEnteteComma)nde | 1.0 |
| DMI_SupplyRequestEnteteReponse | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_SupplyRequestEnteteReponse | 1.0 |
| DMI_SupplyDeliveryTransport | http://esante.gouv.fr*/*ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryTransport | 1.0 |
| DMI_SupplyDeliveryReceptionUnitaire | http://esante.gouv.fr*/*ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryReceptionUnitaire | 1.0 |
| DMI_SupplyDeliveryEnteteReceptionDMI | http://esante.gouv.fr*/*ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteReceptionDMI | 1.0 |
| DMI_SupplyDeliveryEnteteDelivrance | http://esante.gouv.fr*/*ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteDelivrance | 1.0 |
| DMI_SupplyDeliveryEntêteLivraison | [http://esante.gouv.fr*/*ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteLivraison](http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyDeliveryEnteteLivraison) | 1.0 |
| DMI_SupplyDeliveryLigne | [http://esante.gouv.fr*/*ci-sis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne](http://esante.gouv.fr/cisis/fhir/StructureDefinition/DMI_SupplyDeliveryLigne) | 1.0 |
| DMI_Invoice | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Invoice | 1.0 |
| DMI_Procedure | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_Procedure | 1.0 |
| DMI_BundleRequest | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleRequest | 1.0 |
| DMI_BundleDelivery | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleDelivery | 1.0 |
| DMI_BundleTransmissionTraces | http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/DMI_BundleTransmissionTraces | 1.0 |

Création de 3 CapabilityStatement :

| Nom de la CapabilityStatement | URL | Version |
|----|----|----|
| DMI_Consommateur | https://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/DMI_Consommateur | 1.0 |
| DMI_SourceTracabilite | https://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/DMI_SourceTracabilite | 1.0 |
| DMI_GestionnaireTracabilite | https://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/DMI_GestionnaireTracabilite | 1.0 |

Création d’un ImplementationGuide :

| Nom de l’ImplementationGuide | URL | Version |
|----|----|----|
| DMI_ImplementationGuide | http://esante.gouv.fr/ci-sis/fhir/ImplementationGuides/CI-SIS.TracabiliteDMI | 1.0 |

### ANNEXE 2 : GLOSSAIRE

| Sigle / Acronyme | Signification |
|----|----|
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

### ANNEXE 3 : Classes communes aux flux

#### Classe DispositifMedical :

Classe utilisée dans le profil DMI_Device

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 29%" />
<col style="width: 14%" />
<col style="width: 36%" />
</colgroup>
<thead>
<tr>
<th colspan="2">Éléments métier</th>
<th colspan="2">Éléments FHIR</th>
</tr>
</thead>
<tbody>
<tr>
<td>Nom classes</td>
<td>Nom attributs</td>
<td>Ressource</td>
<td>Elément</td>
</tr>
<tr>
<td rowspan="22" style="text-align: left;">DispositifMedical [1..1]</td>
<td style="text-align: left;">Support : [0..1] SupportIUD</td>
<td rowspan="22">Device</td>
<td>L’élément est décrit dans la partie « SupportIUD»</td>
</tr>
<tr>
<td style="text-align: left;">identifiantLocalDM : [0..*]
Identifiant</td>
<td>identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">classeRisque : [0..1] Code</td>
<td><p>definition[0..1].extension.DMI_ClasseRisque [0..1]
BackboneElement</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">marquageCE : [0..1] MarquageCE</td>
<td>L’élément est décrit dans la partie « MarquageCE»</td>
</tr>
<tr>
<td style="text-align: left;">referenceFabricant : [0..1]
Identifiant</td>
<td><p>Definition[0..1].manufacturerReference[0..1] Reference
(Organization)</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">referenceDistributeur : [0..1]
Identifiant</td>
<td><p>Definition[0..1].extension.DMI_ReferenceDistributeur [0..1]
Identifier</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">Modele : [0..1] Texte</td>
<td>modelNumber [0..1]</td>
</tr>
<tr>
<td style="text-align: left;">nomCommercial : [0..1] Texte</td>
<td>definition[0..1].deviceName[0..*].name [1..1] string</td>
</tr>
<tr>
<td style="text-align: left;">codeEMDN : [0..1] Code</td>
<td><p>definition[0..1]. extension.DMI_CodeEMDN [0..1]
BackboneElement</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">Patient [0..1]</td>
<td>Patient [0..1] reference (Patient)</td>
</tr>
<tr>
<td style="text-align: left;">usageUnique : [0..1] Indicateur</td>
<td><p>definition[0..1].property [0..*] BackboneElement<a href="#fn1"
class="footnote-ref" id="fnref1" role="doc-noteref"><sup>1</sup></a></p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">nbReutilisation : [0..1] Integer</td>
<td><p>definition[0..1].property [0..*] BackboneElement</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">emballageSterile : [0..1] Indicateur</td>
<td><p>definition[0..1].property [0..*] BackboneElement</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">sterilisationAvantUtilisation : [0..1]
Indicateur</td>
<td><p>definition[0..1].property [0..*] BackboneElement</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">contientLatex : [0..1] Indicateur</td>
<td><p>definition[0..1].safety [0..*] CodeableConcept</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">CMR1A1B <strong>: [0..1]
Indicateur</strong></td>
<td><p>definition[0..1].safety [0..*] CodeableConcept</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">implantable <strong>: [0..1]
Indicateur</strong></td>
<td><p>definition[0..1].property [0..*] BackboneElement</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">actif : [0..1] Indicateur</td>
<td><p>definition[0..1].property [0..*] BackboneElement</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">irmCompatible : [0..1] Code</td>
<td><p>definition[0..1].safety [0..*] BackboneElement</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">dimensionsCliniques : [0..1] <a
href="file:///Z:/Réalisation/Conseil/ASIP/ANS-006%20Contrat%20cadre%20CI%20SIS%202021/Projets/ANS-006-20_TraçabilitéDMI/Entrants/CI-SIS_ETUDE_METIER_TRACABILITE-DMI_V2.1.docx#_78df6d3c-0e56-4be7-895a-22ec649a6a5f">DimensionsDM</a></td>
<td><p>Definition[0..1].PhysicalCharacteristics[0..1]</p>
<p>(DeviceDefinition)</p></td>
</tr>
<tr>
<td style="text-align: left;">codeLPP : [0..1] Code</td>
<td>definition[0..1].extension.DMI_codeLPP[0..1] Code</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td>meta [0..1] Meta</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>Une demande de modification de l’élément property a été
effectuée auprès de HL7. Elle sera prise en compte dans FHIR R5.<a
href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

#### Classe Support IUD :

Classe utilisée dans le profil DMI_Device

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 29%" />
<col style="width: 14%" />
<col style="width: 36%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
métier</strong></em></th>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
FHIR</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><em><strong>Nom classes</strong></em></td>
<td style="text-align: left;"><em><strong>Nom
attributs</strong></em></td>
<td><em><strong>Ressource</strong></em></td>
<td><em><strong>Elément</strong></em></td>
</tr>
<tr>
<td rowspan="10" style="text-align: left;">SupportIUD [0..1]</td>
<td style="text-align: left;">IUD-ID : [0..1] Identifiant</td>
<td rowspan="10">Device</td>
<td>udiCarrier[0..*].deviceIdentifier [0..1] string</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPNumSerie : [0..1] Identifiant</td>
<td>serialNumber [0..1] string</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPNumLot : [0..1] Identifiant</td>
<td>lotNumber [0..1] string</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPIdLogiciel : [0..1] Identifiant</td>
<td>Extension DMI_IPIdLogicielr [0..1] string</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPDateFabrication : [0..1] Date</td>
<td>manufactureDate [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPDateExpiration : [0..1] Date</td>
<td>expirationDate [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">identifiantIUD_HRF : [0..1] Texte</td>
<td>udiCarrier[0..*].carrierHRF [0..1] string</td>
</tr>
<tr>
<td style="text-align: left;">identifiantIUD_AIDC : [0..1]
ObjetBinaire</td>
<td>udiCarrier[0..*].carrierAIDC [0..1] base64Binary</td>
</tr>
<tr>
<td style="text-align: left;">identifiantIUD_Source : [0..1] Code</td>
<td>udiCarrier[0..*].entryType [0..1] code</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td>meta [0..1] Meta</td>
</tr>
</tbody>
</table>

#### Classe MarquageCE :

Classe utilisée dans le profil DMI_Device

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 29%" />
<col style="width: 14%" />
<col style="width: 36%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
métier</strong></em></th>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
FHIR</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;"><em><strong>Nom
classes</strong></em></td>
<td style="text-align: center;"><em><strong>Nom
attributs</strong></em></td>
<td style="text-align: center;"><em><strong>Ressource</strong></em></td>
<td style="text-align: center;"><em><strong>Elément</strong></em></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">MarquageCE [0..1]</td>
<td style="text-align: left;">organismeNotifie : [0..1] <a
href="file:///Z:/Réalisation/Conseil/ASIP/ANS-006%20Contrat%20cadre%20CI%20SIS%202021/Projets/ANS-006-20_TraçabilitéDMI/Entrants/CI-SIS_ETUDE_METIER_TRACABILITE-DMI_V2.1.docx#_c2857583-85c7-434f-940b-912ab2b2cd36">EntiteJuridique</a></td>
<td rowspan="2" style="text-align: center;">Device</td>
<td style="text-align: center;">Extension :
DMI_MarquageCE.organismeNotifie[0..1] Reference (Organization)</td>
</tr>
<tr>
<td style="text-align: left;">libelleAutorisation : [1..1] Texte</td>
<td style="text-align: center;">Extension :
DMI_marquageCE.libelleAutorisation [1..1] String</td>
</tr>
</tbody>
</table>

#### Classe EntiteJuridique :

Classe utilisée dans le Profil DMI_Organization_EJ étendant le profil
OrganizationRASS

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 25%" />
<col style="width: 13%" />
<col style="width: 41%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
métier</strong></em></th>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
FHIR</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><em><strong>Nom classes</strong></em></td>
<td style="text-align: left;"><em><strong>Nom
attributs</strong></em></td>
<td><em><strong>Nom classes</strong></em></td>
<td><em><strong>Nom attributs</strong></em></td>
</tr>
<tr>
<td rowspan="9" style="text-align: left;">EntiteJuridique [1..1]</td>
<td style="text-align: left;">idNat_Struct : [1..1] Identifiant</td>
<td rowspan="9">Organization</td>
<td rowspan="5">Organization.Identifier[0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">numSiren : [1..1] Identifiant</td>
</tr>
<tr>
<td style="text-align: left;">numFINESS : [0..1] Identifiant</td>
</tr>
<tr>
<td style="text-align: left;">numeroTVAIntracommunautaire : [0..1]
Identifiant</td>
</tr>
<tr>
<td style="text-align: left;">numeroSRN : [0..*] <a href="#fn1"
class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a>Identifiant</td>
</tr>
<tr>
<td style="text-align: left;">raisonSociale : [1..1] Texte</td>
<td>Name [0..1] String</td>
</tr>
<tr>
<td style="text-align: left;">raisonSocialeLongue : [0..1] Texte</td>
<td>Alias [0..*] String</td>
</tr>
<tr>
<td style="text-align: left;">adresseEJ : [0..1] <a
href="file:///Z:/Réalisation/Conseil/ASIP/ANS-006%20Contrat%20cadre%20CI%20SIS%202021/Projets/ANS-006-20_TraçabilitéDMI/Entrants/CI-SIS_ETUDE_METIER_TRACABILITE-DMI_V2.1.docx#_4eaa36c8-4756-4b51-8e05-312dcd3e772b">Adresse</a></td>
<td>Address [0..*]</td>
</tr>
<tr>
<td style="text-align: left;">telecommunication : [0..*] <a
href="file:///Z:/Réalisation/Conseil/ASIP/ANS-006%20Contrat%20cadre%20CI%20SIS%202021/Projets/ANS-006-20_TraçabilitéDMI/Entrants/CI-SIS_ETUDE_METIER_TRACABILITE-DMI_V2.1.docx#_cff4ad64-57f1-42cf-b97e-6f7c54e020ca">Telecommunication</a></td>
<td>telecom [0..*] FrContactPoint</td>
</tr>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>L’attribut numéro SRN ne s’applique pas au
distributeur<a href="#fnref1" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

#### Classe OrganisationInterne : 

Classe utilisée dans le profil DMI_OrganizationInterne

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 25%" />
<col style="width: 13%" />
<col style="width: 41%" />
</colgroup>
<thead>
<tr>
<th rowspan="6" style="text-align: left;">OrganisationInterne</th>
<th style="text-align: left;">identifiantOI : [1..1] Identifiant</th>
<th rowspan="6">Organization</th>
<th>Identifier[[0..*] Identifier</th>
</tr>
<tr>
<th style="text-align: left;">nom : [0..1] Texte</th>
<th>Name[0..1] String</th>
</tr>
<tr>
<th style="text-align: left;">typeOI : [1..1] Code &lt;<a
href="https://mos.esante.gouv.fr/NOS/TRE_R207-TypeOrganisationInterne/TRE_R207-TypeOrganisationInterne.pdf">TRE_R207-TypeOrganisationInterne</a>&gt;</th>
<th>Type[0..*] CodeableConcept (<a
href="https://mos.esante.gouv.fr/NOS/TRE_R207-TypeOrganisationInterne/TRE_R207-TypeOrganisationInterne.pdf">TRE_R207-TypeOrganisationInterne</a>)</th>
</tr>
<tr>
<th style="text-align: left;">categorieOrganisation : [0..1] Code &lt;<a
href="https://mos.esante.gouv.fr/NOS/TRE_R244-CategorieOrganisation/TRE_R244-CategorieOrganisation.pdf">TRE_R244-CategorieOrganisation</a>&gt;</th>
<th>Type­[0..*] CodeableConcept (<a
href="https://mos.esante.gouv.fr/NOS/TRE_R244-CategorieOrganisation/TRE_R244-CategorieOrganisation.pdf">TRE_R244-CategorieOrganisation</a>)</th>
</tr>
<tr>
<th style="text-align: left;">lieu : [0..*] Lieu</th>
<th>Extension : DMI_OrganizationLocation[0..*] Reference (Location)</th>
</tr>
<tr>
<th style="text-align: left;">metadonnee : [1..1] Metadonnee</th>
<th>meta [0..1] Meta</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

#### Classe DimensionDM :

Classe utilisée dans le profil DMI_DeviceDefinition

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 13%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
métier</strong></em></th>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
FHIR</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><em><strong>Nom classes</strong></em></td>
<td style="text-align: left;"><em><strong>Nom
attributs</strong></em></td>
<td><em><strong>Nom classes</strong></em></td>
<td><em><strong>Nom attributs</strong></em></td>
</tr>
<tr>
<td rowspan="6" style="text-align: left;">DimensionsDM [0..1]</td>
<td style="text-align: left;">volume : [0..1] Mesure</td>
<td rowspan="6">DeviceDefinition</td>
<td>physicalCharacteristics [0..1].nominalVolume [0..1] Quantity</td>
</tr>
<tr>
<td style="text-align: left;">longueur : [0..1] Mesure</td>
<td>physicalCharacteristics [0..1].height[0..1] Quantity</td>
</tr>
<tr>
<td style="text-align: left;">calibre : [0..1] Mesure</td>
<td><p>Extension :</p>
<p>physicalCharacteristics.DMI_InternalDiameter[0..1] Quantity</p></td>
</tr>
<tr>
<td style="text-align: left;">diametre : [0..1] Mesure</td>
<td>physicalCharacteristics [0..1].externalDiameter [0..1] Quantity</td>
</tr>
<tr>
<td style="text-align: left;">poids : [0..1] Mesure</td>
<td>physicalCharacteristics [0..1].weight [0..1] Quantity</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td>meta [0..1] Meta</td>
</tr>
</tbody>
</table>

#### Classe fabricant et distributeur : 

Classe utilisée dans le profil DMI_Organization_EJ étendant le profil
OrganizationRASS

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 13%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
métier</strong></em></th>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
FHIR</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><em><strong>Nom classes</strong></em></td>
<td style="text-align: left;"><em><strong>Nom
attributs</strong></em></td>
<td><em><strong>Nom classes</strong></em></td>
<td><em><strong>Nom attributs</strong></em></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Distributeur [0..1]</td>
<td style="text-align: left;">EntiteJuridique [1..1]</td>
<td rowspan="2">Organization</td>
<td>L’élément est décrit dans la partie « EntiteJuridique»</td>
</tr>
<tr>
<td style="text-align: left;">identifiantLocalDistributeur : [0..*]
Identifiant</td>
<td>Extension : DMI_IdentifiantLocalDistributeur [0..*] Identifier</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Fabricant
<mark>[</mark>1..1]</td>
<td style="text-align: left;">EntiteJuridique [1..1]</td>
<td rowspan="2">Organization</td>
<td>L’élément est décrit dans la partie « EntiteJuridique»</td>
</tr>
<tr>
<td style="text-align: left;">identifiantLocalFabricant: [0..*]
Identifiant</td>
<td>Extension : DMI_IdentifiantLocalFabricant [0..*] Identifier</td>
</tr>
</tbody>
</table>

#### Classe patient : 

Classe utilisée dans le profil DMI_Patient étendant le profil FrPatient

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 13%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
métier</strong></em></th>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
FHIR</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><em><strong>Nom classes</strong></em></td>
<td style="text-align: left;"><em><strong>Nom
attributs</strong></em></td>
<td><em><strong>Nom classes</strong></em></td>
<td><em><strong>Nom attributs</strong></em></td>
</tr>
<tr>
<td rowspan="6" style="text-align: left;">Patient</td>
<td style="text-align: left;">identite : [1..1] INS</td>
<td rowspan="6">Patient</td>
<td>Voir partie 7.9</td>
</tr>
<tr>
<td style="text-align: left;">identifiantLocal : [0..1] Identifiant</td>
<td>Identifier [0..*] identifier</td>
</tr>
<tr>
<td style="text-align: left;">personne : [1..1] PersonnePhysique</td>
<td>Voir partie 7.10</td>
</tr>
<tr>
<td style="text-align: left;">adresseCorrespondance : [0..*]
Adresse</td>
<td>Address [0..*] FrContactPoint</td>
</tr>
<tr>
<td style="text-align: left;">telecommunication : [1..*]
Telecommunication</td>
<td>Contact.telecom[1..*] FrContactPoint</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td>Meta[1..1] meta</td>
</tr>
</tbody>
</table>

#### Classe INS : 

Classe utilisée dans le profil DMI_Patient étendant le profil FrPatient

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 13%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
métier</strong></em></th>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
FHIR</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><em><strong>Nom classes</strong></em></td>
<td style="text-align: left;"><em><strong>Nom
attributs</strong></em></td>
<td><em><strong>Nom classes</strong></em></td>
<td><em><strong>Nom attributs</strong></em></td>
</tr>
<tr>
<td rowspan="10" style="text-align: left;">INS</td>
<td style="text-align: left;">matriculeINS : [1..1] <a
href="https://mos.esante.gouv.fr/14.html#_b3e8d18a-99e9-4a18-bef7-cb2444650c8a">Identifiant</a></td>
<td rowspan="10">Patient</td>
<td><p>Identier [0..*] identifier.value</p>
<p>Identifier. [0..*] identifier.system</p></td>
</tr>
<tr>
<td style="text-align: left;">nomFamille : [1..1] <a
href="https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21">Texte</a></td>
<td><p>Name [0..*].family HumanName</p>
<p>Avec Name.use = official</p></td>
</tr>
<tr>
<td style="text-align: left;">prenomActeNaissance : [1..1] <a
href="https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21">Texte</a></td>
<td><p>Name [0..*].text HumanName</p>
<p>Avec Name.use = official</p></td>
</tr>
<tr>
<td style="text-align: left;">premierPrenomActeNaissance : [1..1] <a
href="https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21">Texte</a></td>
<td><p>Name [0..*].given HumanName</p>
<p>Avec Name.use = official</p></td>
</tr>
<tr>
<td style="text-align: left;">nomUtilise : [1..1] <a
href="https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21">Texte</a></td>
<td><p>Name [0..*].family HumanName</p>
<p>Avec Name.use = usual</p></td>
</tr>
<tr>
<td style="text-align: left;">prenomUtilise : [1..1] <a
href="https://mos.esante.gouv.fr/14.html#_706f8e2f-2997-45b4-84c2-3b1e4e287e21">Texte</a></td>
<td><p>Name [0..*].given HumanName</p>
<p>Avec Name.use = usual</p></td>
</tr>
<tr>
<td style="text-align: left;">sexe : [1..1] <a
href="https://mos.esante.gouv.fr/14.html#_b1f1f204-62aa-4fde-80ce-b208fe6a73f5">Code</a></td>
<td>Gender [0..*] code</td>
</tr>
<tr>
<td style="text-align: left;">dateNaissance : [1..1] <a
href="https://mos.esante.gouv.fr/14.html#_6b5f1df4-9624-4e39-b260-2907885a60a3">DateHeure</a></td>
<td>birthDate [0..*] date</td>
</tr>
<tr>
<td style="text-align: left;">lieuNaissance : [1..1] Address</td>
<td>Extension [1..1]  :
http://hl7.org/fhir/StructureDefinition/patient-birthPlace</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [0..1] <a
href="https://mos.esante.gouv.fr/13.html#_48f184fe-b2a3-4d25-8dad-d7b07c660857">Metadonnee</a></td>
<td>Meta [0..1] meta</td>
</tr>
</tbody>
</table>

#### Classe personne physique : 

Classe utilisée dans le profil DMI_Patient ainsi que dans le profil
DMI_Practitioner

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 21%" />
<col style="width: 32%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
métier</strong></em></th>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
FHIR</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><em><strong>Nom classes</strong></em></td>
<td style="text-align: left;"><em><strong>Nom
attributs</strong></em></td>
<td><em><strong>Nom classes</strong></em></td>
<td><em><strong>Nom attributs</strong></em></td>
</tr>
<tr>
<td rowspan="5" style="text-align: left;">PersonnePhysique</td>
<td style="text-align: left;">nomFamille : [0..1] Texte</td>
<td rowspan="5">Patient/Practitioner</td>
<td><p>Name [1..1].family HumanName</p>
<p>Avec Name.use = official</p></td>
</tr>
<tr>
<td style="text-align: left;">prenom : [0..1] Texte</td>
<td><p>Name [1..1].given HumanName</p>
<p>Avec Name.use = usual</p></td>
</tr>
<tr>
<td style="text-align: left;">sexe : [0..1] Code</td>
<td>Gender [1..1] code</td>
</tr>
<tr>
<td style="text-align: left;">dateNaissance : [0..1] Date</td>
<td>birthDate [1..1] date</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1]</td>
<td>Meta[1..1] meta</td>
</tr>
</tbody>
</table>

#### Classe Professionnel : 

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 26%" />
<col style="width: 13%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
métier</strong></em></th>
<th colspan="2" style="text-align: center;"><em><strong>Éléments
FHIR</strong></em></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><em><strong>Nom classes</strong></em></td>
<td style="text-align: left;"><em><strong>Nom
attributs</strong></em></td>
<td><em><strong>Nom classes</strong></em></td>
<td><em><strong>Nom attributs</strong></em></td>
</tr>
<tr>
<td rowspan="6" style="text-align: left;">Practitioner</td>
<td style="text-align: left;">idNat_PS : [1..1] Identifiant</td>
<td rowspan="6">Practitioner</td>
<td>Identifier [1..1].Identifier</td>
</tr>
<tr>
<td style="text-align: left;">idPP : [1..1] Identifiant</td>
<td>Identifier [1..1].Identifier</td>
</tr>
<tr>
<td style="text-align: left;">personne : [0..1] PersonnePhysique</td>
<td>Voir partie 1.14</td>
</tr>
<tr>
<td style="text-align: left;">adresseCorrespondance : [0..*]
Adresse</td>
<td>Address [0..*] FrAddress</td>
</tr>
<tr>
<td style="text-align: left;">telecommunication : [1..*]
Telecommunication</td>
<td>Telecom [1..*] FrContactPoint</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td>Meta[1..1] meta</td>
</tr>
</tbody>
</table>

[^1]: https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf

[^2]: http://dicom.nema.org/dicom/2013/output/chtml/part15/sect_A.5.html

[^3]: <https://esante.gouv.fr/securite/politique-generale-de-securite-des-systemes-d-information-de-sante>

[^4]: <http://esante.gouv.fr/services/referentiels/ci-sis/espace-publication/couche-transport>

[^5]: <https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf>
    section 3.20

[^6]: <https://www.hl7.org/fhir/http.html#create>

[^7]: https://www.hl7.org/fhir/http.html#trules

[^8]: https://www.hl7.org/fhir/http.html#transaction-response

[^9]: <https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf>
    Section 3.81

[^10]: <https://www.hl7.org/fhir/http.html#search>

[^11]: <https://www.hl7.org/fhir/http.html#read>
