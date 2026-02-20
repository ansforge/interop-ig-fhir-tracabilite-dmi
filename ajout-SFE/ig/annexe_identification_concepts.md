# Identification des concepts - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Autres Ressources**](autres_ressources.md)
* **Identification des concepts**

## Identification des concepts

### Définition des concepts métier

| | |
| :--- | :--- |
| Commande/CommandeLivree/Demande/Delivrance/Reception | Eléments nécessaires pour identifier un besoin ou engager une transaction commerciale |
| Ligne (de commande) | Identification d’une référence dans la commande |
| OrganisationInterne | structures organisationnelles portant des activités sur un lieu au sein d'une entité géographique |
| Evènementavec les éléments métiers (Trace/SourceTrace/ActeurEvenement/ObjetEvenement) | Une action nécessitant une traçabilité est définie par, à minima, une date et un type (réception DMI, Envoi DMI vers plateau technique de pose, etc.).Les évènements qui déclenchent le processus de traçabilité de DMI sont les suivants:* Demande de DMI
* Commande de DMI
* Réception de DMI
* Entree et Sortie Stock
* Délivrance au service utilisateur
* Consommation de DMI
* Destérilisation par erreur
* Taille inadaptée
* Erreur de côté
* Autres éléments sur une non-utilisation de DMI à cause d’un rejet technique ou sanitaire
* Demande de réassort en DMI
* Autorisation de paiement de la facture des DMI
Un évènement peut déclencher une notification. |
| Fournisseur | Il s’agit de la personne morale responsable de la fourniture des DMI lorsqu’ils sont commandés par l’établissement de santé ou de la mise à disposition des DMI selon les termes de l’accord passé entre le fournisseur et l’établissement de santé.Le terme fournisseur correspond dans cette étude au fabricant ou au distributeur.Remarques : Les données à enregistrer seront différentes s’il s’agit d’un distributeur ou d’un fabricant. Il doit être possible d’identifier le fabricant, le mandataire et l’importateur pour tout DMI afin de permettre le reporting des effets indésirables graves et de matériovigilance. |
| EntiteGeographique | L’Entité Géographique (EG) correspond à la notion d’établissement. |
| EntiteJuridique | L’Entité Juridique (EJ) liée au dispositif médical représente le fabricant ou le distributeur du dispositif. |
| Dispositif Médical (DM) | Se référer à la Table 1 de ce document. |
| Lieu | Informations relatives à une portion déterminée de l'espace |
| InterventionMedicale | Une intervention clinique ou chirurgicale qui implante d’un DMI impliquant au moins un professionnel de santé et un patient. |
| Patient | Personne physique bénéficiaire de soins, d'examens ou d'actes de prévention |
| INS | INS a pour signification « Identité nationale de santé » |
| Professionnel | Personne physique travaillant en tant que professionnel |
| PersonnePhysique | Une personne physique est un individu titulaire de droits et d'obligations caractérisé par une identité civile. |
| Facture | Document qui atteste de l'achat ou de la vente de biens ou services.  |

### Mapping MOS

| | | |
| :--- | :--- | :--- |
| Commande/CommandeLivree/Demande/Delivrance/Transport/Reception/ |  |  |
| Ligne (de commande) |  |  |
| Organisation Interne | OrganisationInterne | Restriction |
| Evenement | Evenement | Extension |
| Trace/SourceTrace/ActeurEvenement/ObjetEvenement |  |  |
| Fournisseur (fabricant, distributeur de DM) | EntiteJuridique | Extension |
| EntiteGeographique | EntiteGeographique | Restriction |
| Dispositif Médical (DM) / Dispositif Médical Implantable (DMI) | DispositifMedical | Restriction |
| Lieu | Lieu | Restriction |
| InterventionMedicale |  |  |
| Patient | PersonnePriseCharge | Restriction |
| INS | INS | Restriction |
| Professionnel | Professionnel | Restriction |
| PersonnePhysique | PersonnePhysique | Restriction |
| Facture |  |  |

