### Flux 22 : TransmissionTrace

Ce flux permet à la source de traçabilité de transmettre les informations de traçabilité du DMI pour un évènement au gestionnaire de traçabilité.

Il correspond au « Flux 1 -TransmissionTrace » du volet « Traçabilité des événements » avec la ressource profilée TDE_AuditEvent :

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
<td style="text-align: center;"><p>source[1..1].observer[1..1]. identifier [0..*] Identifier</p>
<p>Reference (PractitionerRole|Practitioner| Organization|Device|Patient|RelatedPerson)</p></td>
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
<p>Reference (PractitionerRole|Practitioner|Organization| Device|Patient|RelatedPerson)</p></td>
</tr>
<tr>
<td style="text-align: left;">role [1..1] Code</td>
<td style="text-align: left;">agent[1..2].role [0..*] CodeableConcept</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;">contenu [0..1] ObjetBinaire</td>
<td style="text-align: center;"><p>entity[0..*].what [0..1] reference “Any”</p>
<p>ou entity[0..*].detail [0..*] BackBoneElement</p></td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux 22</p>

Le contenu de l’évènement (ObjetEvenement) varie en fonction du cas d’utilisation. Il sera détaillé dans les flux suivants.

Le contenu peut être structuré et ainsi transporter les classes des objets métiers. Le contenu peut aussi être non-structuré et ainsi transporter les informations métiers encodés en binaire.

Si possible il faut privilégier l’utilisation d’un contenu structuré.

### Flux 1c – TracabiliteDemande

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

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
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
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
<td style="text-align: left;"><strong>Contenu [0..1]</strong> ObjetBinaire (Le contenu de l’ObjetEvenement est une demande. Cet élément est décrit dans une partie spécifique « Demande »)</td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference (Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Demande [1..1]</td>
<td style="text-align: left;">EntêteDemande [1..1]</td>
<td rowspan="2" style="text-align: center;">Bundle (Suit le profil DMI_BundleRequest)</td>
<td rowspan="2" style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">LigneDemande [1..*]</td>
</tr>
<tr>
<td rowspan="10" style="text-align: left;">EntêteDemande [1..1]</td>
<td style="text-align: left;">reference : [1..1] Identifiant</td>
<td rowspan="10" style="text-align: center;">SupplyRequest (Suit le profil DMI_SupplyRequestEnteteDemande)</td>
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
<td style="text-align: center;"><p>Item [1..1].itemCodeableConcept CodeableConcept</p>
<p>TRE_R254-TypeEvenement</p></td>
</tr>
<tr>
<td style="text-align: left;">metadonnee [1..1] : Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">Professionnel [1..1]</td>
<td style="text-align: center;">Requester[0..1] Reference(Practitioner)</td>
</tr>
<tr>
<td style="text-align: left;">OrganisationInterne [1..1]</td>
<td style="text-align: center;">deliverTo[0..1]Reference (Organization)</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">LigneDemande [1..*]</td>
<td style="text-align: left;">IdLigneAssocieeEntete [0..1]</td>
<td rowspan="7" style="text-align: center;">DeviceRequest (Pour chaque occurrence de l’élément LigneDemande on va créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest)</td>
<td style="text-align: center;">groupIdentifier [0..1] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">EnteteDemandeAssociee [1..1]</td>
<td style="text-align: left;">basedOn [0..1] Reference (SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">DispositifMedical [1..1]</td>
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
<td style="text-align: center;"><p>code [1..1].codeCodeableConcept.text</p>
<p>String</p></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu [0..1] :</strong> ObjetBinaire Le contenu de l’ObjetEvenement est le contenu non structuré de la demande</td>
<td style="text-align: left;">entity[0..*].detail [0..1].valueBase64Binary [1..1] base64Binary </td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux 1c</p>

### Flux 2a - TracabilitéReponse

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

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
href="#flux-22-transmissiontrace">Tableau FLux 22</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau FLux 22</a></td>
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
<td style="text-align: left;">Contenu [0..1] (Le contenu de l’ObjetEvenement est une « Reponse ». Cet élément est décrit dans une partie spécifique « Reponse »)</td>
<td style="text-align: left;">entity[0..*].what [0..1] Reference
(Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Reponse [1..1]</td>
<td style="text-align: left;">EntêteReponse [1..1]</td>
<td rowspan="2" style="text-align: left;">Bundle (Suit le profil DMI_BundleRequest)</td>
<td rowspan="2" style="text-align: left;">Entry [0..*]
BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">DetailReponse [1..*]</td>
</tr>
<tr>
<td rowspan="6" style="text-align: left;">EntêteReponse [1..1]</td>
<td style="text-align: left;">reference : [1..1] Identifiant</td>
<td rowspan="6" style="text-align: left;">SupplyRequest (Suit le profil DMI_SupplyRequestEnteteReponse)</td>
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
<td rowspan="7" style="text-align: center;">DeviceRequest (Pour chaque occurrence de l’élément DetailReponse on va créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest)</td>
<td style="text-align: left;">groupIdentifier [0..1] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">EntêteReponseAssociee [0..1]</td>
<td style="text-align: left;">basedOn [0..1] Reference (SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">NomDispostifDemande [1..1]</td>
<td style="text-align: left;"><p>code [1..1].codeCodeableConcept.text</p>
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
<td style="text-align: left;">DispositifMedical [1..1]</td>
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
<td style="text-align: left;"><strong>Contenu : [0..1] ObjetBinaire</strong> (Le contenu de l’ObjetEvenement est le contenu non structuré de la « Reponse »)</td>
<td style="text-align: left;">entity[0..*].detail [0..1]. valueBase64Binary  [1..1] base64Binary </td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux
2a</p>

### Flux 27 – TracabiliteCommande

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace », précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement, ObjetEvenement.

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
href="#flux-22-transmissiontrace">Tableau FLux 22</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
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
<td style="text-align: left;">Contenu : [0..1] ObjetBinaire (Le contenu de l’ObjetEvenement est une commande. Cet élément est décrit dans une partie spécifique « Commande »)</td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference (Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Commande [1..1]</td>
<td style="text-align: left;">EntêteCommande [1..1]</td>
<td rowspan="2" style="text-align: center;">Bundle (Suit le profil DMI_BundleRequest)</td>
<td rowspan="2" style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">Ligne [1..*]</td>
</tr>
<tr>
<td rowspan="8" style="text-align: left;">EntêteCommande [1..1]</td>
<td style="text-align: left;">refCommande : [1..1] Identifiant</td>
<td rowspan="8" style="text-align: center;">SupplyRequest (Suit le profil DMI_SupplyRequestEnteteCommande)</td>
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
<td style="text-align: center;"><p>Item [1..1].itemCodeableConcept CodeableConcept</p>
<p>TRE_R254-TypeEvenement</p></td>
</tr>
<tr>
<td style="text-align: left;">metadonnee [1..1] : Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">OrganisationInterne [0..1] </td>
<td style="text-align: center;">deliverTo[0..1] Reference(Organization)</td>
</tr>
<tr>
<td style="text-align: left;">Professionnel [0..1]></td>
<td style="text-align: center;">Requester[0..1] Reference(Practitioner)</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">LigneCommande [1..*]</td>
<td style="text-align: left;">IdLigneAssocieeEnteteCommande [0..1]</td>
<td rowspan="7" style="text-align: center;">DeviceRequest (Pour chaque occurrence de l’élément LigneCommande on va créer une ressource DeviceRequest suivant le profil DMI_DeviceRequest)</td>
<td style="text-align: center;">groupIdentifier [0..1] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">EnteteCommandeAssociee [1..1]</td>
<td style="text-align: center;">basedOn [0..1] Reference (SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">DispositifMedical [1..1]</td>
<td style="text-align: center;">Subject [1..1] Reference (<a
href="http://hl7.org/fhir/patient.html">Patient</a> | <a
href="http://hl7.org/fhir/group.html">Group</a> | <a
href="http://hl7.org/fhir/location.html">Location</a> | <a
href="http://hl7.org/fhir/device.html">Device</a>)</td>
</tr>
<tr>
<td style="text-align: left;">TypeLigneCommande [1..1]</td>
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
<td style="text-align: center;">code[1..1].codeReference Reference(Device)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Contenu [0..1]:</strong> ObjetBinaire (Le contenu de l’ObjetEvenement est le contenu non structuré de la commande)</td>
<td style="text-align: left;">entity[0..*].detail [0..1]. valueBase64Binary [1..1] base64Binary</td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux
27</p>

### Flux 5 – TracabiliteLivraisonValide

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

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
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
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
<td style="text-align: left;"><strong>Contenu : [0..1] Objet binaire</strong> (Le contenu de l’ObjetEvenement est une livraison. Cet élément est décrit dans une partie spécifique « Livraison »)</td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference (Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Livraison [1..1]</td>
<td style="text-align: left;">EnteteLivraison [1..1]</td>
<td rowspan="2" style="text-align: left;">Bundle (Suit le profil DMI_BundleDelivery)</td>
<td rowspan="2" style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">LigneLivraison [1..*]</td>
</tr>
<tr>
<td rowspan="8" style="text-align: left;">EnteteLivraison [1..1]</td>
<td style="text-align: left;">referenceCommande : [1..1] Identifiant</td>
<td rowspan="8" style="text-align: left;">SupplyDelivery (Suit le profil DMI_SupplyDeliveryEntêteLivraison)</td>
<td style="text-align: center;">basedOn [0..*] Reference (SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">quantiteTotale : [0..1] Numerique</td>
<td style="text-align: center;">suppliedItem[0..1].quantity [0..1] SimpleQuantity</td>
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
<td style="text-align: left;">Professionnel [1..1]</td>
<td style="text-align: center;"><p>Receiver [0..*] Reference</p>
<p>(Practitioner | PractitionerRole)</p></td>
</tr>
<tr>
<td style="text-align: left;"><strong>OrganisationInterne [1..1]</strong></td>
<td style="text-align: center;"><em>Extension : DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)</em></td>
</tr>
<tr>
<td rowspan="6" style="text-align: left;">LigneLivraison [1..*]</td>
<td style="text-align: left;">ReferenceCommandeAssociee [1..1]</td>
<td rowspan="6" style="text-align: center;">SupplyDelivery (Pour chaque occurrence de l’élément LigneLivraison on va créer une ressource SupplyDelivery suivant le profil DMI_SupplyDeliveryLigne)</td>
<td style="text-align: center;">basedOn[0..*] Reference (SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">ReferenceEntêteLivraison [1..1]</td>
<td style="text-align: center;">Part of [0..*] Reference (SupplyDelivery)</td>
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
<td style="text-align: left;">DispositifMedical [1..*]</td>
<td style="text-align: center;"><p>suppliedItem[0..1].itemReference [0..1] Reference</p>
<p>(Medication | Substance | Device)</p></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;">Contenu : Objet binaire [0..1] (Le contenu de l’ObjetEvenement est le contenu non structuré de la « Livraison »)</td>
<td style="text-align: left;">entity[0..*].detail [0..1]. valuebase64Binary </td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux
5</p>

### Flux 5a - TracabiliteLivraisonRejet 

Ce flux reprend les mêmes éléments que le flux 5

### Flux 5c – TracabiliteEntreeStockDMI 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

<table>
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
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
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
<td style="text-align: left;"><strong>Contenu : [0..1]ObjetBinaire</strong> (Le contenu de l’ObjetEvenement est l’ensemble des éléments Cet élément est décrit dans une partie spécifique « ReceptionUnitaire »)</td>
<td style="text-align: left;">entity[0..*].what [0..1] Reference (SupplyDelivery)</td>
</tr>
<tr>
<td rowspan="4" style="text-align: left;">ReceptionUnitaire [1..1]</td>
<td style="text-align: left;">StatutReception [1..1]</td>
<td rowspan="7" style="text-align: center;">SupplyDelivery (Suit le profil DMI_SupplyDeliveryReceptionUnitaire)</td>
<td style="text-align: left;">Cet élément est décrit dans une partie spécifique « StatutReception ».</td>
</tr>
<tr>
<td style="text-align: left;">Professionnel [1..1]</td>
<td style="text-align: center;"><p>Receiver [0..*] Reference</p>
<p>(Practitioner | PractitionerRole)</p></td>
</tr>
<tr>
<td style="text-align: left;">OrganisationInterne [1..1]</td>
<td style="text-align: left;"><em>Extension : DMI_ReferenceOrganisationInterne[1..1] Reference
(Organization)</em></td>
</tr>
<tr>
<td style="text-align: left;">DispositifMedical [1..1]</td>
<td style="text-align: center;"><p>suppliedItem[0..1].itemReference [0..1] Reference</p>
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
<td style="text-align: left;">Contenu: [0..1] ObjetBinaire (Le contenu de l’ObjetEvenement est le contenu non structuré de la « ReceptionUnitaire »)</td>
<td style="text-align: left;">entity[0..*].detail [0..1]. valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux 5c</p>

### Flux 5d – TracabiliteReceptionDMI

Ce flux reprend les mêmes éléments que le flux 5c.

### Flux 5e – TracabiliteRejetDMI  

Ce flux reprend les mêmes éléments que le flux 5c.

### Flux 6a – TracabiliteSortieStock 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

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
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
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
<td style="text-align: left;"><strong>Contenu : [0..1] ObjetBinaire</strong> (Le contenu de l’ObjetEvenement est une délivrance. Cet élément est décrit dans une partie spécifique « Delivrance »)</td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference (Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">Délivrance [1..1]</td>
<td style="text-align: left;">EntêteDelivrance [1..1]</td>
<td rowspan="2" style="text-align: left;">Bundle (Suit le profil DMI_BundleDelivery)</td>
<td style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">LigneDelivrance [1..*]</td>
<td style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">EntêteDelivrance [1..1]</td>
<td style="text-align: left;">referenceDelivrance : [1..1] Identifiant</td>
<td rowspan="7" style="text-align: left;">SupplyDelivery (Suit le profil DMI_SupplyDeliveryEnteteDelivrance)</td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">dateDelivrance : [0..1] Date</td>
<td style="text-align: center;">occurrenceDateTime [0..1] dateTime</td>
</tr>
<tr>
<td style="text-align: left;">quantiteDelivree : [0..1] Numerique</td>
<td style="text-align: center;">suppliedItem[0..1].quantity [0..1] SimpleQuantity</td>
</tr>
<tr>
<td style="text-align: left;">informationComplementaire : [0..1] Texte</td>
<td style="text-align: center;">text [0..1] Narrative</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee [1..1] : Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">OrganisationInterne [1..1]</td>
<td style="text-align: center;">Extension : DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)</td>
</tr>
<tr>
<td style="text-align: left;">LigneDelivrance [1..*]</td>
<td style="text-align: center;">Cet élément est décrit dans une partie spécifique « LigneDelivrance ».</td>
</tr>
<tr>
<td rowspan="5" style="text-align: left;">LigneDelivrance [1..*]</td>
<td style="text-align: left;">ReferenceDemandeAssociee [1..1]</td>
<td rowspan="5" style="text-align: center;">SupplyDelivery (Pour chaque occurrence de l’élément LigneDelivrance on va créer une ressource SupplyDelivery suivant le profil DMI_SupplyDeliveryLigne)</td>
<td style="text-align: center;">basedOn[0..*] Reference (SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">ReferenceEntêteDelivrance [1..1]</td>
<td style="text-align: center;">Part of [0..*] Reference(SupplyDelivery)</td>
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
<td style="text-align: left;">DispositifMedical [1..1]</td>
<td style="text-align: center;"><p>suppliedItem[0..1].itemReference [0..1] Reference</p>
<p>(Medication | Substance | Device)</p></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;">Contenu : [0..1]ObjetBinaire (Le contenu de l’ObjetEvenement est le contenu non structuré de la délivrance)</td>
<td style="text-align: left;">entity[0..*].detail [0..1]. valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux
6a</p>

### Flux 7 – TracabiliteDelivranceSU 

Ce flux reprend les mêmes éléments que le flux 6a.

### Flux 9 – TracabiliteTransportDMI 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

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
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
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
<td style="text-align: left;">Contenu : [0..1]ObjetBinaire (Le contenu de l’ObjetEvenement est un transport. Cet élément est décrit dans une partie spécifique « Transport »)</td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference (SupplyDelivery)</td>
</tr>
<tr>
<td rowspan="9" style="text-align: left;">Transport [1..1]</td>
<td style="text-align: left;">referenceTransport : [1..1] Identifiant</td>
<td rowspan="9" style="text-align: center;">SupplyDelivery (Suit le profil DMI_SupplyDeliveryTransport)</td>
<td style="text-align: center;"><em>Extension(Complex) : DMI_transport[0..1].refTransport [1..1] Identifier</em></td>
</tr>
<tr>
<td style="text-align: left;">referenceDelivrance : [1..1] Identifiant</td>
<td style="text-align: center;"><em>Extension(Complex) : DMI_transport[0..1].refDelivery [1..1] Identifier</em></td>
</tr>
<tr>
<td style="text-align: left;">dateDelivrance : [0..1] Date</td>
<td style="text-align: center;">occurence [0..1].occurenceDateTime dateTime</td>
</tr>
<tr>
<td style="text-align: left;">quantiteTransportee : [0..1] Numerique</td>
<td style="text-align: center;">suppliedItem [0..1].quantity SimpleQuantity</td>
</tr>
<tr>
<td style="text-align: left;">IncidentTransport : [0..1] boolean</td>
<td style="text-align: center;"><em>Extension(Complex) : DMI_transport[0..1].incident [0..1] code</em></td>
</tr>
<tr>
<td style="text-align: left;">detailIncident : [0..1] Texte</td>
<td style="text-align: center;"><em>Extension(Complex) : DMI_transport[0..1].detailIncident [0..1] string</em></td>
</tr>
<tr>
<td style="text-align: left;">informationComplementaire : [0..1] Texte</td>
<td style="text-align: center;"><em>Extension(Complex) : DMI_transport[0..1].text [0..1] string</em></td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: center;"><em>Extension(Complex) : DMI_transport[0..1].meta [1..1] Meta</em></td>
</tr>
<tr>
<td style="text-align: left;">Professionnel [1..1]</td>
<td style="text-align: center;">Receiver [0..*] Reference (Practitionner, PractitionnerRole)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;">Contenu [0..1] : Objet binaire (Le contenu de l’ObjetEvenement est le contenu non structuré du transport)</td>
<td style="text-align: left;">entity[0..*].detail [0..1]. valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux
9</p>

### Flux 11 – TracabiliteEntreStock 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

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
href="#flux-22-transmissiontrace">Tableau FLux 22</a></td>
<td colspan="2" rowspan="4" style="text-align: center;">Cf <a
href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
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
<td style="text-align: left;">Contenu : [0..1] Objet binaire (Le contenu de l’ObjetEvenement est la réception du DMI. Cet élément est décrit dans une partie spécifique « ReceptionDMI »)</td>
<td style="text-align: center;">entity[0..*].what [0..1] Reference (Bundle)</td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ReceptionDMI [1..1]</td>
<td style="text-align: left;">EntêteReceptionDMI [1..1]</td>
<td rowspan="2" style="text-align: center;">Bundle (Suit le profil DMI_BundleDelivery)</td>
<td style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td style="text-align: left;">LigneReceptionDMI [1..*]</td>
<td style="text-align: center;">Entry [0..*] BackboneElement</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">EntêteReceptionDMI [1..1]</td>
<td style="text-align: left;">referenceReception : [1..1] Identifiant</td>
<td rowspan="7" style="text-align: center;">SupplyDelivery (Suit le profil DMI_SupplyDeliveryEntêteReceptionDMI)</td>
<td style="text-align: center;">identifier [0..*] Identifier</td>
</tr>
<tr>
<td style="text-align: left;">referenceDelivrance : [1..1] Identifiant</td>
<td style="text-align: center;">basedOn [0..1] Reference (SupplyDelivery)</td>
</tr>
<tr>
<td style="text-align: left;">quantiteReceptionnee : [0..1] Numerique</td>
<td style="text-align: center;">suppliedItem[0..1].quantity [0..1] SimpleQuantity</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: center;">meta [0..1] Meta</td>
</tr>
<tr>
<td style="text-align: left;">OrganisationInterne [1..1]</td>
<td style="text-align: center;"><em>Extension : DMI_ReferenceOrganisationInterne[1..1]Reference (Organization)</em></td>
</tr>
<tr>
<td style="text-align: left;">Professionnel [1..1]</td>
<td style="text-align: center;"><p>receiver [0..*] Reference</p>
<p>(Practitioner | PractitionerRole)</p></td>
</tr>
<tr>
<td style="text-align: left;">LigneReceptionDMI [1.*]</td>
<td style="text-align: center;">Cet élément est décrit dans une partie spécifique “LigneReceptionDMI”</td>
</tr>
<tr>
<td rowspan="7" style="text-align: left;">LigneReceptionDMI [1..*]</td>
<td style="text-align: left;">ReferenceDemandeAssociee [1..1]</td>
<td rowspan="7" style="text-align: center;">SupplyDelivery (Pour chaque occurrence de l’élément LigneReceptionDMI on va créer une ressource SupplyDelivery suivant le profil DMI_SupplyDeliveryLigne)</td>
<td style="text-align: center;">basedOn[0..*] Reference (SupplyRequest)</td>
</tr>
<tr>
<td style="text-align: left;">ReferenceEntêteReceptionDMI [1..1]</td>
<td style="text-align: center;">Part of [0..*] Reference(SupplyDelivery)</td>
</tr>
<tr>
<td style="text-align: left;">dateReceptionSU [1..1] DateHeure</td>
<td style="text-align: center;">Occurrence [0..1].occurenceDateTime dateTime</td>
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
<td style="text-align: left;">DispositifMedical [1..1]</td>
<td style="text-align: center;"><p>suppliedItem[0..1].itemReference [0..1] Reference</p>
<p>(Medication | Substance | Device)</p></td>
</tr>
<tr>
<td rowspan="2" style="text-align: left;">ObjetEvenement [0..*]</td>
<td style="text-align: left;">type [0..1] Code</td>
<td rowspan="2" style="text-align: center;">AuditEvent</td>
<td style="text-align: center;">entity[0..*].type [0..1] Coding</td>
</tr>
<tr>
<td style="text-align: left;">Contenu[0..1] Objet binaire (Le contenu de l’ObjetEvenement est le contenu non structuré de la réception)</td>
<td style="text-align: left;">entity[0..*].detail [0..1]. valueBase64Binary [1..1]</td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du
flux 11</p>

### Flux 12 – TracabiliteReceptionSU 

Ce flux reprend les mêmes éléments que le flux 11.

### Flux 28- TracabiliteRejetDMI

Ce flux reprend les mêmes éléments que le flux 11.

### Flux 15 -TracabilitePose

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

<table class="grid">
  <thead>
    <tr>
      <th colspan="2">Éléments métier</th>
      <th colspan="2">Éléments FHIR</th>
    </tr>
    <tr>
      <th>Nom classes</th>
      <th>Nom attributs</th>
      <th>Ressource</th>
      <th>Élément</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Trace [1..1]</td>
      <td>Cf <a href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
      <td>Cf <a href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
      <td>Cf <a href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
    </tr>
    <tr>
      <td>SourceTrace [1..1]</td>
      <td>Cf Tableau Flux 22</td>
      <td>Cf Tableau Flux 22</td>
      <td>Cf Tableau Flux 22</td>
    </tr>
    <tr>
      <td>Événement [1..1]</td>
      <td>Cf Tableau Flux 22</td>
      <td>Cf Tableau Flux 22</td>
      <td>Cf Tableau Flux 22</td>
    </tr>
    <tr>
      <td>ActeurEvenement [0..2]</td>
      <td>Cf Tableau Flux 22</td>
      <td>Cf Tableau Flux 22</td>
      <td>Cf Tableau Flux 22</td>
    </tr>
    <tr>
      <td>ObjetEvenement [0..*]</td>
      <td>type [0..1] Code</td>
      <td>AuditEvent</td>
      <td>entity.type [0..1] Coding</td>
    </tr>
    <tr>
      <td>ObjetEvenement [0..*]</td>
      <td>Contenu [0..1] ObjetBinaire (Intervention médicale)</td>
      <td>AuditEvent</td>
      <td>entity.what [0..1] Reference (Procedure)</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>idIntervention [1..1] Identifiant</td>
      <td>Procedure</td>
      <td>identifier [0..*] Identifier</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>numSejour [0..1] Identifiant</td>
      <td>Procedure</td>
      <td>identifier [0..*] Identifier</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>typeIntervention [0..1] Code</td>
      <td>Procedure</td>
      <td>category [0..1] CodeableConcept</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>dateIntervention [1..1] DateHeure</td>
      <td>Procedure</td>
      <td>performedDateTime [0..1] dateTime</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>emplacementDMI [1..1] Texte</td>
      <td>Procedure</td>
      <td>bodySite [0..*] CodeableConcept</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>poseConforme [1..1] Boolean</td>
      <td>Procedure</td>
      <td>complication [0..*] CodeableConcept</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>motifEchec [0..1] Texte</td>
      <td>Procedure</td>
      <td>complication [0..*] CodeableConcept</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>metadonnee [1..1] Metadonnee</td>
      <td>Procedure</td>
      <td>meta [0..1] Meta</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>Professionnel [1..1]</td>
      <td>Procedure</td>
      <td>performer.actor [1..1] Reference (Practitioner | PractitionerRole)</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>OrganisationInterne [1..1]</td>
      <td>Procedure</td>
      <td>performer.onBehalfOf [0..1] Reference (Organization)</td>
    </tr>
    <tr>
      <td>InterventionMedicale [1..1]</td>
      <td>DispositifMedical [1..1]</td>
      <td>Procedure</td>
      <td>focalDevice.manipulated [1..1] Reference (Device)</td>
    </tr>
    <tr>
      <td>ObjetEvenement [0..*]</td>
      <td>type [0..1] Code</td>
      <td>AuditEvent</td>
      <td>entity.type [0..1] Coding</td>
    </tr>
    <tr>
      <td>ObjetEvenement [0..*]</td>
      <td>Contenu [0..1] ObjetBinaire (contenu non structuré)</td>
      <td>AuditEvent</td>
      <td>entity.detail.valueBase64Binary [1..1]</td>
    </tr>
  </tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux 15</p>

### Flux 13a – TracabiliteRefusDMI 

Ce flux reprend les mêmes éléments que le flux 15.

### Flux 30 – TracabiliteSortieStockSU

Ce flux reprend les mêmes éléments que le flux 15.

### Flux 14 – TracabiliteEchecPose 

Ce flux reprend les mêmes éléments que le flux 15.

### Flux 16a – TracabiliteReassortDMI 

Ce flux reprend les mêmes éléments que le flux 27.

### Flux 18 – TracabiliteFacturationDMI 

Ce flux est un cas particulier du « Flux 22 – TransmissionTrace » précédemment présenté. Il reprend tel quel la structure des classes Trace, SourceTrace, Evenement, ActeurEvenement et spécifie deux occurrences de la classe ObjetEvenement :

<table class="grid">
  <thead>
    <tr>
      <th colspan="2">Éléments métier</th>
      <th colspan="2">Éléments FHIR</th>
    </tr>
    <tr>
      <th>Nom classes</th>
      <th>Nom attributs</th>
      <th>Ressource</th>
      <th>Élément</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Trace [1..1]</td>
      <td>Cf <a href="#flux-22-transmissiontrace">Tableau Flux 22</a></td>
      <td>Cf Tableau Flux 22</td>
      <td>Cf Tableau Flux 22</td>
    </tr>
    <tr><td>SourceTrace [1..1]</td><td>Cf Tableau Flux 22</td><td>Cf Tableau Flux 22</td><td>Cf Tableau Flux 22</td></tr>
    <tr><td>Événement [1..1]</td><td>Cf Tableau Flux 22</td><td>Cf Tableau Flux 22</td><td>Cf Tableau Flux 22</td></tr>
    <tr><td>ActeurEvenement [0..2]</td><td>Cf Tableau Flux 22</td><td>Cf Tableau Flux 22</td><td>Cf Tableau Flux 22</td></tr>
    <tr>
      <td>ObjetEvenement [0..*]</td>
      <td>type [0..1] Code</td>
      <td>AuditEvent</td>
      <td>entity.type [0..1] Coding</td>
    </tr>
    <tr>
      <td>ObjetEvenement [0..*]</td>
      <td>Contenu [0..1] ObjetBinaire (Facture)</td>
      <td>AuditEvent</td>
      <td>entity.what [0..1] Reference (Invoice)</td>
    </tr>
    <tr><td>Facture [1..1]</td><td>refFacture [1..1] Identifiant</td><td>Invoice</td><td>identifier [0..*] Identifier</td></tr>
    <tr><td>Facture [1..1]</td><td>facture [0..1] ObjetBinaire</td><td>Invoice</td><td>Extension : DMI_Facture [0..1] Reference (Binary)</td></tr>
    <tr><td>Facture [1..1]</td><td>typeFacture [0..1] Code</td><td>Invoice</td><td>type [0..1] CodeableConcept</td></tr>
    <tr><td>Facture [1..1]</td><td>refCommande [1..1] Identifiant</td><td>Invoice</td><td>identifier [0..*] Identifier</td></tr>
    <tr><td>Facture [1..1]</td><td>dateEmission [0..1] Date</td><td>Invoice</td><td>date [0..1] dateTime</td></tr>
    <tr><td>Facture [1..1]</td><td>instructionPaiement [0..1] Texte</td><td>Invoice</td><td>paymentTerms [0..1] markdown</td></tr>
    <tr><td>Facture [1..1]</td><td>montantTotal [0..1] Numérique</td><td>Invoice</td><td>totalNet [0..1] Money</td></tr>
    <tr><td>Facture [1..1]</td><td>Devise [0..1] code</td><td>Invoice</td><td>totalNet.currency [0..1] code</td></tr>
    <tr><td>Facture [1..1]</td><td>metadonnee [1..1] Metadonnee</td><td>Invoice</td><td>meta [0..1] Meta</td></tr>
    <tr><td>Facture [1..1]</td><td>Ligne [1..*]</td><td>Invoice</td><td>Voir section “Ligne”</td></tr>
    <tr><td>Ligne [1..*]</td><td>dateAchat [1..1] Date</td><td>Invoice</td><td>lineItem.chargeItemReference.occurrenceDateTime [0..1]</td></tr>
    <tr><td>Ligne [1..*]</td><td>metadonnee [1..1] Metadonnee</td><td>Invoice</td><td>meta [0..1] Meta</td></tr>
    <tr><td>Ligne [1..*]</td><td>DispositifMedical [1..1]</td><td>Invoice</td><td>lineItem.chargeItem.chargeItem.productReference [0..1]</td></tr>
    <tr><td>ObjetEvenement [0..*]</td><td>type [0..1] Code</td><td>AuditEvent</td><td>entity.type [0..1] Coding</td></tr>
    <tr><td>ObjetEvenement [0..*]</td><td>Contenu [0..1] ObjetBinaire (non structuré)</td><td>AuditEvent</td><td>entity.detail.valueBase64Binary [1..1]</td></tr>
  </tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standard du flux 15</p>

### Flux 23 - RechercheTraces

Ce flux intervient lorsque le consommateur effectue une recherche de traces d’un ou de plusieurs DMI se trouvant dans l’établissement de santé auprès du gestionnaire de traçabilité en précisant les critères de sa recherche.

Il correspond au « Flux 4 -RechercheTraces » du volet « Traçabilité des évènements ».

Ci-dessous les critères de recherches. Les critères apparaissant *en italique et en rouge* correspondent à des paramètres de recherche créés pour répondre au besoin :

<table class="grid">
  <thead>
    <tr>
      <th>Critère de recherche SFE</th>
      <th>Ressource</th>
      <th>Paramètre identifié</th>
      <th>Paramètre supplémentaire</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Evenement/typeEvenement</td>
      <td>AuditEvent</td>
      <td>type : token</td>
      <td></td>
    </tr>
    <tr>
      <td>Evenement/declaration</td>
      <td>AuditEvent</td>
      <td>date : date</td>
      <td></td>
    </tr>
    <tr>
      <td>Evenement/sousTypeEvenement</td>
      <td>AuditEvent</td>
      <td>subtype : token</td>
      <td></td>
    </tr>
    <tr>
      <td>ActeurEvenement/identifiant</td>
      <td>AuditEvent</td>
      <td>agent : reference</td>
      <td></td>
    </tr>
    <tr>
      <td>ActeurEvenement/identifiant</td>
      <td>AuditEvent</td>
      <td>agent-name : string</td>
      <td></td>
    </tr>
    <tr>
      <td>ActeurEvenement/identifiant</td>
      <td>AuditEvent</td>
      <td>altId : token</td>
      <td></td>
    </tr>
    <tr>
      <td>ActeurEvenement/identifiant</td>
      <td>AuditEvent</td>
      <td></td>
      <td>patient : reference</td>
    </tr>
    <tr>
      <td>ActeurEvenement/role</td>
      <td>AuditEvent</td>
      <td>agent-role : token</td>
      <td></td>
    </tr>
    <tr>
      <td>DispositifMedical/support/IUD-ID</td>
      <td>Device</td>
      <td></td>
      <td>Device-udi-di : String</td>
    </tr>
    <tr>
      <td>DispositifMedical/support/identifiantHRF</td>
      <td>Device</td>
      <td></td>
      <td>Device-udi-carrier : String</td>
    </tr>
    <tr>
      <td>DispositifMedical/referenceFabricant</td>
      <td>Device</td>
      <td></td>
      <td>manufacturer : String</td>
    </tr>
    <tr>
      <td>DispositifMedical/support/IUD-IPNumLot</td>
      <td>Device</td>
      <td></td>
      <td>DMI_Device_lotNumber : string</td>
    </tr>
    <tr>
      <td>DispositifMedical/support/IUD-IPNumSerie</td>
      <td>Device</td>
      <td></td>
      <td>DMI_Device_serialNumber : string</td>
    </tr>
    <tr>
      <td>DispositifMedical/codeEMDN</td>
      <td>Device</td>
      <td></td>
      <td>DMI_Device_definition-type : token</td>
    </tr>
    <tr>
      <td>Patient/identite/matriculeINS</td>
      <td>Patient</td>
      <td></td>
      <td>DMI_Patient_INS : token</td>
    </tr>

  </tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standards du flux 23</p>

### Flux 24 – ReponseRechercheTraces 

Il s’agit du résultat de la recherche de traces retourné par le gestionnaire de traçabilté. La recherche de traces retourne une ressource Bundle de type SearchSet contenant les ressources AuditEvent correspondant aux critères de recherche fournis par le consommateur.

Il correspond au « Flux 5 -ReponseRechercheTraces » du volet « Traçabilité des évènements ».

### Flux 25 – ConsulterTrace 

Ce flux intervient lorsque le consommateur demande à consulter la trace d’un évènement auprès du gestionnaire de traçabilité.

Il correspond au « Flux 2 -ConsultationTrace » du volet « Traçabilité des évènements » :

<table class="grid">
  <thead>
    <tr>
      <th colspan="2">Éléments métier</th>
      <th colspan="2">Éléments FHIR</th>
    </tr>
    <tr>
      <th>Nom classes</th>
      <th>Nom attributs</th>
      <th>Ressource</th>
      <th>Élément</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Trace</td>
      <td>identifiant [0..1] : Identifiant</td>
      <td>AuditEvent</td>
      <td>id [1..1] id</td>
    </tr>
  </tbody>
</table>

<p style="text-align:center;">Mise en correspondance des contenus métiers/standards du flux 25</p>

### Flux 26 – ReponseConsulterTrace

Il s’agit du résultat de la demande de consultation de la trace d’un évènement retourné par le gestionnaire de traçabilité. Le corps de la réponse est la ressource AuditEvent identifiée lors de la demande.

Il correspond au « Flux 3 - ReponseConsultationTrace » du volet
« Traçabilité des évènements ».
