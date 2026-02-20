### Définition des concepts métier

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 66%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Concept « métier »</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><p>Commande/CommandeLivree/</p>
<p>Demande/Delivrance/Reception</p></td>
<td style="text-align: left;">Eléments nécessaires pour identifier un
besoin ou engager une transaction commerciale</td>
</tr>
<tr>
<td>Ligne (de commande)</td>
<td style="text-align: left;">Identification d’une référence dans la
commande</td>
</tr>
<tr>
<td>OrganisationInterne</td>
<td style="text-align: left;">structures organisationnelles portant des
activités sur un lieu au sein d'une entité géographique</td>
</tr>
<tr>
<td><p>Evènement</p>
<p>avec les éléments métiers
(Trace/SourceTrace/ActeurEvenement/ObjetEvenement)</p></td>
<td style="text-align: left;"><p>Une action nécessitant une traçabilité
est définie par, à minima, une date et un type (réception DMI, Envoi DMI
vers plateau technique de pose, etc.).</p>
<p>Les évènements qui déclenchent le processus de traçabilité de DMI
sont les suivants:</p>
<ul>
<li>Demande de DMI</li>
<li>Commande de DMI</li>
<li>Réception de DMI</li>
<li>Entree et Sortie
Stock</li>
<li>Délivrance au service utilisateur</li>
<li>Consommation de DMI</li>
<li>Destérilisation par erreur</li>
<li>Taille inadaptée</li>
<li>Erreur de côté</li>
<li>Autres éléments sur une non-utilisation de DMI à cause d’un rejet technique ou sanitaire</li>
<li>Demande de réassort en DMI</li>
<li>Autorisation de paiement de la facture des DMI</li>
</ul>
<p>Un évènement peut déclencher une notification.</p></td>
</tr>
<tr>
<td>Fournisseur</td>
<td style="text-align: left;"><p>Il s’agit de la personne morale
responsable de la fourniture des DMI lorsqu’ils sont commandés par
l’établissement de santé ou de la mise à disposition des DMI selon les
termes de l’accord passé entre le fournisseur et l’établissement de
santé.</p>
<p>Le terme fournisseur correspond dans cette étude au fabricant ou au
distributeur.</p>
<p>Remarques : Les données à enregistrer seront différentes s’il s’agit
d’un distributeur ou d’un fabricant. Il doit être possible d’identifier
le fabricant, le mandataire et l’importateur pour tout DMI afin de
permettre le reporting des effets indésirables graves et de
matériovigilance.</p></td>
</tr>
<tr>
<td>EntiteGeographique</td>
<td style="text-align: left;">L’Entité Géographique (EG) correspond à la
notion d’établissement.</td>
</tr>
<tr>
<td>EntiteJuridique</td>
<td style="text-align: left;">L’Entité Juridique (EJ) liée au dispositif
médical représente le fabricant ou le distributeur du dispositif.</td>
</tr>
<tr>
<td>Dispositif Médical (DM)</td>
<td style="text-align: left;">Se référer à la Table 1 de ce
document.</td>
</tr>
<tr>
<td>Lieu</td>
<td style="text-align: left;">Informations relatives à une portion
déterminée de l'espace</td>
</tr>
<tr>
<td>InterventionMedicale</td>
<td style="text-align: left;">Une intervention clinique ou chirurgicale
qui implante d’un DMI impliquant au moins un professionnel de santé et
un patient.</td>
</tr>
<tr>
<td>Patient</td>
<td style="text-align: left;">Personne physique bénéficiaire de soins,
d'examens ou d'actes de prévention</td>
</tr>
<tr>
<td>INS</td>
<td style="text-align: left;">INS a pour signification « Identité
nationale de santé »</td>
</tr>
<tr>
<td>Professionnel</td>
<td style="text-align: left;">Personne physique travaillant en tant que
professionnel</td>
</tr>
<tr>
<td>PersonnePhysique</td>
<td style="text-align: left;">Une personne physique est un individu
titulaire de droits et d'obligations caractérisé par une identité
civile.</td>
</tr>
<tr>
<td>Facture</td>
<td style="text-align: left;">Document qui atteste de l'achat ou de la
vente de biens ou services. </td>
</tr>
</tbody>
</table>

##### Mapping MOS

<table>
<colgroup>
<col style="width: 56%" />
<col style="width: 26%" />
<col style="width: 17%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Concept métier</th>
<th style="text-align: left;">Concept MOS (V2022.04)</th>
<th style="text-align: left;">Relation (Extension/ Restriction)</th>
</tr>
</thead>
<tbody>
<tr>
<td
style="text-align: left;"><p>Commande/CommandeLivree/Demande/Delivrance/</p>
<p>Transport/Reception/</p></td>
<td></td>
<td></td>
</tr>
<tr>
<td style="text-align: left;">Ligne (de commande)</td>
<td></td>
<td></td>
</tr>
<tr>
<td style="text-align: left;">Organisation Interne</td>
<td>OrganisationInterne</td>
<td>Restriction</td>
</tr>
<tr>
<td style="text-align: left;">Evenement</td>
<td>Evenement</td>
<td>Extension</td>
</tr>
<tr>
<td
style="text-align: left;">Trace/SourceTrace/ActeurEvenement/ObjetEvenement</td>
<td></td>
<td></td>
</tr>
<tr>
<td style="text-align: left;">Fournisseur (fabricant, distributeur de
DM)</td>
<td>EntiteJuridique</td>
<td>Extension</td>
</tr>
<tr>
<td style="text-align: left;">EntiteGeographique</td>
<td>EntiteGeographique</td>
<td>Restriction</td>
</tr>
<tr>
<td style="text-align: left;">Dispositif Médical (DM) / Dispositif
Médical Implantable (DMI)</td>
<td>DispositifMedical</td>
<td>Restriction</td>
</tr>
<tr>
<td style="text-align: left;">Lieu</td>
<td>Lieu</td>
<td>Restriction</td>
</tr>
<tr>
<td style="text-align: left;">InterventionMedicale</td>
<td></td>
<td></td>
</tr>
<tr>
<td style="text-align: left;">Patient</td>
<td>PersonnePriseCharge</td>
<td>Restriction</td>
</tr>
<tr>
<td style="text-align: left;">INS</td>
<td>INS</td>
<td>Restriction</td>
</tr>
<tr>
<td style="text-align: left;">Professionnel</td>
<td>Professionnel</td>
<td>Restriction</td>
</tr>
<tr>
<td style="text-align: left;">PersonnePhysique</td>
<td>PersonnePhysique</td>
<td>Restriction</td>
</tr>
<tr>
<td style="text-align: left;">Facture</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
