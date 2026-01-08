# Specifications Fonctionnelles - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* **Specifications Fonctionnelles**

## Specifications Fonctionnelles

### Introduction

Ce document présente l’étude « métier » pour la traçabilité des dispositifs médicaux implantables (DMI) au sein d’un établissement de santé. Cette étude propose, d’une part, la modélisation des flux d’échanges pour la traçabilité du cycle de vie des DMI, au sein d’un établissement de santé et d’autre part, la définition du périmètre métier nécessaire à la mise en œuvre de cette traçabilité entre systèmes d’information ou composants de systèmes d’information.

La finalité de cette étude correspond à la modélisation du circuit des DMI dans les établissements de santé (depuis leur réception dans l'établissement jusqu’à leur pose chez le patient) permettant d'identifier dans les SIH les flux entrant dans le cadre de la traçabilité sanitaire, financière et logistique des DMI. avec « l’appel à la gestion de traces » issue du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces).

Cette étude doit être interprétée à la lumière des exigences réglementaires applicables aux établissements de santé en matière de traçabilité des DMI. En premier lieu, il s'agit des règles de traçabilité sanitaire définies par le Décret n° 2006-1497 du 29 novembre 2006, inscrites dans le code de la santé publique (Art. R5212-36 à R5212-42). En outre, depuis le 26 mai 2021, les établissements de santé doivent enregistrer l'identifiant unique "IUD" des DMI de classe III, comme le prévoit la réglementation européenne (règlement (UE) 2017/745, Art. 27). Enfin, l'arrêté du 8 septembre 2021 relatif au management de la qualité du circuit des DMI ([Arrêté du 8 septembre 2021 relatif au management de la qualité du circuit des dispositifs médicaux implantables dans les établissements de santé et les installations de chirurgie esthétique](https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044053502)) introduit de nouvelles exigences à compter du 26 mai 2022 : renforcement des règles de traçabilité (nouvelles données à enregistrer, respect du cadre d'interopérabilité des systèmes d'information de santé), enregistrement de l'IUD à toutes les étapes du circuit, pour tous les DMI à l'exception des ligatures, sutures et dispositifs d'ostéosynthèse.

Pour faciliter la mise en conformité avec les exigences de traçabilité, renforcer l'identification des DM et optimiser la gestion de leurs informations dans les SIH, les établissements de santé peuvent utiliser depuis plusieurs années des bases de données professionnelles externes dont certaines permettent la convergence vers le système IUD (CIOdm et autres bases comme par exemple Exhausmed, Vidal, Euro-Pharmat, Phast CIOdm, ACL).

L’élaboration de cette étude a été basée sur un travail de recherche documentaire ainsi que des rencontres avec des acteurs métier (cf. Annexe D).

_Remarque_ :

La modélisation des processus de traçabilité des dispositifs médicaux implantables est invariante selon le mode de gestion des stocks. La gestion des stocks de DMI peut s’effectuer à deux niveaux selon l’organisation interne de l’établissement de santé. Les stocks de dispositifs médicaux peuvent être gérés par la pharmacie à usage intérieur (PUI) d’une part ou au sein du stock de proximité du plateau technique opératoire d’autre part.

Dans le cadre de cette étude, le parti pris a été celui d’une gestion de stock des DMI partagée et d’un respect des obligations réglementaires :

* La PUI délivre les DMI et trace cette délivrance.
* Le plateau technique opératoire pose les DMI et trace cette pose.

#### Définitions

Ce paragraphe délivre une définition succincte de certains termes utilisés dans ce document

| | |
| :--- | :--- |
|  | *  Commission nationale de terminologie : « Ensemble des procédures et des contrôles permettant de suivre l'historique d'un produit depuis sa fabrication jusqu'à son administration à un patient ». 
*  ISO 9000 : « Aptitude à retrouver l'historique, l'utilisation ou la localisation d'une entité au moyen d'identifications enregistrées ». 
*  HAS : « Possibilité de retrouver, dans un système, une liste d’informations déterminées attachées à un ou plusieurs éléments du système pour expliquer ses défaillances ». 
*  Du point de vue de la gestion de l’information, mettre en place un système de traçabilité, c’est associer systématiquement un flux d’informations à un flux physique. 
L’objectif est de pouvoir retrouver, à l’instant voulu, des données préalablement enregistrées permettant de localiser l’entité.Le décret du 29 novembre 2006 demande la traçabilité des DM depuis leur réception jusqu'à leur utilisation chez le patient et leur éventuelle explantation. |
|  | L’article 2 partie 1 du Règlement (UE) 2017/745 du 5 avril 2017 définit un DM comme tout instrument, appareil, équipement, logiciel, implant, réactif, matière ou autre article, destiné par le fabricant à être utilisé, seul ou en association, chez l'homme pour l'une ou plusieurs des fins médicales précises suivantes:* diagnostic, prévention, surveillance, prédiction, pronostic, traitement ou atténuation d'une maladie,
* diagnostic, contrôle, traitement, atténuation d'une blessure ou d'un handicap ou compensation de ceux-ci,
* investigation, remplacement ou modification d'une structure ou fonction anatomique ou d'un processus ou état physiologique ou pathologique,
* communication d'informations au moyen d'un examen in vitro d'échantillons provenant du corps humain, y compris les dons d'organes, de sang et de tissus,
et dont l'action principale voulue dans ou sur le corps humain n'est pas obtenue par des moyens pharmacologiques ou immunologiques ni par métabolisme, mais dont la fonction peut être assistée par de tels moyens. Les produits ci-après sont également réputés être des dispositifs médicaux :* les dispositifs destinés à la maîtrise de la conception ou à l'assistance à celle-ci,
* les produits spécifiquement destinés au nettoyage, à la désinfection ou à la stérilisation des dispositifs visés à l'article 1er, paragraphe 4, et de ceux visés au premier alinéa du présent point.
 |
|  | L’article 2 partie 5 du Règlement (UE) 2017/745 du 5 avril 2017 définit un DMI comme tout dispositif, y compris ceux qui sont absorbés en partie ou en totalité, (i) destiné à être introduit intégralement dans le corps humain ou (ii) à remplacer une surface épithéliale ou la surface de l'œil - par une intervention clinique et à demeurer en place après l'intervention.Est également réputé être un DMI tout dispositif destiné à être introduit partiellement dans le corps humain par une intervention clinique et à demeurer en place après l'intervention pendant une période d'au moins trente jours |
|  | Les DMI sont commandés par l’établissement de santé et réceptionnés dans une certaine quantité en prévision de leur utilisation future. Ils sont la propriété de l’établissement de santé et sont généralement stockés au niveau de l’arsenal du plateau technique opératoire afin d’être immédiatement disponible en cas d’intervention. Dans les contrats qui lient les distributeurs aux établissements de santé, la gestion des péremptions et le réapprovisionnement relève de la responsabilité des établissements[(cf arrêté du 8 septembre 2021).](https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044053502) |
|  | Le fournisseur est une entité commerciale selon son statut défini dans le Règlement (UE) 2017/745 : fabricant, mandataire ou distributeur autorisée à fournir des DM à un établissement de santé client. Elle peut agir dans le cadre d’un contrat (marché public ou privé) qui régit sa relation commerciale avec son client. |
|  | Le fournisseur met à disposition de l’établissement de santé des DMI. Ils restent la propriété du fournisseur, qui en gère l’inventaire et la péremption, et ce jusqu’à leur utilisation. Lorsque les produits sont en dépôt, l’établissement de santé indique au fournisseur la pose d’un implant qui est facturé à ce moment-là. Le dépôt vente donne lieu à une convention définissant les obligations des parties (fournisseur et établissement de santé), cette convention est partie intégrante du contrat lorsqu’il existe entre le fournisseur et l’établissement de santé[(cf arrêté du 8 septembre 2021).](https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044053502) |
|  | Il s’agit de la personne prise en charge que ce soit au niveau sanitaire, médico-administratif, médico-social et social. Cette personne peut être un usager dans le secteur social ou un patient. Dans le contexte de cette étude, il s’agit d’un patient pour lequel un ou plusieurs DMI sont posés lors d’une intervention médicale ou chirurgicale. |
|  | Un professionnel est une personne qui participe, au titre de son emploi professionnel, à la prise en charge d’une personne que ce soit au niveau sanitaire, médico-administratif, médico-social ou social. Dans le cadre de cette étude, il s’agit d’un professionnel prenant en charge le patient au niveau sanitaire ou médico-administratif.Synonyme : utilisateur (Règlement (UE) 2017/745, Article 2 Point 37). |
|  | Pharmacie à usage intérieur. |
|  | Infirmier de bloc opératoire diplômé d’état |

Table 1 : Quelques définitions utilisées dans cette étude

#### Exemples de cas d'usage

Ci-dessous des exemples d’usages de la traçabilité de DMI en établissement de santé.

##### Réassort de stock - DMI gérés en achat

* Un besoin de réassort est transmis à la PUI.
* La PUI passe une commande auprès du fournisseur.
* Le fournisseur reçoit la commande, la traite et livre les DMI à la PUI.
* La PUI reçoit les DMI, les enregistre, délivre les DMI au service utilisateur ayant déclenché la demande de réassort et en trace la délivrance.
* Le gestionnaire de comptabilité déclenche le règlement de la facture de DMI.
* L’infirmier ou l’IBODE reçoit les DMI, enregistre leur réception et les place dans le stock de proximité jusqu’à l’opération.
* Le praticien « implanteur » effectue la pose de DMI. Et il enregistre l’acte de pose du DMI dans le système d’information du PMSI.
* L’infirmier ou l’IBODE renseigne les informations relatives à la pose de DMI. Les données relatives aux DMI doivent figurer dans le dossier patient (Article R. 5212-40 du code de la santé publique).
* La lettre de liaison est remise au patient et à son médecin traitant à l’issue de son séjour dans l’établissement de santé (hors périmètre de cette spécification fonctionnelle).

##### Préparation d’une intervention– DMI gérés en dépôt-vente et non disponibles en stock

* Le plateau technique souhaite préparer une intervention chirurgicale avec pose de DMI pour une personne prise en charge.
* Le plateau technique, ne disposant pas de DMI en stock, effectue une demande auprès de la PUI. -La PUI passe une commande auprès du distributeur (hors périmètre de cette spécification fonctionnelle).
* Le distributeur reçoit la commande, la traite et livre les DMI au lieu de livraison renseigné sur le bon de commande (PUI) (hors périmètre de cette spécification fonctionnelle).
* LaPUI reçoit les DMI, les enregistre, les délivre au plateau technique et en trace la délivrance.L’infirmier ou l’IBODE reçoit les DMI, enregistre leur réception et les stocke dans l’arsenal jusqu’à l’opération.
* Le praticien « implanteur » effectue la pose de DMI. Et il enregistre l’acte de pose du DMI dans le système d’information du PMSI.
* L’infirmier ou l’IBODE renseigne les informations relatives à la pose de DMI. Les données relatives aux DMI doivent figurer dans le dossier patient (Article R. 5212-40 du code de la santé publique).
* La PUI reçoit les informations de pose et donne l’accord de paiement des DMI consommés.
* Le gestionnaire de comptabilité déclenche le règlement de la facture de DMI.Une demande de réassort est éventuellement remontée.
* La PUI réexpédie et trace les produits non posés. Ce cas peut se produire lorsque le distributeur envoie des sets complets avec plusieurs tailles afin de pouvoir répondre aux besoins de choix lors de la pose.
* La lettre de liaison est remise au patient et à son médecin traitant à l’issue de son séjour dans l’établissement de santé (hors périmètre de cette spécification fonctionnelle).

##### Préparation d’une intervention– DMI gérés en dépôt-vente et disponibles en stock

* Le plateau technique souhaite préparer une intervention chirurgicale pour une pose de DMI chez un patient.
* Le plateau technique, disposant du DMI souhaité dans son stock, effectue la sortie du stock nécessaire.
* Le praticien « implanteur » effectue la pose de DMI. Et il enregistre l’acte de pose du DMI dans le système d’information du PMSI.
* L’infirmier ou l’IBODE renseigne les informations relatives à la pose de DMI. Les données relatives aux DMI doivent figurer dans le dossier patient (Article R. 5212-40 du code de la santé publique).
* La PUI reçoit les informations de pose et donne l’accord de paiement des DMI consommés.
* Une demande de réassort est systématiquement remontée pour maintenir constant le niveau de stock selon la convention de réapprovisionnement entre le fournisseur et l’établissement.

#### Cadre juridique

##### Plan national - Traçabilité sanitaire dans le cadre de la matériovigilance

###### Décret n°2006-1497 du 29 novembre 2006

Le décret n°2006-1497 du 29 novembre 2006, modifiant le code de la santé publique (dispositions réglementaires de matériovigilance) institue l’obligation de traçabilité de certains dispositifs médicaux dont la liste a été fixée par l’arrêté du 26 Janvier 2007 :

* dispositifs médicaux incorporant une substance qui, si elle est utilisée séparément, est susceptible d'être considérée comme un médicament dérivé du sang ;
* valves cardiaques ;
* autres dispositifs médicaux implantables : 
* y compris les implants dentaires ;
* à l'exception des ligatures, sutures et dispositifs d'ostéosynthèse.
 

Les règles particulières de traçabilité sont posées par les articles du décret n°2006-1497 détaillés ci-dessous :

* L’article R. 5212-36 circonscrit le périmètre des règles de traçabilité des dispositifs médicaux depuis leur réception dans la structure sanitaire ou de chirurgie esthétique où ils seront utilisés jusqu'à leur utilisation chez le patient.L’objectif de cette traçabilité est de permettre : 
1. l’identification des patients pour lesquels les dispositifs médicaux d'un lot ont été utilisés;
1. l’identification des lots dont proviennent les dispositifs médicaux utilisés chez un patient.
 
* L’article R. 5212-37 fixe, la durée de conservation des données de traçabilité : les données relatives à la traçabilité des DMI sont conservées _pendant 10 ans_. La durée de conservation est _portée à 40 ans_ pour les DM incorporant une substance qui, si elle est utilisée séparément est susceptible d’être considérée comme un dérivé du sang.
* L’article R. 5212-38 porte sur les données de traçabilité relatives à la délivrance des dispositifs médicaux. Ces données sont enregistrées sous le contrôle du pharmacien (L’article L. 5126-5 du code de la santé publique impose que le pharmacien en charge de la gestion d’une PUI soit responsable de l’ensemble de son activité pharmaceutique) gérant de la PUI ou du professionnel de santé responsable et sont ensuite transmises au service utilisateur du DMI. Les données de traçabilité de la délivrance sont : 
1. l'identification de chaque dispositif médical :
a. dénomination ;
b. numéro de série ou de lot ;
c. nom du fabricant ou de son mandataire.
1. la date de la délivrance du dispositif médical au service utilisateur ;
1. l'identification du service utilisateur.
 
* L’article R. 5212-39 impose que chaque service utilisateur d'un DMI complète les informations de traçabilité de la délivrance en enregistrant : 
1. la date d'utilisation ;
1. l'identification du patient, et notamment ses : nom, prénom et date de naissance ;
1. le nom du médecin ou du chirurgien-dentiste utilisateur.
 
* L’article R. 5212-40 impose que tout professionnel de santé utilisant le DMI au sein d’un établissement de santé fasse figurer dans le dossier médical les informations suivantes : 
1. l'identification du dispositif médical : dénomination, numéro de série ou de lot, nom du fabricant ou de son mandataire ;
1. la date d'utilisation ;
1. le nom du médecin ou du chirurgien-dentiste utilisateur.
 
* Dans le cas d’un professionnel de santé utilisant le DMI en dehors de l’établissement de santé, les principes de traçabilité sont identiques à ceux exigés pour les établissements de santé en plus de l’information portant sur le lieu d'utilisation à renseigner dans le dossier médical du patient (article R. 5212-41).
* L’article R. 5212-42 stipule qu’à l'issue des soins ou des actes de chirurgie esthétique mettant en œuvre un dispositif médical figurant sur la liste prévue à l'article [R. 5212-36](https://www.legifrance.gouv.fr/affichCodeArticle.do?cidTexte=LEGITEXT000006072665&idArticle=LEGIARTI000006916313&dateTexte=&categorieLien=cid), est transmis au patient un document mentionnant : 
1. l'identification du dispositif médical utilisé : dénomination, numéro de série ou de lot, nom du fabricant ou de son mandataire et marque ;
1. le lieu et la date d'utilisation ;le nom du médecin ou du chirurgien-dentiste utilisateur ;
1. l'existence d'une durée de vie limitée du produit et l'éventuelle nécessité de réintervention qui en découle ;
1. le cas échéant, le suivi médical particulier.
 

Ci-dessous, un tableau récapitulatif des informations obligatoires de traçabilité de DMI.

* Informations obligatoires: **Le pharmacien (Pour les établissements ne disposant pas de PUI, le responsable de la traçabilité est la personne en charge des commandes et de la gestion des stocks dans l'établissement, sous le contrôle d'un professionnel de santé) enregistre les données de réception des DMI et les transmet ensuite au service utilisateur lors de la délivrance du DMI :**
* Informations obligatoires: *  l’identification de chaque dispositif médical : 
* dénomination ;
* numéro de série ou de lot ;
* nom du fabricant ou de son mandataire.
 
* la date de la délivrance du dispositif médical au service utilisateur ;
* l’identification du service utilisateur.

  * Référence: **R. 5212-38**
* Informations obligatoires: **Le service utilisateur renseigne ces informations lors de l'utilisation du DMI :**
* Informations obligatoires: * la date d'utilisation ;
* l’identification du patient : nom, prénom et date de naissance ;
* le nom du médecin ou du chirurgien-dentiste utilisateur.

  * Référence: **R. 5212-39**
* Informations obligatoires: **L'établissement doit faire figurer dans le dossier patient :**
* Informations obligatoires: * l’identification du dispositif médical : dénomination, numéro de série ou de lot, nom du fabricant ou de son mandataire ;
* la date d'utilisation ;
* le nom du médecin ou du chirurgien-dentiste utilisateur ;
* le lieu d’utilisation.

  * Référence: **R. 5212-40**

 Table 2 – Les informations obligatoires de traçabilité de DMI 

###### Instruction n° DGOS/PF2/2015/200 du 15 juin 2015

En complément du cadre législatif, la DGOS a mené une enquête aboutissant à la publication en juin 2015 d’une instruction (Instruction N°DGOS/PF2 2015 /200 du 15 juin 2015) comportant une liste de recommandations pour la traçabilité sanitaire des DMI à destination des établissements de santé. Parmi les recommandations spécifiques au système d’information il y a :

* l’utilisation d’un « référentiel des DMI unique et partagé avec l’ensemble des applications informatiques de la PUI (traçabilité financière, processus logistiques) et des applications informatiques concernées des services utilisateurs ».
* « chaque fois que cela est possible, saisir les données de traçabilité (dénomination, numéro de lot ou de série du DMI, identité du patient,…) par la lecture optique de codes à barres ou autre lecteur adapté au support d’information (RFID), a minima avant la délivrance au service utilisateur. Afin de fiabiliser les données de traçabilité, limiter le recours à la saisie manuelle des données autant que de possible. »

###### Guide de traçabilité des dispositifs médicaux

Le guide de traçabilité des dispositifs médicaux, élaboré par Euro-Pharmat avec la collaboration de l'Agence nationale de sécurité du médicament et des produits de santé (AFSSAPS) , fournit la définition de certaines informations de traçabilité qui seront reprises dans le cadre de la présente étude métier :

| | |
| :--- | :--- |
| Dénomination du DMI | * dénomination commune issue si possible d’une nomenclature harmonisée reconnue ;
* termes de la dénomination commerciale utiles pour une identification fiable et unique : modèle / type / référence.
 |
| Service utilisateur | * nom du service utilisateur ;
* code Unité fonctionnelle de responsabilité médicale ;
* lieu géographique d’implantation (identification du plateau technique, n° salle d’intervention).
 |
| Médecin utilisateur, chirurgien-dentiste utilisateur | *  praticien « implanteur », quelle que soit sa qualité
 |

 Table 3 Les définitions fournies par Euro-Pharmat 

**_La traçabilité financière dans le cadre de la T2A (Tarification à l'activité):_**
 Le système de financement pour les activités MCO (Médecine, chirurgie, obstétrique) des établissements de santé, T2A, se base sur l’activité réellement produite. Concrètement, chaque séjour de patient est attribué à un groupe homogène de malade (GHM) et est associé à un tarif appelé groupe homogène de séjours (GHS) qui couvre l’ensemble des coûts fixes et variables correspondant aux prestations dont le patient a bénéficié au cours de son séjour. Les dépenses liées aux DMI sont intégrées dans ces tarifs d’hospitalisation à l’activité.
 Toutefois, certains DMI ayant un coût trop élevé, sont financés « en sus » des forfaits de séjours et doivent alors figurer dans la Liste des Produits et Prestations remboursables par l’Assurance maladie (LPPr) en application de l'article L. 162-22-7 du code de la sécurité sociale (CSS) en vue de leur remboursement par l’assurance maladie. Les règles d’inscription sur la LPPr sont définies dans l’article L-165-1 du Code de la Sécurité Sociale et la liste est établie après avis d'une commission de la Haute Autorité de Santé et d’autres acteurs mentionnés dans l'article L. 161-37 du CSS.

La traçabilité financière initialement consiste alors en l’attribution d’un ou plusieurs codes LPP à chaque séjour de patient ayant bénéficié de l’implantation de DMI inscrits sur la LPPr. Actuellement, cette traçabilité a évolué et dépasse le périmètre initial des DMI inscrits sur cette liste :

1. Il existe désormais des DMI, des parties de DMI et des accessoires de DMI à traçabilité obligatoire (étant donné qu’ils sont indispensables au fonctionnement du DMI) qui sont facturés dans le cadre de soins externes ;
1. Certains DMI non-inscrits sur la LPPs font l’objet d’une traçabilité financière puisque qu’ils sont soumis à contrôle, notamment les DMI intra GHS ;
1. Il existe des DM non implantables pris en charge au Titre V de la LPP, à traçabilité financière indispensable.

Pour être remboursés intégralement ou partiellement par l’assurance maladie, les établissements de santé doivent communiquer mensuellement un fichier FICHCOMP (disponible en annexe) ou un RSF (pour les établissements sous objectif quantifié national) comportant la liste des séjours des patients accompagnée de la liste des DMI posés et inscrits sur la LPPr ainsi que d’autres informations telles que le n° FINESS de l’établissement, les codes LPP des DMI implantés, le nombre de DMI implantés par code LPP, le prix d’achat des DMI, les dates de pose, etc.

###### Plan Européen

Le règlement européen (UE) 2017/745 impose une traçabilité des dispositifs implantables les plus à risque (classe III) aux opérateurs économiques mais aussi aux établissements de santé. Cette traçabilité se traduit par l’enregistrement de l’IUD des dispositifs qu’ils auront fournis ou qu’on leur aura fournis.

La mise en œuvre de cette traçabilité doit permettre d’identifier rapidement et de façon précise quels dispositifs ont été implantés chez quels patients, a fortiori en cas de rappel de lot. De plus, il faut à tout moment connaitre la localisation d’un DMI non posé, de manière à procéder immédiatement au retrait de lot et à la mise en quarantaine en cas de rappel ou de signalement d’incident.

L’accessibilité à ces informations doit être immédiate pour le correspondant local de matériovigilance

**_Système d'identification unique des dispositifs (IUD)_**
 La traçabilité des dispositifs doit reposer sur un système d'identification unique des dispositifs (IUD) fondé sur des lignes directrices internationales lequel doit permettre d’assurer :

* la sécurité des dispositifs après commercialisation : 
* notification des incidents ;
* mesures correctives de sécurité ciblées ;
* contrôle par les autorités compétentes.
 
* la réduction du nombre d'erreurs médicales ;
* la lutte contre la falsification de dispositifs ;
* l’amélioration des politiques d'achat ;
* l’amélioration des politiques d'élimination des déchets ;
* la compatibilité avec d'autres systèmes d'authentification.

Concrètement, cela signifie que le système d’IUD passe par l’obligation faite aux fabricants d’attribuer à chacun de leurs DM mis sur le marché européen un Identifiant Unique du Dispositif (IUD) en suivant les règles d’un organisme de standardisation habilité, puis d’apposer cet IUD sous la forme d’un code-barres sur le conditionnement du dispositif ou le dispositif lui-même. Cet IUD devra être enregistré et partagé par l’ensemble des acteurs intervenant dans la chaîne de distribution (e.g. opérateurs économiques, établissements de santé).

L’IUD est un code alphanumérique. Il permet l'identification sans ambiguïté d'un dispositif médical spécifique sur le marché. Il comprend deux parties :

* une première partie, dite « L'IUD-ID » (pour identifiant du dispositif), qui est propre à un modèle de dispositif médical. Cette partie du code est « statique » et est identique pour tous les dispositifs d’un même modèle. Cet identifiant donne accès aux informations prévues dans l’annexe VI, partie B du Règlement ;
* une seconde partie de l’IUD, dite «IUD-IP » (pour identifiant de la production). Il contient les informations relatives à chaque unité produite. Les différents types d’IUD-IP sont le numéro de série, le numéro de lot, la date de fabrication et/ou d’expiration. Cette partie du code est « dynamique » et est propre à chaque DM produit.

**_Base de données européenne [EUDAMED](https://ec.europa.eu/growth/sectors/medical-devices/new-regulations/eudamed_en)_** Le système d’identification IUD doit être « adossé » à une base de données européenne appelée EUDAMED, administrée par la Commission Européenne (CE). Elle permettra de centraliser les informations relatives à tous les DM mis sur le marché de l'Union Européenne, et sera en partie ouverte au public. L'IUD-ID constituera la principale clé d'accès à ces informations.

Cette base EUDAMED a pour objectifs de permettre :

* l'identification unique des DM, et de faciliter leur traçabilité et le suivi de leur marquage CE ;
* d'informer le grand public des DM mis sur le marché et des investigations cliniques ;
* de diffuser une information sur les incidents de matériovigilance ;
* aux autorités compétentes et à la Commission d'exercer une surveillance du marché ;aux fabricants de déposer leurs dossiers d’investigations cliniques ;
* aux autorités compétentes de transmettre les notifications des organismes notifiés (ON) ;

Les informations relatives aux DM seront enregistrées par les fabricants, les organismes notifiés, et les promoteurs d'investigations cliniques selon leurs obligations respectives définies dans le règlement. Ces informations seront ensuite accessibles en globalité aux États membres et à la Commission et en accès limité aux organismes notifiés, aux opérateurs économiques, aux promoteurs et au grand public.

L'obligation faîte aux fabricants d'enregistrer leurs DM dans EUDAMED sera effective 24 mois après publication par la Commission Européenne d'un avis au JOUE déclarant la pleine fonctionnalité de EUDAMED.

**_Carte d’implant :_**
 Le contenu de la carte d’implant réalisé sous la responsabilité du fabricant relève de l’article 18 du règlement (UE) 2017/745. Cet article présente les informations devant figurer dans une carte d'implant fournie par le fabricant, et la liste des DM exemptés. Cette carte d'implant doit être remise au patient par l'établissement de santé.

###### Arrêté relatif au management de la qualité du circuit des DMI

L’arrêté du 8 septembre 2021 relatif au management de la qualité du circuit des dispositifs médicaux implantables (DMI) dans les établissements de santé et les installations de chirurgie esthétique doit entrer en vigueur le 26 mai 2022. Cet article mentionne des items précis à « récupérer » en sus de ceux décris dans (R 5212-38 et R 5212-39) à chaque étape du circuit des DMI :

* Date de péremption
* Dimensions
* Référence
* Nombre d’unités
* IUD lorsqu’il est disponible

#### Méthode d'élaboration

Les spécifications « métier » présentées dans ce document suivent la méthode d’élaboration des spécifications fonctionnelles des échanges mise en oeuvre par l’ANS. Cette méthode est constituée de plusieurs étapes :

* Étape 1: Organisation du contexte métier ;
* Étape 2: Définition des processus métier collaboratifs ;
* Étape 3: Description de chaque processus défini et identification des flux d’informations ;
* Étape 4: Pour chaque flux, identification des concepts "métier" véhiculés ;
* Étape 5: Élaboration du modèle de chaque flux structuré (sous forme d’un ou plusieurs diagrammes de classes UML). Le modèle de chaque flux repose sur la reprise des composants mutualisés dans le modèle des objets de santé (MOS) et des nomenclatures associées. À l'issue de cette élaboration, il se peut que de nouveaux composants jusqu'alors inexistants dans le MOS aient été définis et soient intégrés par la suite au MOS.
* Annexe A : Une définition de chaque concept métier identifié à l'étape 4 est présentée. Une mise en correspondance entre ces concepts et ceux du MOS est également présentée.
* Annexe B : Les listes de codes associés à des attributs définis à l’étape 5 sont présentées.
* Annexe D : Des informations supplémentaires concernant cette étude métier sont présentées.

#### Lectorat cible

Les lecteurs cibles sont principalement des chefs de projets ainsi que toute personne concernée par la maîtrise d’ouvrage et qui spécifie des projets avec des interfaces interopérables.

### Organisation du contexte métier

Ce chapitre présente la cartographie des processus du circuit DMI permettant son informatisation ainsi que son interopérabilité. La Traçabilité des DMI au sein d'un établissement de santé doit être assuré tout au long du circuit du DMI. Nous entendons par Traçabilité comme précisé dans la définition de la Table 1, le suivi de l’information du début jusqu’à la fin d’un processus. Cette traçabilité se décompose en plusieurs phases identifiées par les processus collaboratifs suivants :

* Demander DMI : la demande du/des DMI est effectuée par le service utilisateur.
* Commander DMI : la commande des DMI par le gestionnaire DMI (ou la PUI).
* Réceptionner par le gestionnaire DMI : la réception des DMI par le Gestionnaire DMI (ou la PUI).
* Délivrer DMI au service utilisateur : la délivrance des DMI par le gestionnaire DMI (ou la PUI).au service utilisateur. Ce processus déclenche également la traçabilité de sortie de stock de la PUI.
* Transporter DMI : le transport intra-hospitalier ou inter-sites est une phase critique dans l’acheminement des dispositifs au service utilisateur. Il est important d’y tracer les différentes étapes de ce processus.
* Réceptionner DMI par le service utilisateur : la réception au sein du service utilisateur avec une entrée de stock dans le stock de proximité du service.
* Poser DMI : l’implantation (pose) chez le patient avec enregistrement des informations essentielles entre le dispositif et le patient dans le système d’information de l’établissement.
* Facturer DMI : la facturation du DMI
* Tracer : la traçabilité de DMI au sein d'un établissement de santé, dans le contexte de cette étude métier, se fait suite au déclenchement de l'un des évènements suivants : demande de DMI, réception de DMI, sortie de stock, délivrance au service utilisateur, transport du DMI, réception de DMI par le service utilisateur, la consommation de DMI (posé/non posé) et la facturation du DMI.
* Rechercher traces : ce processus concerne la recherche des évènements de traçabilité concernant un ou plusieurs DMI tout au long du circuit d’un DMI au sein d'un établissement de santé.
* Consulter trace : ce processus concerne la consultation d’un évènement de traçabilité concernant un ou plusieurs DMI tout au long du circuit d’un DMI au sein d'un établissement de santé.

Chaque processus peut contenir un ou plusieurs flux d'échanges entre systèmes d'informations ou composants de systèmes d'information.

Il est à noter que d’autres processus pouvant exister comme le processus de stérilisation ou le processus de gestion d’achats sont hors périmètre de cette étude.

L'organisation du contexte métier de la traçabilité de DMI en établissement de santé est représentée par le diagramme de paquetage ci-dessous :

![](media/media/image4.png)

Figure 1 Diagramme de paquetage recensant les processus identifiés

### Définition du processus collaboratif

L’objectif de cette étape est de définir les processus métier collaboratifs identifiés dans le diagramme à l’étape 1. Cette modélisation est entreprise de façon macroscopique en représentant les processus par des diagrammes de cas d’utilisation UML.
 Chaque acteurs (personnes physiques et morales) avec leur périmètre d'activité est décrit dans le paragraphe 3.13.

#### "Cas d'utilisation "Demander DMI""

![](media/media/image5.png)

Figure 2 Cas d'utilisation "Demander DMI"

| | |
| :--- | :--- |
| Demander DMI | Le service utilisateur effectue une demande de DMI (ou plusieurs) dans le cadre d'une intervention programmée ou dans le cadre du réapprovisionnement de son stock de DMI en dotation ou en dépôt vente. Cette demande doit être enregistrée au sein du logiciel de traçabilité des DMI.Dans ce cas d'utilisation, le gestionnaire DMI analyse la demande au regard de la liste des dispositifs médicaux stériles implantables élaborés par la commission ou conférence médicale (COMEDIMS) d'établissement et dont l'utilisation est préconisée conformément à l'article R.6111-10 du code de la santé publique. |

Table 2 Table des cas d'utilisation

#### "Cas d'utilisation "Commander les DMI""

![](media/media/image6.png)

Figure 3 Cas d'utilisation "Commander les DMI"

| | |
| :--- | :--- |
| Commander les DMI | Après validation par le gestionnaire DMI de la demande du service utilisateur, la PUI effectue la commande des DMI.Le processus de commande des DMI gère les créations, les mises à jour ou les annulations de commandes. |

Table 3 Table des cas d'utilisation

#### "Cas d'utilisation "Réceptionner et contrôler les DMI""

![](media/media/image7.png)

Figure 4 Cas d'utilisation "Réceptionner et contrôler les DMI"

| | |
| :--- | :--- |
| Réceptionner et contrôler DMI | Le gestionnaire de réception assure l'admission des dispositifs commandés au sein de l'établissement. Il effectue une confrontation des bons de réception/livraison des DMI effectivement livrés. |

Table 4 Table des cas d'utilisation

#### "Cas d'utilisation "Réceptionner le DMI""

![](media/media/image8.png)

Figure 5 Cas d'utilisation "Réceptionner le DMI"

| | |
| :--- | :--- |
| Réceptionner le DMI | Le gestionnaire de réception assure également l'enregistrement des informations relatives aux DMI réceptionnés. Cette action nécessite l'utilisation d'un périphérique de douchage. Si aucune alerte sanitaire concerne les DMI reçus, le gestionnaire de réception enregistre l'entrée au stock au sein de l'établissement de santé des nouveaux DMI une fois la réception validée. |

Table 5 Table des cas d'utilisation

#### "Cas d'utilisation "Délivrer les DMI au service utilisateur""

![](media/media/image9.png)

Figure 6 Cas d'utilisation "Délivrer les DMI au service utilisateur"

| | |
| :--- | :--- |
| Délivrer DMI | La délivrance de DMI est réalisée par le gestionnaire DMI (i.e.: PUI) à destination du service utilisateur. Le gestionnaire DMI enregistre la sortie au stock de la PUI des DMI délivrés au service utilisateur. C'est le gestionnaire de réception du service utilisateur qui effectue l'admission des dispositifs au sein du service.- Si la PUI gère les dispositifs en stock alors le gestionnaire DMI fait appel au service logistique pour effectuer le transport des dispositifs à destination du service utilisateur.- Si la PUI gère les dispositifs hors stock ceux-ci étant physiquement dans le stock de proximité du service utilisateur mais sous la responsabilité de la PUI (informatiquement parlant les dispositifs sont considérés appartenir au stock de la PUI jusqu'à la délivrance) , le transport est dans ce cas inutile. |

Table 6 Table des cas d'utilisation

#### "Cas d'utilisation "Transporter DMI au sein de l'établissement""

![](media/media/image10.png)

Figure 7 Cas d'utilisation "Transporter DMI au sein de l'établissement"

| | |
| :--- | :--- |
| Transporter DMI | Un contrat définissant les règles et délais de transport doit être rédigé entre la PUI, les services utilisateurs et le service logistique assurant la livraison. La livraison doit s'effectuer dans des conditions permettant d'assurer la bonne conservation et l'intégrité des DMI.Les étapes de la livraison et le lieu de livraison sont tracés au sein du système d'information ce qui correspond à la traçabilité logistique. Les problèmes rencontrés lors de la livraison sont remontés à la PUI et enregistrés.Le gestionnaire de réception service utilisateur assure la bonne réception des dispositifs au sein du service utilisateur. |

Table 7 Table des cas d'utilisation

#### "Cas d'utilisation "Réceptionner les DMI par le service utilisateur""

![](media/media/image11.png)

Figure 8 Cas d'utilisation "Réceptionner les DMI par le service utilisateur"

| | |
| :--- | :--- |
| Réceptionner les DMI par le service utilisateur | Il s'agit pour le gestionnaire de réception du service utilisateur (ou cadre de l'unité de soins) d'enregistrer la réception de DMI dans les locaux de son service. Le cadre de l'unité de soins enregistre l'entrée en stock des DMI dans son service. Comme au sein de la PUI, les DMI sont détenus dans des conditions permettant d'assurer leur intégrité et leur stérilité. |

Table 8 Table des cas d'utilisation

#### "Cas d'utilisation "Poser les DMI""

![](media/media/image12.png)

Figure 9 Cas d'utilisation "Poser les DMI"

| | |
| :--- | :--- |
| Poser DMI | L'acte de pose de DMI est effectué par le service utilisateur chez la personne prise en charge dans le cadre d’une intervention chirurgicale ou médicale. Le service utilisateur trace les DMI posés. c'est à dire enregistre au sein du logiciel de traçabilité les informations nécessaires à la traçabilité de la pose des DMI (RPPS poseur, Finess Géographique, IPP patient, ...). Une traçabilité des DMI est réalisée en attribuant les lots concernés au numéro de séjour du patient.Si un défaut survient lors de l'utilisation du DMI, l'équipe médicale doit déclarer cet événement au correspondant de matériovigilance. Il est nécessaire de tracer tous les DMI non implantés suite aux échecs de pose. |

Table 9 Table des cas d'utilisation

#### "Cas d'utilisation "Facturation du DMI""

![](media/media/image13.png)

Figure 10 Cas d'utilisation "Facturation du DMI"

| | |
| :--- | :--- |
| Facturer DMI | Lors du processus de pose du (des) dispositifs, le service utilisateur informe la PUI des consommations de DMI.Le gestionnaire DMI assure durant ce processus les traitements engendrés par la consommation d'un DMI :- traitement financier dans le cas d'un dépôt vente (temporaire ou permanent)- et/ou une demande de réassort selon les règles de réassort en DMI auprès du fournisseur définies par l'établissement de santé.Les modalités de facturation doivent être intégrées au système de traçabilité des DMI. |

Table 10 Table des cas d'utilisation

#### "Cas d'utilisation "Tracer""

![](media/media/image14.png)

Figure 11 Cas d'utilisation "Tracer"

| | |
| :--- | :--- |
| Tracer | Ce processus permet de tracer un évènement au sein de l'établissement de santé. Cette traçabilité se déclenche dans plusieurs étapes afin de suivre le parcours DMI au sein de l’établissement de santé. Les évènements qui peuvent déclencher le processus de traçabilité de DMI sont les suivants:- Demande de DMI- Commande de DMI- Réception de DMI- Délivrance au service utilisateur- Transport de DMI- Réceptionner les DMI par le service utilisateur- Consommation de DMI (posé/non posé)- Facturation de DMICe processus réutilise le processus générique "Créer des traces" de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). |

Table 11 Table des cas d'utilisation

#### "Cas d'utilisation "Rechercher des traces""

![](media/media/image15.png)

Figure 12 Cas d'utilisation "Rechercher des traces"

| | |
| :--- | :--- |
| RechercherTraces | Un consommateur recherche les évènements de traçabilité liés à un ou plusieurs évènements de traçabilité.Ce processus réutilise le processus générique " Rechercher des traces" de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). |

Table 12 Table des cas d'utilisation

#### "Cas d'utilisation Consulter une trace"

![](media/media/image16.png)

Figure 13 Cas d'utilisation Consulter une trace

| | |
| :--- | :--- |
| ConsulterTrace | Ce processus réutilise le processus générique ""Consulter une trace"" de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). |

Table 13 Table des cas d'utilisation

#### Acteurs

| | |
| :--- | :--- |
| Source de traçabilité | Il s’agit d’un acteur système qui envoie les informations de traçabilité liées au parcours du DMI au sein de l’établissement de santé. |
| Gestionnaire de traçabilité | Il s’agit d’un acteur système (un système d'information ou un composant d'un système d'information) qui enregistre les informations de traçabilité liées au parcours du DMI au sein de l’établissement de santé. Le gestionnaire de traçabilité peut être, par exemple, un logiciel de traçabilité.Les acteurs humains derrière les différents systèmes sont multiples selon le cycle de vie du DMI au sein de l’établissement de santé. Cela peut concerner les acteurs rattachés à la pharmacie, rattachés au plateau technique de pose, à la gestion de la réception, etc.Cette étude métier traite le gestionnaire de traçabilité comme un acteur à part pour une meilleure compréhension du processus. Ceci ne contraint pas la mise en œuvre de cet acteur en tant qu'une fonctionnalité interne au système d'information de chaque service (pharmacie, bloc, etc.). Dans ce cas, un module d'agrégation est nécessaire afin d'agréger les informations de traçabilité dans chaque système d'information afin pour en créer une vue générique sur la traçabilité de DMI le long de la chaine d'approvisionnement au sein d'un établissement de santé. |
| Consommateur | Il s'agit d'un acteur système interne ou externe habilité à accéder aux évènements de traçabilité des DMI.Les acteurs humains derrière le consommateur sont multiples et peuvent être des personnes rattachées à la pharmacie, au plateau technique de pose, au service de comptabilité, etc. |
| Fournisseur | Il s'agit de la personne morale responsable de la fourniture des DMI (fabricant ou distributeur) lorsqu'ils sont commandés par l'établissement de santé ou de la mise à disposition des DMI selon les termes de l'accord passé entre le fournisseur et l'établissement de santé. |
| Gestionnaire DMI | Le gestionnaire de DMI est un acteur système qui remplit plusieurs fonctions et qui assure la gestion et la traçabilité de DMI au sein de l'établissement de santé. Les responsabilités principales du gestionnaire DMI sont:- Traiter la demande du service utilisateur d'un ou de plusieurs DMI pour une intervention chirurgicale ou médicale.- Commander de DMI auprès du fournisseur. Dans ce rôle, le gestionnaire DMI gère les créations, les mises à jour ou les annulations des commandes. Il assure également le déclenchement du règlement de la facture. L’article. L.5126-5 du CSP précise que, dans le cadre des missions des PUI, les pharmaciens assurent les actes d’exécution des marchés, pour l’approvisionnement en produits pharmaceutiques : médicaments et dispositifs médicaux stériles (DMS) et qu’il ne s’agit pas d’une délégation de compétence.- Réceptionner le(s) DMI. Dans ce rôle, le gestionnaire DMI assure la réception et l’enregistrement des informations de DMI réceptionnés. L’admission des fournitures sera prononcée par le pharmacien responsable ou son représentant pour s’assurer de la conformité des produits avec les règles du Code de la santé publique (CSP) et du Code des marchés publics (CMP).- Délivrer DMI au service utilisateur. Le gestionnaire DMI, dans ce rôle, assure la délivrance de DMI au plateau technique de pose. Il trace la sortie du stock.- Déclencher l'autorisation de paiement: dans ce rôle, le gestionnaire DMI assure les traitements engendrés par la consommation d'un DMI. Ceci se caractérise par le déclenchement du traitement financier dans le cas d'un dépôt-vente (temporaire ou permanent), et/ou une demande de réassort selon les règles de réassort définies par l'établissement de santé. Ainsi, ce gestionnaire déclenche le règlement de la facture auprès du gestionnaire de comptabilité afin que le fournisseur procède à la facturation des DMI.Dans cette étude, l'acteur humain derrière le gestionnaire DMI est le magasinier, le préparateur en pharmacie ou le pharmacien responsable de la PUI. |
| Gestionnaire de réception | Il s’agit de la personne physique ou morale responsable du contrôle de la livraison de DMI lorsqu’ils sont commandés à un (des) fournisseur(s) par l’établissement de santé. |
| Gestionnaire de réception service utilisateur | Il s’agit de la personne physique ou morale (Agent de l'unité de soin ou Préparateur) responsable de réceptionner les DMI au sein du service utilisateur. |
| Gestionnaire de comptabilité | Le gestionnaire de comptabilité est un acteur système assurant le règlement du paiement du fournisseur de DMI.L’acteur humain derrière la gestion comptable peut-être par exemple le service financier (trésorerie) ou le service achat de l’établissement. |
| Service logistique | Le service logistique assure le transport de la livraison des commandes destinées aux unités de soins ou toute autre unité (services médico-techniques, services administratifs et techniques, ...). |
| Service utilisateur | Il s’agit du service ayant la responsabilité de l'implantation du DMI chez le patient.Il est identifié dans la structure de l'établissement de santé par le nom du service et le code U.F. de responsabilité médicale autorisée à poser le dispositif dans le patient. |

Table 14 Table des acteurs

### Description du processus collaboratif et identification des flux

#### Demander DMI

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.
 Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image17.png)

Figure 14 : Diagramme d'activité Demander DMI

##### Actions

| | |
| :--- | :--- |
| Initier une demande de DMI | Cette action consiste à initier une demande d'un ou plusieurs DMI par le service utilisateur au gestionnaire DMI.A noter que, sauf cas exceptionnel dûment justifié, le DMI demandé doit figurer dans le livret du médicament et du dispositif médical fixé par la COMEDIMS (Commission du Médicament et des Dispositifs Médicaux Stériles). |
| Traiter la réponse | Le service utilisateur reçoit la réponse du gestionnaire DMI et la traite. |
| Enregistrer la demande de DMI | Cette action est détaillée dans le processus « Tracer » avec le service utilisateur qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la demande des DMI par le service utilisateur et les envoie au gestionnaire de traçabilité. |
| Enregistrer la réponse de la PUI | Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la réponse à la demande des DMI par le service utilisateur et les envoie au gestionnaire de traçabilité. |
| Supprimer la demande DMI |  |

Table 15 Actions du Diagramme d'activité Demander DMI

##### Activités structurées

| | |
| :--- | :--- |
| Traiter la demande de DMI | Le gestionnaire DMI reçoit le flux de demande de DMI qui peut être soit une création, soit une mise à jour ou une suppression de demande de DMI.- Pour la création/mise à jour de demande de DMI. Il traite le flux de demande en vérifiant la disponibilité en stock des DMI demandés.Une réponse de la part du gestionnaire DMI informe le service utilisateur de la disponibilité ou de l'indisponibilité totale ou partielle en stock des DMI demandés.Deux cas sont possibles :1) Si la quantité demandée est inférieure ou égale à la quantité disponible au stock de la PUI :Le gestionnaire DMI envoie les DMI demandés au service utilisateur selon le circuit de logistique interne de l’établissement. Le processus «Délivrer les DMI au service utilisateur» est alors déclenché.2) Si la quantité demandée est supérieure à la quantité disponible au stock de la PUI :Le gestionnaire DMI crée une commande à destination du fournisseur pour les DMI manquants. Le processus « Commander les DMI » est alors déclenché.La réponse véhicule la référence à demande initiale et informe le service utilisateur de la quantité disponible ainsi que la date de délivrance prévue pour chaque modèle DMI, en tenant compte si nécessaire du délai que prend la commande au fournisseur.- Pour la suppression de la demande de DMI, le gestionnaire DMI annule la demande créée au préalable par le service utilisateur. |

Table 16 Activités structurées du Diagramme d'activité Demander DMI

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 2 - ReponseDemandeDMI | Ce flux permet au service utilisateur d'avoir des informations sur le traitement de leur demande. |
| Flux 2a - TracabiliteReponse | Ce flux permet d'enregistrer la réponse du gestionnaire DMI au sein du gestionnaire de traçabilité. |
| Flux 1 - DemandeDMI | Ce flux porte les informations de création, de mise à jour ou de suppression d'une demande de DMI. |
| Flux 1c - TracabiliteDemande | Ce flux permet d'enregistrer la demande de DMI au sein du gestionnaire de traçabilité. |

Table 17 Flux identifiés du Diagramme d'activité Demander DMI

#### Commander DMI

##### Workflow de l'activité

Le processus de commande de DMI est activé lorsqu’une des conditions ci-dessous est remplie :

* le Service Utilisateur souhaite préparer une intervention nécessitant une pose de DMI pour une personne prise en charge et les DMI ne sont pas disponibles en stock.
* le stock de DMI atteint le stock alerte ce qui déclenche le besoin de réassort qui peut être éventuellement automatique. Ces cas concernent le réapprovisionnement sur seuil.
* la date fixée pour le réassort est atteinte dans le cas d’un approvisionnement sur échéancier.

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.
 Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image18.png)

Figure 15 : Diagramme d'activité Commander les DMI

##### Actions

| | |
| :--- | :--- |
| Initier une commande | Le gestionnaire DMI crée une commande sur la base de critères prédéfinis et l'envoie au fournisseur.A noter que, sauf cas exceptionnel dûment justifié, le DMI demandé doit figurer dans le livret du médicament et du dispositif médical fixé par la COMEDIMS. |
| Enregistrer la commande de DMI | Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la commande des DMI par la PUI et les envoie au gestionnaire de traçabilité. |

Table 18 Actions du Diagramme d'activité Commander les DMI

##### Activités structurées

| | |
| :--- | :--- |
| Traiter la commande | Le fournisseur reçoit la commande et la traite. Il prépare les DMI commandés et les envoie via son circuit logistique au lieu de livraison précisé par le gestionnaire DMI.A préciser que les mécanismes d’identification des DMI par le fournisseur vis-à-vis du catalogue interne de l’établissement de santé sont hors périmètre de la présente étude. Ainsi, le(s) flux dématérialisé(s) engendrés par le circuit de livraison à l’établissement de santé ne sont pas spécifiés dans ce document. |

Table 19 Activités structurées du Diagramme d'activité Commander les DMI

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 3 - CommandeDMI | Ce flux contient les informations nécessaires pour que le gestionnaire DMI passe une commande auprès de son fournisseur. |
| Flux 27 - TracabiliteCommande | Ce flux permet d'enregistrer la commande de DMI au sein du gestionnaire de traçabilité. |

Table 20 Flux identifiés du Diagramme d'activité Commander les DMI

#### Réceptionner et contrôler DMI

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.
 Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image19.png)

Figure 16 : Diagramme d'activité Réceptionner et contrôler DMI

##### Actions

| | |
| :--- | :--- |
| Livrer le(s) DMI commandé(s) à l'établissement de santé | Le fournisseur livre le(s) DMI commandé(s) au gestionnaire de réception selon le circuit logistique défini. |
| Vérifier la conformité de la livraison par rapport aux bons de commande/livraison | Cette action permet au gestionnaire de réception de confronter les bons de commande et de livraison aux DMI effectivement livrés. Le gestionnaire de réception a pour obligation de vérifier la conformité de la marchandise livrée au moment de la livraison avant de signer le bon de livraison. |
| Enregistrer le rejet de la reception du (des) DMI | Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité du rejet de la totalité de la livraison et les envoie au gestionnaire de traçabilité. |
| Enregistrer la validité du rapprochement | Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la validité de la totalité de la livraison par rapport au bon de livraison des DMI et les envoie au gestionnaire de traçabilité. |

Table 21 Actions du Diagramme d'activité Réceptionner et contrôler DMI

##### Activités structurées

| | |
| :--- | :--- |
| Pour chaque DMI livré | Par cette action, le gestionnaire de réception passe en revue la liste des DMI livrés.En s'assurant que le DMI livré n'est pas assujetti à une alerte sanitaire. Cette sous activité permet l'intégration de chaque DMI au sein d'une base de données "référentielle" qui doit être partagée par l'ensemble des services utilisateurs, et être utilisée par tous les logiciels d'aval (par exemple celui permettant de tracer sa pose). |

Table 22 Activités structurées du Diagramme d'activité Réceptionner et contrôler DMI

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 4 - LivraisonDMI | Ce flux porte les informations envoyées vers le gestionnaire de réception concernant la livraison par le fournisseur du (des) DMI. Cette livraison étant valide ou rejetée. |
| Flux 5 - TracabiliteLivraisonValide | Ce flux permet au gestionnaire de réception de tracer la conformité de la totalité de la commande de DMI par rapport aux bons de livraison dans le gestionnaire de traçabilité. |
| Flux 5a - TracabiliteLivraisonRejet | Ce flux permet au gestionnaire de réception de tracer l'incohérence de la livraison avec les bons de réception des DMI dans le gestionnaire de traçabilité. |

Table 23 Flux identifiés du Diagramme d'activité Réceptionner et contrôler DMI

#### Réceptionner le DMI

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.
 Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image20.png)

Figure 17 : Diagramme d'activité Réceptionner le DMI

##### Actions

| | |
| :--- | :--- |
| Enregistrer l'entrée au stock au sein de l'établissement du DMI | Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de l'entrée au stock au sein de l'établissement du DMI et les envoie au gestionnaire de traçabilité.Que les DMI soient gérés en "stock" ou "hors-stock" par la PUI, les DMI sont sous la responsabilité de la PUI qui les enregistre dans son système d'information. |
| Enregistrer le rejet du DMI | Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité du rejet de la réception du DMI et les envoie au gestionnaire de traçabilité. |
| Vérifier qu'aucune alerte sanitaire ne porte sur le DMI | Cette action permet au gestionnaire de réception de contrôler qu'aucunes alertes ou rappels de lots ne concernent le DMI. |
| Enregistrer la réception du DMI | Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la réception du DMI et les envoie au gestionnaire de traçabilité. |

Table 24 Actions du Diagramme d'activité Réceptionner le DMI

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 5e - TracabiliteRejetDMI | Ce flux permet au gestionnaire de réception de tracer la cause du rejet de la réception du DMI dans le gestionnaire de traçabilité. |
| Flux 5b - ReceptionUnitaireDMI | Ce flux véhicule les informations du DMI livré pour qu'il soit délivré par le gestionnaire DMI. |
| Flux 5d - TracabiliteReceptionDMI | Ce flux permet au gestionnaire de réception de tracer la réception du DMI au sein de l'établissement dans le gestionnaire de traçabilité. |
| Flux 5c - TracabiliteEntreeStockDMI | Ce flux permet au gestionnaire de réception de tracer l'entrée au stock au sein de l'établissement du nouveau DMI dans le gestionnaire de traçabilité. |

Table 25 Flux identifiés du Diagramme d'activité Réceptionner le DMI

#### Délivrer DMI au service utilisateur

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.
 Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image21.png)

Figure 18 : Diagramme d'activité Délivrer DMI au Service Utilisateur

##### Actions

| | |
| :--- | :--- |
| Délivrer le(s) DMI | Le gestionnaire DMI délivre le(s) DMI demandé(s) à destination du service utilisateur.L'ensemble des données relatives à la délivrance des DMI sont enregistrées par la PUI. |
| Tracer la délivrance du (des) DMI | Le gestionnaire DMI trace la délivrance au service utilisateur du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. |
| Enregistrer la sortie du stock au sein de la PUI du (des) DMI | Le gestionnaire DMI trace la sortie du stock de la PUI du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. |

Table 26 Actions du Diagramme d'activité Délivrer DMI au Service Utilisateur

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 6a - TracabiliteSortieStock | Ce flux permet au gestionnaire de DMI de tracer la sortie du stock de la PUI du (des) DMI délivrés. |
| Flux 7 - TracabiliteDelivranceSU | Ce flux permet au service utilisateur de tracer la délivrance du (des) DMI au service utilisateur. |
| Flux 6 - DelivranceSU | Ce flux porte les informations de délivrance des DMI au service utilisateur. |

Table 27 Flux identifiés du Diagramme d'activité Délivrer DMI au Service Utilisateur

#### Transporter DMI

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.
 Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image22.png)

Figure 19 : Diagramme d'activité Transporter DMI

##### Actions

| | |
| :--- | :--- |
| Initier la livraison du (des) DMI à destination du service utilisateur | Après la réalisation du processus de délivrance du (des) DMI au service utilisateur. Le gestionnaire DMI déclenche une demande de transport de celui(ceux)-ci auprès du service logistique de l'établissement.Le service logistique assure le transport du (des) DMI. La livraison doit s'effectuer dans des conditions permettant d'assurer la bonne conservation et l'intégrité du (des) DMI.L'anonymat des patients doit être respecté durant cette étape, lorsque le DMI est destiné à un patient particulier. |
| Enregistrer le transport du (des) DMI | Cette action est détaillée dans le processus « Tracer » avec le service logistique qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité du transport du (des) DMI et les envoie au gestionnaire de traçabilité.Les étapes de la livraison, le lieu de livraison ainsi que les incidents éventuels survenus durant le transport sont tracés au sein du système de traçabilité. |

Table 28 Actions du Diagramme d'activité Transporter DMI

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 8 - TransportDMI | Ce flux porte les informations de livraison du (des) DMI à destination du service utilisateur.Tout incident de transport est mentionné dans le flux. |
| Flux 9 - TracabiliteTransportDMI | Ce flux permet au gestionnaire DMI de tracer le transport du (des) DMI dans le gestionnaire de traçabilité. |

Table 29 Flux identifiés du Diagramme d'activité Transporter DMI

#### Réceptionner DMI par le service utilisateur

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.
 Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image23.png)

Figure 20 : Diagramme d'activité Réceptionner DMI par le service utilisateur

##### Actions

| | |
| :--- | :--- |
| Livrer le(s) DMI commandé(s) au service utilisateur | Le gestionnaire de réception du service utilisateur (SU) fait un rapprochement entre la demande réalisée auprès de la PUI et les DMI effectivement livrés au service utilisateur. Ce rapprochement est réalisé par le service utilisateur sur la base des données relatives à la délivrance, transmises par la PUI dans le système d’information.Le gestionnaire de réception SU accepte ou refuse le DMI (par exemple en cas d'erreur de la PUI ou du transporteur, si le DMI réceptionné n'est pas conforme et/ou ne correspond pas au DMI qui avait été demandé). |
| Réceptionner le (les) DMI | Le gestionnaire de réception du service utilisateur enregistre la réception du (des) DMI dans ses locaux. |
| Tracer la réception du (des) DMI | Le gestionnaire de réception du service utilisateur trace la réception du (des) DMI au sein du service utilisateur. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception du service utilisateur qui représente, dans ce cas, la source de traçabilité. |
| Enregistrer l'entrée au stock au sein du service utilisateur du (des) DMI | Le gestionnaire de réception du service utilisateur enregistre le rejet du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception du service utilisateur qui représente, dans ce cas, la source de traçabilité. |
| Enregistrer le rejet du (des) DMI | Le gestionnaire de réception du service utilisateur enregistre le rejet du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception du service utilisateur qui représente, dans ce cas, la source de traçabilité. |

Table 30 Actions du Diagramme d'activité Réceptionner DMI par le service utilisateur

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 11 - TracabiliteEntreeStockSU | Ce flux permet au gestionnaire de réception du service utilisateur de tracer l'entrée au stock du service utilisateur du (des) DMI réceptionnés. |
| Flux 12 - TracabiliteReceptionSU | Ce flux permet au service utilisateur de tracer la réception du (des) DMI dans leurs locaux. |
| Flux 10 - ReceptionSU | Ce flux porte les informations de réception du (des) DMI au sein du service utilisateur. |
| Flux 28 - TracabiliteRejetDMI | Ce flux permet au gestionnaire de réception du service utilisateur de tracer la cause du rejet de la réception du DMI dans le gestionnaire de traçabilité. |

Table 31 Flux identifiés du Diagramme d'activité Réceptionner DMI par le service utilisateur

#### Poser DMI

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.
 Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image24.png)

Figure 21 : Diagramme d'activité Poser DMI

##### Actions

| | |
| :--- | :--- |
| Poser le DMI chez le patient | Le service utilisateur entreprend la pose du DMI chez le patient. Cette action donne lieu à la traçabilité de la pose ou de l'échec de pose, et la déclaration de la consommation du DMI à la PUI.En cas d'échec de pose, le service utilisateur doit déclarer également les DMI dont la pose a échoué précisant le motif de l’échec de pose. |
| Enregistrer le DMI posé | Cette action est détaillée dans le processus « Tracer » avec le service utilisateur qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la pose du DMI chez la personne prise en charge et les envoie au gestionnaire de traçabilité.Précision:- Les informations d’identité du patient retrouvées dans le gestionnaire de traçabilité sont alimentées et mises à jour automatiquement à partir du référentiel d’identité des patients de l’établissement ou manuellement en scannant l’étiquette du patient (code barre avec le numéro de séjour). Les flux d’échanges concernant l’identité du patient sont hors périmètre de cette étude métier. |
| Déclarer l'echec de la pose du DMI | Le service utilisateur trace l'échec de pose du DMI. Cette action est détaillée dans le processus « Tracer » avec le service utilisateur qui représente, dans ce cas, la source de traçabilité.Pour tout défaut survenant lors de l'utilisation du DMI l'équipe médicale doit également déclarer cet événement au correspondant local de matériovigilance. |
| Vérifier le DMI au sein du plateau technique | A la réception du DMI au plateau technique de pose, le service utilisateur contrôle :- que le dispositif est bien celui prévu pour l'opération du patient,- qu'aucunes alertes ou rappels de lots ne concernent le dispositif,- que le dispositif n'est pas endommagé et qu'il est toujours stérile.Si ces critères sont satisfaits, alors le processus de pose continue. Dans le cas contraire, il y a arrêt de l'opération avec le déclenchement d'un évènement de trace. |
| Déclarer le refus d'utilisation du DMI | Le service utilisateur trace le refus de l'utilisation du DMI pour l'opération chirurgicale. Cette action est détaillée dans le processus « Tracer » avec le service utilisateur qui représente, dans ce cas, la source de traçabilité.Pour tout défaut survenant lors de l'utilisation du DMI l'équipe médicale doit également déclarer cet événement au correspondant local de matériovigilance. |
| Enregistrer la sortie du stock au sein du service utilisateur du (des) DMI | Le service utilisateur enregistre la sortie du stock du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le service utilisateur qui représente, dans ce cas, la source de traçabilité. |

Table 32 Actions du Diagramme d'activité Poser DMI

##### Activités structurées

| | |
| :--- | :--- |
| Informer la PUI de la consommations du DMI | Le service utilisateur informe de la consommation du DMI au gestionnaire DMI. Ce dernier peut déclencher la procédure financière dans le cas de DMI gérés en dépôt-vente (temporaire ou permanent), et/ou une demande de réassort selon les règles de réassort définies par l'établissement de santé.A noter que dans le cas des DMI gérés en dépôt vente, ceux-ci deviennent la propriété de l'établissement au moment de leur utilisation. |

Table 33 Activités structurées du Diagramme d'activité Poser DMI

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 15 -TracabilitePose | Ce flux permet au service utilisateur de tracer l'acte de pose du DMI chez le patient. |
| Flux 14 - TracabiliteEchecPose | Ce flux porte les informations de traçabilité de l'échec de pose du DMI. |
| Flux 13 - ConsommationDMI | Ce flux permet au service utilisateur- d'informer le gestionnaire DMI que le DMI est consommé,- alimenter le dossier patient informatisé, le dossier pharmaceutique, la lettre de liaison, dossier médical partagé. |
| Flux 13a - TracabiliteRefusDMI | Ce flux porte les informations de traçabilité du refus de l'utilisation du DMI au plateau technique. |
| Flux 30 - TracabiliteSortieStockSU | Ce flux permet au service utilisateur de tracer la sortie du stock du service utilisateur du (des) DMI. |

Table 34 Flux identifiés du Diagramme d'activité Poser DMI

#### Facturer DMI (dépôt-vente)

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.

Préconditions :

* Réception de l’information de pose des DMI (pose ou échec de pose) envoyée par le service utilisateur au gestionnaire DMI.

Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image25.png)

Figure 22 : Diagramme d'activité Facturer DMI (dépôt-vente)

##### Actions

| | |
| :--- | :--- |
| Valider l'acquisition | Le gestionnaire DMI informe le fournisseur de la consommation des DMI. |
| Facturer les DMI | Sur la base des DMI déclarés comme consommés, le fournisseur établit la facture des DMI et la transmet au gestionnaire DMI qui vérifie les éléments facturés. |
| Déclencher le paiement de la facture | Le gestionnaire de comptabilité déclenche le processus de paiement de la facture. |
| Donner l'accord de paiement | Le gestionnaire DMI donne au gestionnaire de comptabilité l’accord de paiement du fournisseur sur la base de la facture transmise par ce dernier. |
| Enregistrer les modalités de facturation | Le gestionnaire DMI trace les modalités de facturation du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. |
| Demander un réassort en DMI | Le déclenchement de cette action dépend d'une part du mode de gestion du stock et d'autre part de la gestion des réapprovisionnements de la PUI.Le gestionnaire DMI effectue une demande de réassort en DMI auprès du fournisseur selon les règles de réassort définies par l'établissement de santé. |
| Enregistrer la demande de réassort | Le gestionnaire DMI trace la demande de réassort en DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. |

Table 35 Actions du Diagramme d'activité Facturer DMI (dépôt-vente)

##### Activités structurées

| | |
| :--- | :--- |
| Réassort en DMI | Le pharmacien gérant de la PUI déclenche l'action "Demander un réassort en DMI". |

Table 36 Activités structurées du Diagramme d'activité Facturer DMI (dépôt-vente)

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 3 - CommandeDMI | Ce flux permet au gestionnaire DMI de déclencher une demande de réassort en DMI auprès du fournisseur. |
| Flux 16a - TracabiliteReassortDMI | Ce flux porte les informations de traçabilité de demande de réassort en DMI. |
| Flux 13 - ConsommationDMI | Ce flux permet au gestionnaire DMI de déclaré le (les) DMI consommés auprès du fournisseur. |
| Flux 18 - TracabiliteFacturationDMI | Ce flux porte les informations de traçabilité de la facturation du (des) DMI. |
| Flux 17 - AutorisationPaiement | Ce flux permet au gestionnaire DMI de donner son accord (ou non) pour le paiement de la facture auprès du gestionnaire de comptabilité. |

Table 37 Flux identifiés du Diagramme d'activité Facturer DMI (dépôt-vente)

#### Facturer DMI (achat)

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.

Préconditions:
 Réception de l’information de validation de la réception des DMI envoyée par le gestionnaire DMI au gestionnaire de comptabilité.

Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image26.png)

Figure 23 : Diagramme d'activité Facturer DMI (achat)

##### Actions

| | |
| :--- | :--- |
| Donner l’accord de paiement | Le gestionnaire DMI donne au gestionnaire de comptabilité l’accord de paiement du fournisseur sur la base de la facture transmise par ce dernier. |
| Déclencher le paiement de la facture | Le gestionnaire de comptabilité déclenche le processus de paiement de la facture. |
| Enregistrer les modalités de facturation | Le gestionnaire DMI trace les modalités de facturation du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. |

Table 38 Actions du Diagramme d'activité Facturer DMI (achat)

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 18 - TracabiliteFacturationDMI | Ce flux porte les informations de traçabilité de la facturation du (des) DMI |
| Flux 17 : AutorisationPaiement | Ce flux permet au gestionnaire DMI de donner son accord (ou non) pour le paiement de la facture auprès du gestionnaire de comptabilité. |

Table 39 Flux identifiés du Diagramme d'activité Facturer DMI (achat)

#### Tracer

##### Workflow de l'activité

Ce processus permet de modéliser la traçabilité d'un évènement.

Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image27.png)

Figure 24 : Diagramme d'activité Tracer

##### Actions

| | |
| :--- | :--- |
| Envoyer les informations de traçabilité | Cette action consiste à envoyer, pour un évènement, les informations de traçabilité au gestionnaire de traçabilité. |
| Enregistrer les informations de traçabilité | Cette action consiste à recevoir et enregistrer les informations de traçabilité du DMI. |

Table 40 Actions du Diagramme d'activité Tracer

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 22 - TransmissionTrace | Ce flux permet de transmettre les informations de traçabilité d'un évènement. |

Table 41 Flux identifiés du Diagramme d'activité Tracer

#### Rechercher des traces

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.

Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image28.png)

Figure 25 : Diagramme d'activité Rechercher des traces

##### Actions

| | |
| :--- | :--- |
| Rechercher les traces d'un ou plusieurs DMI | Le consommateur demande à rechercher les traces d'un ou plusieurs DMI commandé et/ou acquis et/ou utilisé par l'établissement. |
| Traiter la recherche des traces | Le gestionnaire de traçabilité reçoit et traite la recherche. |
| Traiter le retour du gestionnaire de traçabilité | Le consommateur reçoit et traite le retour du gestionnaire de traçabilité. |

Table 42 Actions du Diagramme d'activité Rechercher des traces

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 23 - RechercheTraces | Ce flux porte les critères pour rechercher un ou plusieurs évènements de traçabilité |
| Flux 24 - ReponseRechercheTraces | Ce flux porte les informations répondant à la requête du Flux 23. |

Table 43 Flux identifiés du Diagramme d'activité Rechercher des traces

#### Consulter une trace

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.

Se référer au Tableau 14 pour la définition des acteurs.

![](media/media/image29.png)

Figure 26 : Diagramme d'activité Consulter une trace

##### Actions

| | |
| :--- | :--- |
| Demander à consulter la trace d'un évènement | Le consommateur demande à consulter la trace d'un évènement. |
| Traiter la demande de consultation d'une trace | Le gestionnaire de traçabilité reçoit et traite la demande de recherche de l'évènement de trace à consulter. |
| Traiter le retour du gestionnaire de traçabilité | Le consommateur reçoit et traite le retour du gestionnaire de traçabilité. |

Table 44 Actions du Diagramme d'activité Consulter une trace

##### Flux identifiés

| | |
| :--- | :--- |
| Flux 25 - ConsulterTrace | Ce flux porte les informations pour consulter un évènement de traçabilité. |
| Flux 26 - ReponseConsulterTrace | Ce flux porte les informations répondant à la requête du Flux 25. |

Table 45 Flux identifiés du Diagramme d'activité Consulter une trace

#### Synthèse des flux

| | |
| :--- | :--- |
| Flux 1 - DemandeDMI | Ce flux porte les informations de création, de mise à jour ou de suppression d'une demande de DMI. |
| Flux 1c - TracabiliteDemande | Ce flux permet d'enregistrer la demande de DMI au sein du gestionnaire de traçabilité. |
| Flux 2 - ReponseDemandeDMI | Ce flux permet au service utilisateur d'avoir des informations sur le traitement de leur demande. |
| Flux 2a - TracabiliteReponse | Ce flux permet d'enregistrer la réponse du gestionnaire DMI au sein du gestionnaire de traçabilité. |
| Flux 3 - CommandeDMI | Ce flux contient les informations nécessaires pour que le gestionnaire DMI passe une commande auprès de son fournisseur. |
| Flux 27 - TracabiliteCommande | Ce flux permet d'enregistrer la commande de DMI au sein du gestionnaire de traçabilité. |
| Flux 4 - LivraisonDMI | Ce flux porte les informations envoyées vers le gestionnaire de réception concernant la livraison par le fournisseur du (des) DMI. Cette livraison étant valide ou rejetée. |
| Flux 5 - TracabiliteLivraisonValide | Ce flux permet au gestionnaire de réception de tracer la conformité de la totalité de la commande de DMI par rapport aux bons de livraison dans le gestionnaire de traçabilité. |
| Flux 5a - TracabiliteLivraisonRejet | Ce flux permet au gestionnaire de réception de tracer l'incohérence de la livraison avec les bons de réception des DMI dans le gestionnaire de traçabilité. |
| Flux 5e - TracabiliteRejetDMI | Ce flux permet au gestionnaire de réception de tracer la cause du rejet de la réception du DMI dans le gestionnaire de traçabilité. |
| Flux 5b - ReceptionUnitaireDMI | Ce flux véhicule les informations du DMI livré pour qu'il soit délivré par le gestionnaire DMI. |
| Flux 5d - TracabiliteReceptionDMI | Ce flux permet au gestionnaire de réception de tracer la réception du DMI au sein de l'établissement dans le gestionnaire de traçabilité. |
| Flux 5c - TracabiliteEntreeStockDMI | Ce flux permet au gestionnaire de réception de tracer l'entrée au stock au sein de l'établissement du nouveau DMI dans le gestionnaire de traçabilité. |
| Flux 6a - TracabiliteSortieStock | Ce flux permet au gestionnaire de DMI de tracer la sortie du stock de la PUI du (des) DMI délivrés. |
| Flux 7 - TracabiliteDelivranceSU | Ce flux permet au service utilisateur de tracer la délivrance du (des) DMI au service utilisateur. |
| Flux 6 - DelivranceSU | Ce flux porte les informations de délivrance des DMI au service utilisateur. |
| Flux 8 - TransportDMI | Ce flux porte les informations de livraison du (des) DMI à destination du service utilisateur.Tout incident de transport est mentionné dans le flux. |
| Flux 9 - TracabiliteTransportDMI | Ce flux permet au gestionnaire DMI de tracer le transport du (des) DMI dans le gestionnaire de traçabilité. |
| Flux 11 - TracabiliteEntreeStockSU | Ce flux permet au gestionnaire de réception du service utilisateur de tracer l'entrée au stock du service utilisateur du (des) DMI réceptionnés. |
| Flux 12 - TracabiliteReceptionSU | Ce flux permet au service utilisateur de tracer la réception du (des) DMI dans leurs locaux. |
| Flux 10 - ReceptionSU | Ce flux porte les informations de réception du (des) DMI au sein du service utilisateur. |
| Flux 28 - TracabiliteRejetDMI | Ce flux permet au gestionnaire de réception du service utilisateur de tracer la cause du rejet de la réception du DMI dans le gestionnaire de traçabilité. |
| Flux 15 -TracabilitePose | Ce flux permet au service utilisateur de tracer l'acte de pose du DMI chez le patient. |
| Flux 14 - TracabiliteEchecPose | Ce flux porte les informations de traçabilité de l'échec de pose du DMI. |
| Flux 13 - ConsommationDMI | Ce flux permet au service utilisateur- d'informer le gestionnaire DMI que le DMI est consommé,- alimenter le dossier patient informatisé, le dossier pharmaceutique, la lettre de liaison, dossier médical partagé. |
| Flux 13a - TracabiliteRefusDMI | Ce flux porte les informations de traçabilité du refus de l'utilisation du DMI au plateau technique. |
| Flux 30 - TracabiliteSortieStockSU | Ce flux permet au service utilisateur de tracer la sortie du stock du service utilisateur du (des) DMI. |
| Flux 22 - TransmissionTrace | Ce flux permet de transmettre les informations de traçabilité d'un évènement. |
| Flux 23 - RechercheTraces | Ce flux porte les critères pour rechercher un ou plusieurs évènements de traçabilité |
| Flux 24 - ReponseRechercheTraces | Ce flux porte les informations répondant à la requête du Flux 23. |
| Flux 25 - ConsulterTrace | Ce flux porte les informations pour consulter un évènement de traçabilité. |
| Flux 26 - ReponseConsulterTrace | Ce flux porte les informations répondant à la requête du Flux 25. |

Table 46 Description du processus collaboratif et identification des flux

### Elaboration des modèles hiérarchiques des flux structurés

Les flux échangés par les acteurs lors des processus métier collaboratifs ont été identifiés, définis et décrits dans les étapes 1, 2, 3 et 4.
 Le but de cette étape est d'élaborer pour chaque flux décris dans l'épate 4, la modélisation des données. La liste de ces items intervenant dans la modélisation sont rendus opposables par l'arrêté du 8 septembre 2021, applicable à compter du 26 mai 2022 (cf "Arrêté du 8 septembre 2021 relatif au management de la qualité du circuit des dispositifs médicaux implantables dans les établissements de santé et les installations de chirurgie esthétique").

Le modèle est formalisé par un diagramme de classes UML pour chaque flux faisant partie du périmètre de l’étude métier. La représentation formalisée du flux doit prendre en compte les trois exigences suivantes:

* les données sont modélisées en cohérence avec le Modèle des Objets de Santé (MOS) et les nomenclatures associées (NOS) gérés par l'ANS :
 MOS : https://esante.gouv.fr/interoperabilite/mos-nos
 NOS: https://esante.gouv.fr/interoperabilite/mos-nos/nos
* réutilisation des types de données (classes) mis à disposition dans le MOS
* définition des associations, y compris leurs cardinalités, entre les classes en respectant les besoins métier.

#### Flux 1 - DemandeDMI

Cette section présente le diagramme de classes du Flux 1 - DemandeDMI. Ce flux concerne la création, la mise à jour ou la suppression d'une demande de DMI envoyée au gestionnaire DMI par le service utilisateur.

![](media/media/image30.png)

Figure 27 Flux 1 - DemandeDMI

##### Classe "Demande"

| | |
| :--- | :--- |
| reference : [1..1] Identifiant | Référence unique de la demande (qui peut être une référence interne dans ce flux). Cet identifiant peut être généré automatique au moment de la soumission de la demande. Ainsi, il peut ne pas être contenu dans le flux de création d'une demande DMI. |
| natureDemande : [0..1] Texte | Il s'agit de la nature de la demande de DMI. Dans ce flux, il s'agit d'une demande interne du service utilisateur. |
| quantiteTotale : [1..1] Numerique | Il s'agit de la quantité totale des DMI concernés par la demande. |
| dateDem : [1..1] DateHeure | Il s'agit de la date de la demande par le service utilisateur. |
| supprDemande : [0..1] boolean | Indicateur pour avertir le gestionnaire DMI que la demande de DMI est à supprimer.1 : la demande de DMI est supprimée, 0 : dans le cas contraire |
| motifSuppr : [0..1] Texte | Informations relatives à la suppression de la demande de DMI. |
| infoCompl : [0..1] Texte | Toute information complémentaire concernant le traitement de la demande de DMI. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 47 Attributs de la classe "Demande"

##### Classe "Ligne"

| | |
| :--- | :--- |
| idLigneAssocieeEntete : [0..1] Identifiant | Identifiant commun à toutes les lignes associées à la même entête de Demande. |
| dateUtilisation : [0..1] Date | Date prévue d'utilisation du DMI |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 48 Attributs de la classe "Ligne"

#### Flux 1c - TracabiliteDemande

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la demande ou de la suppression de la demande (Flux 1) de DMI envoyée par le service utilisateur vers le gestionnaire DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du service utilisateur ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « DEM » de la nomenclature « TRE_R254-TypeEvenement » pour la demande et « SDM » pour la suppression de la demande.
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du professionnel du service utilisateur.
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 1
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 1 encodé en binaire

#### Flux 2 - ReponseDemandeDMI

Cette section présente le diagramme de classes du Flux 2 - ReponseDemandeDMI. Il s'agit du flux de réponse de la part du gestionnaire DMI après avoir reçu la demande soit de création ou de mise à jour.

![](media/media/image31.png)

Figure 28 Flux 2 - ReponseDemandeDMI

##### Classe "Reponse"

| | |
| :--- | :--- |
| reference : [1..1] Identifiant | Référence unique de la demande (qui peut être une référence interne dans ce flux). Cet identifiant peut être généré automatique au moment de la soumission de la demande. Ainsi, il peut ne pas être contenu dans le flux de création d'une demande DMI. |
| dateDem : [0..1] Date | Il s'agit de la date de la demande par le service utilisateur. |
| quantiteTotale : [0..1] Numerique | Il s'agit de la quantité totale des DMI concernés par la demande. |
| infoCompl : [0..1] Texte | Toute information complémentaire concernant le traitement de la demande de DMI. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 49 Attributs de la classe "Reponse"

##### Classe "DetailReponse"

| | |
| :--- | :--- |
| idDetailReponseAssocieEnteteReponse : [0..1] Identifiant | Identifiant commun à tous les "DetailReponse" associées à la même entête de "Reponse". |
| dateDelivrance : [0..1] Date | Il s'agit de la date prévue de délivrance du DMI par la PUI au service utilisateur. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 50 Attributs de la classe "DetailReponse"

#### Flux 2a - TracabiliteReponse

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la réponse à la demande (Flux 2) de DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « REP » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du service utilisateur.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 2
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 2 encodé en binaire

#### Flux 3 - CommandeDMI

Cette section présente le diagramme de classes du Flux 3 - CommandeDMI. Ce flux concerne la soumission par le gestionnaire DMI de la commande de DMI auprès du fournisseur (fabricant ou distributeur).

![](media/media/image32.png)

Figure 29 Flux 3 - CommandeDMI

##### Classe "Commande"

| | |
| :--- | :--- |
| refCommande : [1..1] Identifiant | Il s'agit de l'identifiant interne de la commande passée par le gestionnaire DMI. Cet identifiant peut être généré automatiquement au moment de la soumission d'une commande. |
| type : [0..1] Code | Il s'agit du type de la commande. |
| quantiteTotale : [0..1] Numerique | Il s'agit de la quantité totale des DMI commandés par le gestionnaire DMI au fournisseur. |
| dateCmd : [0..1] DateHeure | Il s'agit de la date et heure de la soumission de la commande envoyée par le gestionnaire DMI. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 51 Attributs de la classe "Commande"

##### Classe "Ligne"

| | |
| :--- | :--- |
| IdLigneAssocieeEnteteCommande : [0..1] Identifiant | Identifiant commun à toutes les lignes associées à la même entête Commande. |
| dateUtilisation : [0..1] Date | La date prévue d'utilisation du DMI |
| metadonnee : [1..1][Metadonnee](#classe-metadonnee) | Informations relatives à la gestion des classes et des données. |

Table 52 Attributs de la classe "Ligne"

#### Flux 27 - TracabiliteCommande

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la commande de DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « CDM » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du fournisseur.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 3
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 3 encodé en binaire

#### Flux 4 - LivraisonDMI

Cette section présente le diagramme de classes du Flux 4 - LivraisonDMI. Ce flux concerne la réception des DMI par le gestionnaire de réception.

![](media/media/image33.png)

Figure 30 Flux 4 - LivraisonDMI

##### Classe "Livraison"

| | |
| :--- | :--- |
| referenceCommande : [1..1] Identifiant | Numéro du bon de commande. |
| quantiteTotale : [0..1] Numerique | Quantité réceptionnée |
| dateLivraison : [1..1] DateHeure | La date et l'heure de la réception. |
| livraisonConforme : [0..1] boolean | Indicateur de la conformité de la livraison reçue par rapport aux bons de commande et de livraison du fournisseur (fabricant ou distributeur). |
| motifRejet : [0..1] Texte | Information complémentaire décrivant le motif du rejet de la livraison par le gestionnaire de réception. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 53 Attributs de la classe "Livraison"

#### Flux 5 - TracabiliteLivraisonValide

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la conformité de la livraison de DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire de réception ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « REC » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire de réception.
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 4
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 4 encodé en binaire

#### Flux 5a - TracabiliteLivraisonRejet

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du rejet de la livraison de DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire de réception ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « NRE » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire de réception.
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence .
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 4
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 4 encodé en binaire

#### Flux 5b - ReceptionUnitaireDMI

Cette section présente le diagramme de classes du Flux 5b - ReceptionUnitaireDM. Ce flux concerne les DMI réceptionnés par le gestionnaire de réception.

![](media/media/image34.png)

Figure 31 Flux 5b - ReceptionUnitaireDMI

##### Classe "StatutReception"

| | |
| :--- | :--- |
| receptionConforme : [1..1] boolean | Indicateur de la conformité du dispositif0 dispositif conforme (i.e. non périmé, ne faisant l'objet d'aucune alerte ou retrait de lot, ou autre non-conformité)1 dispositif non conforme. |
| motifRejet : [0..1] Texte | Information complémentaire décrivant le motif du rejet de la réception du dispositif. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 54 Attributs de la classe "StatutReception"

#### Flux 5c - TracabiliteEntreeStockDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de l'entrée en stock du DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « ESD » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire de réception
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 5b
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 5b encodé en binaire

#### Flux 5d - TracabiliteReceptionDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la réception unitaire du DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « REC » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire de réception
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 5b
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 5b encodé en binaire

#### Flux 5e - TracabiliteRejetDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du rejet de la réception unitaire du DM.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « NCO » ou « PER » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire de réception
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 5b
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 5b encodé en binaire

#### Flux 6 - DelivranceSU

Cette section présente le diagramme de classes du Flux 6 - DelivranceSU. Ce flux concerne l'envoie des informations nécessaires au gestionnaire de réception du service utilisateur concernant les DMI délivrés par la PUI.

![](media/media/image35.png)

Figure 32 Flux 6 - DelivrerSU

##### Classe "Delivrance"

| | |
| :--- | :--- |
| referenceDelivrance : [1..1] Identifiant | Référence unique de la délivrance (qui peut être une référence interne). |
| dateDelivrance : [1..1] DateHeure | Date de délivrance au service utilisateur. |
| quantiteDelivree : [1..1] Numerique | Il s'agit de la quantité totale des DMI délivrés au service utilisateur. |
| informationComplementaire : [0..1] Texte | Toutes informations complémentaires concernant la délivrance de DMI au service utilisateur. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 55 Attributs de la classe "Delivrance"

#### Flux 6a - TracabiliteSortieStock

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la sortie du stock de la PUI du (des) DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « SSD » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire DMI
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 6
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 6 encodé en binaire

#### Flux 7 - TracabiliteDelivranceSU

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la délivrance du (des) DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « DEL » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire DMI
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 6
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 6 encodé en binaire

#### Flux 8 - TransportDMI

Cette section présente le diagramme de classes du Flux 8 - TransportDMI. Ce flux concerne l'envoie des informations nécessaires au gestionnaire de réception du service utilisateur concernant le transport des DMI qui sont acheminés.

![](media/media/image36.png)

Figure 33 Flux 8 - TransportDMI

##### Classe "Transport"

| | |
| :--- | :--- |
| referenceTransport : [1..1] Identifiant | Référence unique du transport (qui peut être une référence interne). |
| referenceDelivrance : [1..1] Identifiant | Référence de la délivrance du (des) DMI associée à ce transport. |
| dateDelivrance : [1..1] DateHeure | Date de délivrance au service utilisateur. |
| quantiteTransportee : [1..1] Numerique | Il s'agit de la quantité totale des DMI transportés par le service logistique vers le gestionnaire de réception du service utilisateur. |
| IncidentTransport : [0..1] boolean | Indicateur de la conformité du transport du (des) dispositif(s)0 aucun incident durant le transport du (des) dispositif(s).1 incident survenu durant le transport du (des) dispositif(s). |
| detailIncident : [0..1] Texte | Information complémentaire décrivant l'incident survenu sur le(s) dispositif(s) pendant le transport. |
| informationComplementaire : [0..1] Texte | Toutes informations complémentaires concernant le transport du (des) DMI vers le gestionnaire de réception du service utilisateur. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 56 Attributs de la classe "Transport"

#### Flux 9 - TracabiliteTransportDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du transport du (des) DMI délivrés au service utilisateur.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « TRA » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire DMI
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du service utilisateur.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 8
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 8 encodé en binaire

#### Flux 10 - ReceptionSU

Cette section présente le diagramme de classes du Flux 10 - ReceptionSU. Ce flux concerne l'envoie des informations nécessaires au service utilisateur concernant la réception des DMI dans ses locaux.

![](media/media/image37.png)

Figure 34 Flux 10 - ReceptionSU

##### Classe "ReceptionDMI"

| | |
| :--- | :--- |
| referenceReception : [1..1] Identifiant | Référence unique de la réception des DMI au sein du service utilisateur (qui peut être une référence interne). |
| referenceDelivrance : [1..1] Identifiant | Référence unique de la délivrance qui est associée à cette réception des DMI. |
| quantiteReceptionnee : [0..1] Numerique | Il s'agit de la quantité totale des DMI réceptionnés. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 57 Attributs de la classe "ReceptionDMI"

##### Classe "Ligne"

| | |
| :--- | :--- |
| dateReceptionSU : [1..1] DateHeure | Date de reception du DMI |
| receptionConforme : [1..1] boolean | Indicateur de la conformité du dispositif0 dispositif conforme1 dispositif non conforme (i.e. en cas d'erreur de la PUI ou du transporteur, si le DMI réceptionné n'est pas conforme et/ou ne correspond pas au DMI qui avait été demandé) . |
| motifRejet : [0..1] Texte | Information complémentaire décrivant le motif du rejet de la réception du dispositif dans le service utilisateur. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 58 Attributs de la classe "Ligne"

#### Flux 11 - TracabiliteEntreeStock

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour l'entrée en stock du (des) DMI au sein du service utilisateur.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire de réception du service utilisateur ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « ESD » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du service utilisateur.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 10
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 10 encodé en binaire

#### Flux 12 - TracabiliteReceptionSU

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour la réception du (des) DMI au sein du service utilisateur.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire de réception du service utilisateur ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « REC » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du service utilisateur.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 10
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 10 encodé en binaire

#### Flux 28 - TracabiliteRejetDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du rejet de la réception du DM au sein du service utilisateur.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « NCO » ou « PER » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du service utilisateur.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 10
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 10 encodé en binaire

#### Flux 13 - ConsommationDMI

Cette section présente le diagramme de classes du Flux 13 - ConsommationDMI. Ce flux concerne l'envoie des informations nécessaires au gestionnaire DMI concernant la pose du (des) DMI par le service utilisateur chez un patient.

![](media/media/image38.png)

Figure 35 Flux 13 - ConsommationDMI

##### Classe "InterventionMedicale"

| | |
| :--- | :--- |
| idIntervention : [1..1] Identifiant | Identifiant de l’intervention médicale. |
| numSejour : [0..1] Identifiant | Numéro de séjour correspondant à l’intervention médicale. |
| typeIntervention : [0..1] Code | Code spécifiant le type d’intervention. |
| dateIntervention : [1..1] DateHeure | Date/heure à laquelle l’intervention a eu lieu. |
| emplacementDMI : [0..1] Texte | Emplacement anatomique du DMI posé. |
| poseConforme : [1..1] boolean | Indicateur de la conformité de la pose du dispositif0 aucun échec de pose pour ce dispositif.1 échec de la pose du dispositif. |
| motifEchec : [0..1] Texte | Information complémentaire décrivant le motif de l'échec de la pose du dispositif. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 59 Attributs de la classe "InterventionMedicale"

#### Flux 30 - TracabiliteSortieStockSU

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la sortie du stock du (des) DMI du service utilisateur.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « SSD » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du service utilisateur
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 13
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 13 encodé en binaire

#### Flux 13a - TracabiliteRefusDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du refus de la part du service utilisateur d'utiliser le DMI durant l'opération.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au service utilisateur ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « NCO » ou « PER » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du service utilisateur
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 13
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 13 encodé en binaire

#### Flux 14 - TracabiliteEchecPose

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de l'échec de pose du DMI durant l'opération.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au service utilisateur ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « ECH » ou « NCO » ou « PER » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du service utilisateur
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 13
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 13 encodé en binaire

#### Flux 15 -TracabilitePose

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour la pose du DMI chez le patient pendant l'opération.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au service utilisateur ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « POS » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du service utilisateur
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 13
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 13 encodé en binaire

#### Flux 16a - TracabiliteReassortDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour le réassort en DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « REA » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du fournisseur.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 3
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 3 encodé en binaire

#### Flux 17 - AutorisationPaiement

Cette section présente le diagramme de classes du Flux 17 - AutorisationPaiement. Ce flux concerne l'envoie des informations nécessaires au gestionnaire de compatibilité afin de régler la facture auprès du fournisseur.

![](media/media/image39.png)

Figure 36 Flux 17 - AutorisationPaiement

##### Classe "Facture"

| | |
| :--- | :--- |
| refFacture : [1..1] Identifiant | Identifiant de la facture du fournisseur. |
| facture : [0..1] ObjetBinaire | Valeur binaire de la facture du fournissuer. |
| typeFacture : [0..1] Code | Il s'agit de l'attribut spécifiant le type de la facture. |
| refCommande : [1..1] Identifiant | Numéro de la commande ou du bon de commande associée à la facture. |
| dateEmission : [0..1] Date | Date d'émission de la facture. |
| instructionPaiement : [0..1] Texte | Toute instruction de paiement pour le règlement de la facture. |
| montantTotal : [0..1] Numerique | Montant total de la facture à régler |
| devise : [0..1] Code | Devise de règlement de la facture |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 60 Attributs de la classe "Facture"

##### Classe "Ligne"

| | |
| :--- | :--- |
| dateAchat : [1..1] Date | Date d'achat du DMI par l'établissement. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 61 Attributs de la classe "Ligne"

#### Flux 18 - TracabiliteFacturationDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour le paiement de la facture de DMI.

Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :

* la classe Trace avec l’attribut :
 . identifiant : identifiant de la trace.
* la classe SourceTrace avec l’attribut :
 . identifiant : identifiant de la source de la trace qui correspond au gestionnaire DMI ayant émis la trace.
* la classe Evenement dont les attributs sont définis par :
 . typeEvenement correspondant au code « AUT » de la nomenclature « TRE_R254-TypeEvenement ».
 . occurence correspond à la date/heure à laquelle le flux a été généré.
 . declaration correspond à la date/heure à laquelle le flux a été transmis.
 . description correspond à la description textuelle de l'évènement.
* deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . identifiant correspond à l’identifiant du gestionnaire DMI.
 . role = émetteur de la trace (cet attribut est nomenclaturé).
 pour la deuxième occurrence
 . identifiant correspond à l’identifiant du gestionnaire de comptabilité.
 . role = récepteur de la trace (cet attribut est nomenclaturé).
* deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :
 pour la première occurrence :
 . type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).
 . contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 17
 pour la deuxième occurrence :
 . type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).
 . contenu correspond aux informations métiers du Flux 17 encodé en binaire

#### Flux 22 - TransmissionTrace

Les objets entrant dans la composition de ce flux (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces) correspondent à :

* la classe Trace
* la classe SourceTrace
* la classe Evenement
* la classe ActeurEvenement
* la classe ObjetEvenement

#### Flux 23 - RechercheTraces

Ce flux correspond au « Flux 4 – RechercheTraces » de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). Les paramètres de recherche génériques sont ici complétés en fonction des flux métiers de cette étude.

La table ci-dessous qui liste ces paramètres n’est pas exhaustive.

| | |
| :--- | :--- |
| Tous les paramètres génériques de l'étude (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces) | |
| autreParametres | Paramètres à renseigner en fonction des flux métiers. Ceux-ci peuvent correspondre à :* 
* 
* 
* 
* 
* 
* 
 |

DispositifMedical/support/identifiantHRF(Identifiant du dispositif médical)DispositifMedical/support/IUD-ID(identifiant du modèle du dispositif médical)DispositifMedical/support/IUD-IPNumLot
 (Numéro du lot auquel appartient le DM)DispositifMedical/support/IUD-IPNumSerie (Numéro de série propre au DM)DispositifMedical/codeEMDN (Code du dispositif médical)DispositfMedical/referenceFabricantPatient/identite/matriculeINS (identifiant du patient national)

#### Flux 24 - ReponseRechercheTraces

Ce flux correspond au « Flux 5 - ReponseRechercheTraces» de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). Le modèle du flux est identique au Flux 22 de cette étude à la différence que la recherche peut ne retourner aucune source, une seule ou plusieurs.

#### Flux 25 - ConsulterTrace

Ce flux correspond au « Flux 2 - ConsultationTrace» de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces).

#### Flux 26 - ReponseConsulterTrace

Ce flux correspond au « Flux 3 - ReponseConsultationTrace» de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). Le modèle du flux est identique au Flux 22 de cette étude à la différence que la consultation peut ne retourner aucune source, une seule ou plusieurs.

#### Classes communes aux flux

##### Classe "Adresse"

Adresse géopostale. Un emplacement auquel une personne ou une organisation peut être trouvée ou être atteinte, d'après la norme NF Z 10-011.

| | |
| :--- | :--- |
| identificationDestinataire : [0..1] Texte | Eléments d'identification du destinataire c’est-à-dire la personne physique ou morale à qui un envoi est adressé.1) Le destinataire est une personne physique :* Qualité: civilité ou condition sociale, civile, juridique ou titre sous lequel une partie figure dans un acte juridique.* Prénom* Nom* Titre: désignation honorifique exprimant une distinction de rang, une dignité (titres nobiliaires, religieux, militaires, etc.).* Profession, fonctionUne personne physique peut être désignée soit par son nom et éventuellement son prénom, soit par son nom et sa fonction ou sa profession, enfin, dans certains cas particuliers, par ses seuls titres, fonction ou profession.2) Le destinataire est une personne morale :* Forme juridique: Indication du statut juridique de la personne morale : SA, SARL, GIE, Société civile, Mutuelle, Association, Fondation, etc.* Raison ou dénomination sociale* Domaine d'activité* Enseigne commerciale* Nom commercial* Subdivision au sein de l'entreprise (Direction, service, etc.) ou organisation interne de la personne morale (fonctionnelle ou géographique).Une personne morale peut être désignée au moins par sa raison sociale, son enseigne ou nom commercial. |
| identificationDomicilie : [0..1] Texte | Eléments d'identification du domicilié c’est-à-dire le titulaire du domicile du destinataire (lieu ordinaire d'habitation, demeure légale et habituelle)1) Le domicilié est une personne physique:* Qualité* Prénom* Nom* Titre* Profession, fonctionLes éléments d'identification du domicilié sont précédés de la mention «chez»2) Le domicilié est une personne morale:* Forme juridique* Dénomination sociale* Activité principale* Enseigne ou nom de l'établissement* Subdivision au sein de l'entreprise (Direction, service,...). |
| pointRemise : [0..1] Texte | Lieu où le destinataire prend possession de son courrier. Il est matérialisé, dans la plupart des cas, par la présenced'une boîte aux lettres; il est constitué des éléments suivants :* Local ou logement : Numéro ou désignation d'appartement, logement, pièce, bureau, local commercial ou industriel* Accès au local ou au logement: indications de couloir, d'étage ou de niveau* Boîte aux lettres : Numéro voire dénomination (éventuellement CIDEX)* Accès à la boîte à lettres: si nécessaire,: identification du couloir d'accès, de la batterie de boîtes s'il en existe plusieurs* Code acheminement interne à l'entreprise (CAIE): Codification identifiant le découpage au sein de l'entreprise en vue du traitement de courrier par les services dédiés internes à l'entreprise. Les informations d'identification du domicilié (Chez M.X) pourraient figurer dans cet attribut. |
| complementPointGeographique : [0..1] Texte | Un complément de l'adresse au point géographique constitué des éléments suivants:* Bâtiment: les bâtiments sont désignés par leur type (bâtiment, immeuble, tour,...), éventuellement des mentions d'orientation (est, ouest,...), une dénomination littérale ou une numérotation; exemple: Tour DELTA* Accès au bâtiment: l'accès au bâtiment est identifié par un numéro, une lettre, une combinaison alphanumérique. Ces éléments identifient une entrée, porte, etc.; exemple: Entrée A* Ensemble immobilier: ensemble d'habitations reliées à la voie publique par un ou plusieurs points d'accès (résidence, zoneindustrielle,...); exemple: Résidence des Fleurs. |
| numeroVoie : [0..1] Texte | Un numéro dans la voie; dans les cas de numérotation sans extension, il est composé de 0 à 4 caractères numériques au maximum. |
| extension : [0..1] Texte | Extension ou indice de répétition: mention bis, ter, quater, ...ou une lettre A, B, C, D, etc. lorsque ce caractère complète une numérotation de voirie. |
| typeVoie : [0..1][Code <<TRE_R35-TypeVoie>>](http://mos.asipsante.fr/NOS/PDF/TRE_R35-TypeVoie.tabs.pdf) | Type de voie : rue, avenue, boulevard, etc.Attribut obsolète et non conforme à la norme postale en vigueur qui définit cette information comme faisant partie de l'attribut libelleVoie. Il apparait dans la classe Adresse uniquement parce que des systèmes existants l'utilisent encore.Les valeurs de ce code sont répertoriées dans la nomenclature TRE_R35-TypeVoie. |
| libelleVoie : [0..1] Texte | Appellation qui est donnée à la voie par les municipalités. Ce libellé figure in extenso ou en abrégé sur les plaques aux différents angles de chaque rue.Synonyme: nom de la voie |
| lieuDit : [0..1] Texte | Lieu qui porte un nom rappelant une particularité topographique ou historique et qui, souvent, constitue un écart d'une commune (un écart est une petite agglomération distincte du centre de la commune à laquelle elle appartient). |
| mentionDistribution : [0..1] Texte | Mentions particulières de distribution. Il s'agit de mentions identifiant le service proposé par La Poste au destinataire. Ces mentions sont formées d'un libellé et d'un numéro de séparation (exemple : BP 42534). |
| codePostal : [0..1] Code | Code Postal : Code Postal ou code postal spécifique CEDEX* Code postal: Un code à 5 chiffres servant à l'acheminement et/ou à la distribution des envois. Il identifie un bureau distributeur dans la chaîne de traitement du courrier.* Code CEDEX (Courrier d'Entreprise à Distribution Exceptionnelle); le CEDEX est une modalité d'acheminement du courrier associée à des services particuliers de distribution offerts aux entreprises caractérisées par un adressage spécifique; le code postal spécifique CEDEX est un code attribué aux organismes, entreprises, services publics recevant un fort trafic. Il identifie un client ou un ensemble de clients. Il est positionné aux lieu et place du code postal général dans le cas des adresses CEDEX. Ainsi, un code peut être associé à un client (code individuel) ou partagé entre plusieurs clients (code collectif). |
| localite : [0..1] Texte | Localité ou Libellé du bureau distributeur CEDEX** Localité: Zone d'habitation, en général la commune d'implantation du destinataire. Elle est identifiée par son libellé INSEE sauf dans quelques cas où le libellé postal diffère du libellé INSEE, généralement pour lever des ambiguïtés.** Libellé du bureau distributeur CEDEX.Libellé du bureau distributeur c'est-à-dire (dans la très grande majorité des cas) le libellé de la commune siège du bureau CEDEX; la mention CEDEX doit obligatoirement suivre le libellé du bureau CEDEX; dans le cas où il existe plusieurs bureaux CEDEX pour une même entité ou commune, chaque bureau CEDEX sera identifié par un numéro (exemple : ROUBAIX CEDEX 2); ce numéro correspond au numéro d'arrondissement dans le cas des villes à arrondissements, à un numéro d'ordre dans les autres cas. |
| metadonnee : [0..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 62 Attributs de la classe "Adresse"

##### Classe "DispositifMedical"

Cette classe correspond à l'élaboration de la brique élémentaire du dispositif médical (DM). Cette modélisation a été réalisée en collaboration avec les Groupes de Travail « Dispositifs Médicaux » pilotés par Interop’Santé/PHAST/ANS depuis 2019.

| | |
| :--- | :--- |
| support : [0..1][SupportIUD](#classe-supportiud) | Le support IUD est la manière dont l'IUD est communiqué grâce à l'AIDC et, le cas échéant, son marquage en clair.Parmi les supports IUD, on trouve notamment les codes à barres unidimensionnels ou linéaires, les codes à barres à deux dimensions/code QR, les identifiants RFID. |
| identifiantLocalDM : [0..*] Identifiant | Identifiants affectés au dispositif médical dans les référentiels locaux. |
| classeRisque : [0..1] Code | Classe de risque du dispositif. Les dispositifs sont répartis en classe I, classe IIa, classe IIb et classe III en fonction de la destination des dispositifs et des risques qui leur sont inhérents. La classification est effectuée conformément à l'annexe VIII du Règlement (UE) 2017/745. |
| marquageCE : [0..1][MarquageCE](#classe-marquagece) | Précise si le DM a obtenu le arquage CE et renvoie vers l'organisme ayant accordé le marquage CE au DM. |
| referenceFabricant : [0..1] Identifiant | Référence du dispositif médical ou numéro dans le catalogue du fabricant. |
| referenceDistributeur : [0..1] Identifiant | Référence du dispositif médical ou numéro dans le catalogue du distributeur. |
| modele : [0..1] Texte | Modèle du dispositif médical. |
| nomCommercial : [0..1] Texte | Dénomination commerciale du dispositif médical. |
| codeEMDN : [0..1] Code | Code du dispositif médical dans la nomenclature EMDN (European Medical Device Nomenclature). |
| usageUnique : [0..1] Indicateur | Indicateur pour spécifier si le dispositif est à usage unique.1 : dispositif à usage unique, 0 : dans le cas contraire. |
| nbReutilisation : [0..1] integer | Le nombre limité de réutilisations du dispositif médical. |
| emballageSterile : [0..1] Indicateur | Indicateur pour spécifier si le dispositif a un emballage stérile.1 : dispositif stérile, 0 : dans le cas contraire. |
| sterilisationAvantUtilisation : [0..1] Indicateur | Indicateur pour spécifier si le dispositif doit être stérilisé avant utilisation.1 : dispositif doit être stérilisé, 0 : dans le cas contraire. |
| contientLatex : [0..1] Indicateur | Indicateur pour spécifier si le dispositif contient du latex.1 : dispositif contient du latex, 0 : dans le cas contraire. |
| CMR1A1B : [0..1] Indicateur | Indicateur pour spécifier si le dispositif contient des substances CMR IA et IB.1 : dispositif contient des substances CMR 1A et 1B, 0 : dans le cas contraire. |
| implantable : [0..1] Indicateur | Indicateur pour spécifier si le dispositif est implantable.1 : dispositif implantable, 0 : dans le cas contraire. |
| actif : [0..1] Indicateur | Indicateur pour spécifier si le dispositif est actif.L’article 2 partie 4 du Règlement (UE) 2017/745 du 5 avril 2017 définit les dispositifs actifs comme "tout dispositif dont le fonctionnement dépend d'une source d'énergie autre que celle générée par le corps humain à cette fin ou par la pesanteur et agissant par modification de la densité de cette énergie ou par conversion de celle-ci. Les dispositifs destinés à la transmission d'énergie, de substances ou d'autres éléments, sans modification significative, entre un dispositif actif et le patient ne sont pas réputés être des dispositifs actifs. Les logiciels sont aussi réputés être des dispositifs actifs."1 : dispositif actif, 0 : dans le cas contraire. |
| irmCompatible : [0..1] Code | La norme ASTM (American Society for Testing and Materials ) F2503 distingue 3 niveaux de compatibilité IRM d’un dispositif médical :‒ « MR Safe » (IRM compatible sans conditions) : dispositifs pouvant être introduits dans tout type d’IRM sans risque (matériau non conducteur, non métallique, non magnétique) ;‒ « MR Unsafe » (non IRM compatible) : dispositifs engendrant un risque pour le patient lors de son introduction dans l’IRM ;‒ « MR Conditional » (IRM compatible sous conditions) : dispositifs pouvant être introduits dans l’IRM sous des conditions précises pré spécifiées par le fabricant. Seul le respect de toutes ces conditions pourra permettre la réalisation d’une IRM sans risque. Cela revient à évaluer les conditions dans lesquelles un dispositif médical n’est pas dangereux dans un environnement à résonance magnétique.La FDA recommande que tous les Dispositifs Médicaux Implantables Actifs (DMIA) soient classés « MR Conditional » (IRM compatible sous conditions) ou « MR Unsafe » (non IRM compatible) selon les cas, compte tenu de la présence de composants électroniques conducteurs. Autrement dit, un DMIA ne doit jamais être considéré comme « MR Safe ».La création de la nomenclature associée est en cours. |
| dimensionsCliniques : [0..1][DimensionsDM](#classe-dimensionsdm) | Dimensions cliniques du dispositif. |
| codeLPP : [0..1] Code | Code LPP du DM.Il s'agit d'un code national utilisé pour obtenir le remboursement par l'Assurance Maladie de certains DM (implantables ou invasifs non implantables) en sus des prestations d’hospitalisations à l’hôpital, ou le remboursement de certains produits et prestations en ville. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 63 Attributs de la classe "DispositifMedical"

##### Classe "MarquageCE"

| | |
| :--- | :--- |
| organismeNotifie : [0..1][EntiteJuridique](#classe-entitejuridique) | Données relatives à l’organisme notifié ayant accordé le marquage CE au DM, n’est pas obligatoire pour les DM de classe I (autocertification). |
| libelleAutorisation : [1..1] Texte | Identification de l’autorisation qui a été délivrée par l’organisme règlementaire. Il s’agit en France, du numéro d’agrément sanitaire constitué :- de la lettre F (pour France)- du n° de codification du département- du n° de codification de la commune ou , pour Paris, Lyon et Marseille, de l’arrondissement,- du n° d’ordre de l’établissement dans la commune ou l’arrondissement- de la mention CEE (pour Communauté Economique EuropéenneExemple : F 22.049.01 CEE (arrêté du 6 nov 2000 : ministère de l’agriculture et de la pêche). |

Table 64 Attributs de la classe "MarquageCE"

##### Classe "SupportIUD"

Le support IUD (transcription AIDC et marquage en clair de l'IUD) est apposé sur l'étiquette ou sur le dispositif proprement dit et sur tous les niveaux de conditionnement supérieurs du dispositif. Les conteneurs de transport ne font pas partie des niveaux de conditionnement supérieurs.

L’article 27 partie 3 du Règlement (UE) 2017/745 du 5 avril 2017 définit le système d'identification unique des dispositifs (IUD).

Ce système permet l'identification et facilite la traçabilité des dispositifs autres que les dispositifs sur mesure et les dispositifs faisant l'objet d'une investigation.

La production d'un IUD comprenant:

** un identifiant «dispositif» IUD (IUD-ID), propre à un fabricant et à un dispositif ;

** un identifiant «production» IUD (IUD-IP), qui identifie l'unité de production du dispositif et, le cas échéant, les dispositifs conditionnés.

| | |
| :--- | :--- |
| IUD-ID : [0..1] Identifiant | L'IUD-ID est un code numérique ou alphanumérique unique propre à un modèle de dispositif qui sert également de clé d'accès aux informations stockées dans une base de données IUD. |
| IUD-IPNumSerie : [0..1] Identifiant | Numéro de série du DM.Au sein d'un lot de fabrication, un DM peut être affecté d'un numéro de série unique permettant une meilleure traçabilité. |
| IUD-IPNumLot : [0..1] Identifiant | Numéro du lot auquel appartient le DM.Après l'entrée en application du Règlement (UE) 2017/745, le numéro de lot du DM constitue un type d’IUD-IP. L’affectation d’un numéro de lot ou d’un numéro de série est obligatoire pour les DMI marqués CE au titre du règlement. |
| IUD-IPIdLogiciel : [0..1] Identifiant | Identifiant du logiciel.L'IUD est attribué au niveau du système du logiciel. Seuls les logiciels qui sont disponibles en soi dans le commerce et ceux qui constituent un dispositif à part entière sont soumis à cette exigence.L'identification du logiciel est considérée comme un mécanisme de contrôle de la fabrication et est indiquée dans l'IUD-IP |
| IUD-IPDateFabrication : [0..1] Date | Après l'entrée en application du Règlement (UE) 2017/745, la date de fabrication constitue un type d’IUD-IP. |
| IUD-IPDateExpiration : [0..1] Date | Après l'entrée en application du Règlement (UE) 2017/745, la date d’expiration constitue un type d’IUD-IP. |
| identifiantIUD_HRF : [0..1] Texte | Transcription HRF ("Human-Readable Format") de l'identifiant complet IUD du dispositif médical, tel qu’il apparaît en clair sur le dispositif ou son conditionnement.Si les identifiants « dispositif » (IUD-ID) et « production » (IUD-IP) sont symbolisés dans des codes-barres différents, concaténer les chaînes de caractères en commençant par l’IUD-ID. |
| identifiantIUD_AIDC : [0..1] ObjetBinaire | Transcription AIDC (partie encodée lisible par les techniques d'identification et de capture automatique des données) de l'identifiant complet IUD du dispositif médical.Si les identifiants « dispositif » (IUD-ID) et « production » (IUD-IP) sont symbolisés dans des codes-barres différents, concaténer les chaînes de caractères en commençant par l’IUD-ID. |
| identifiantIUD_Source : [0..1] Code | Une entrée codée indiquant comment l'IUD a été saisie: code à barre, RFID, manuellement, à partir de la carte d'implant d'un patient ...Le code renvoie à une terminologie définissant les différents types (cf. Value set HL7 FHIR Value Set http://hl7.org/fhir/ValueSet/udi-entry-type). |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 65 Attributs de la classe "SupportIUD"

##### Classe "DimensionsDM"

Cette classe correspond aux dimensions cliniques du dispositif médical.

| | |
| :--- | :--- |
| volume : [0..1] Mesure | Volume du dispositif. |
| longueur : [0..1] Mesure | Longueur du dispositif. |
| calibre : [0..1] Mesure | Calibre du dispositif. |
| diametre : [0..1] Mesure | Diamètre du dispositif. |
| poids : [0..1] Mesure | Poids du dispositif. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 66 Attributs de la classe "DimensionsDM"

##### Classe "EntiteJuridique"

| | |
| :--- | :--- |
| idNat_Struct : [1..1] Identifiant | Identification nationale de l'Entité juridique initiée pour les besoins du SI-CPS.Cette identification est obtenue par la concaténation du type d'identifiant national de structure (provenant de la nomenclature TRE_G07-TypeIdentifiantStructure) et de l'identifiant de la structure:** 1 + N° FINESS (entité juridique et entité géographique indéterminées);** 2 + N° Siren. |
| numSiren : [1..1] Identifiant | Le numéro Siren est le numéro unique d'identification attribué à chaque entreprise ou organisme par l'INSEE. |
| numFINESS : [0..1] Identifiant | Identifiant FINESS de l'entité juridique attribué lors de sa création.Les personnes morales identifiées par des numéros FINESS sont également dotées de numéros Siren. Le numéro FINESS étant porteur intrinsèquement de liens avec le domaine sanitaire ou le domaine médico-social. |
| numeroTVAIntracommunautaire : [0..1] Identifiant | Le numéro de TVA intracommunautaire est un numéro d'identification individuel. Il est délivré par l'administration fiscale du pays de domiciliation de l'entreprise concernée au moment de son immatriculation ou de sa déclaration d'activité. |
| numeroSRN : [0..*] Identifiant | Numéro d'enregistrement unique (Single Registration Number - SRN) de l’acteur EUDAMED.Un acteur est un opérateur économique dont le rôle vis-à-vis du dispositif médical est enregistré dans la base de données EUDAMED :**MF : Fabricant**AR : Mandataire**IM : Importateur**PR : AssembleurCe numéro est construit sur la base du numéro de tva intracommunautaire.Il est à noter que l’obligation de s’enregistrer dans EUDAMED ne concerne pas les distributeurs, qui par conséquent n’auront pas de SRN. |
| raisonSociale : [1..1] Texte | La raison sociale est le nom de l'entité juridique.Il s’agit par exemple de la dénomination usuelle du fabricant ou du distributeur du dispositif médical. |
| raisonSocialeLongue : [0..1] Texte | Raison sociale complète de l'entité juridique (acronymes, sigles ou abréviations développées). |
| adresseEJ : [0..1][Adresse](#classe-adresse) | Adresse géopostale de l'entité juridique. |
| telecommunication : [0..*][Telecommunication](#classe-telecommunication) | Adresse(s) de télécommunication de l'entité juridique (numéro de téléphone, adresse email, URL, etc.). |

Table 67 Attributs de la classe "EntiteJuridique"

##### Classe "EntiteGeographique"

| | |
| :--- | :--- |
| idNat_Struct : [1..1] Identifiant | Identification nationale de l'Entité Géographique définie dans le CI-SIS.Cette identification est obtenue par la concaténation du type d'identifiant national de structure (provenant de la nomenclature TRE_G07-TypeIdentifiantStructure) et de l'identifiant de la structure.Pour une Entité Géographiques, IdNat_Struct peut prendre les valeurs suivantes :** 0 + Identifiant cabinet ADELI** 1 + N° FINESS de l'entité géographique** 3 + N° SIRET** 4 + Identifiant cabinet RPPS |
| numFINESS : [1..1] Identifiant | Numéro FINESS de l'entité géographique.Le numéro FINESS étant porteur intrinsèquement de liens avec le domaine sanitaire ou le domaine médico-social, il est, s'il existe, à privilégier pour l’identification des entités géographiques en tant qu’acteurs sanitaires et médico-sociaux par rapport au numéro SIRET (Référentiel d’identification des acteurs sanitaires et médico-sociaux - Politique Générale de Sécurité des Systèmes d’Information de Santé (PGSSI-S)).A chaque EG (établissement) est attribué un numéro FINESS qui est composé de 9 caractères numériques, tels que :** Position 1-2 : numéro du département d'implantation ("2A", "2B" pour la Corse; "97" pour les départements d’Outre-mer; "98" pour Mayotte);** Position 3 : "0";** Position 4-8: "1" pour Guadeloupe, "2" pour Martinique, "3" pour Guyane, "4" pour Réunion, "5" pour Saint-Pierre-et-Miquelon + numéro d'ordre de 4 chiffres;** Position 4-8 : numéro d’ordre de 5 chiffres pour tous les autres départements;** Position 9 : clé de Luhn calculée automatiquement. |
| numSiret : [0..1] Identifiant | Le numéro Siret est le numéro unique d'identification, attribué par l'INSEE, à chaque entité géographique. |
| denominationEG : [0..1] Texte | Nom sous lequel l'entité géographique exerce son activité.Dans le cas d'un établissement enregistré dans le FINESS, cet attribut correspond à la notion de "raison sociale d'un établissement" renseignée dans le FINESS. |
| denominationEGLongue : [0..1] Texte | Nom, sous sa forme la plus longue et complète, sous lequel l'entité géographique exerce son activité (acronymes, sigles ou abréviations développés). |
| adresseEG : [0..1][Adresse](#classe-adresse) | Adresse(s) géopostale(s) de l'entité géographique en fonction de l'usage (adresse administrative, adresse entrée des véhicules, adresse entrée piétonne, etc.).L'implantation géographique peut également être décrite au travers de la classe Lieu. |
| implantationGeographique : [0..1] Lieu | Implantation géographique de l’EG sur un lieu connu. |
| telecommunication : [0..1][Telecommunication](#classe-telecommunication) | Adresse(s) de télécommunication de l'entité géographique (numéro de téléphone, adresse email, URL, etc.). |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 68 Attributs de la classe "EntiteGeographique"

##### Classe "Fabricant"

** Classe spécialisée, hérite de le classe EntiteJuridique

Cette classe regroupe les items pouvant caractériser le fabricant du dispositif médical.

| | |
| :--- | :--- |
| identifiantLocalFabricant : [0..*] Identifiant | Identifiants affectés au fabricant dans les référentiels locaux (autres que ceux de la Commission Européenne). |

Table 69 Attributs de la classe "Fabricant"

##### Classe "Distributeur"

** Classe spécialisée, hérite de le classe EntiteJuridique

Cette classe regroupe les items pouvant caractériser le distributeur du dispositif médical.

| | |
| :--- | :--- |
| identifiantLocalDistributeur : [0..*] Identifiant | Identifiants affectés au distributeur dans les référentiels locaux (autres que ceux de la Commission Européenne). |

Table 70 Attributs de la classe "Distributeur"

##### Classe "Lieu"

Informations relatives à une portion déterminée de l'espace, fixe ou mobile du point de vue de son affectation ou de ce qui s'y passe.

Cas particulier de l'entité géographique : plusieurs lieux peuvent être associés à une même EG, ils peuvent décrire, à la fois, son adresse et des lieux spécifiques à l'EG.

| | |
| :--- | :--- |
| identifiant : [0..*] Identifiant | Identifiant(s) métier du lieu. |
| nom : [0..1] Texte | Nom, exprimé sous la forme de texte, du lieu. |
| description : [0..1] Texte | Description textuelle du lieu, indiquant comment l'atteindre. |
| typeLieu : [0..1] Code | Information catégorisant physiquement le lieu, par exemple un bâtiment, un véhicule, une chambre, une route, etc. |
| fonctionLieu : [0..1] Code | Fonction à laquelle le lieu est dédié. Par exemple, le lieu d'implantation d'une entité géographique ou la salle de prélèvements dans un service. |
| statut : [0..1][Code <<TRE_R203-StatutLieu>>](http://mos.asipsante.fr/NOS/PDF/TRE_R203-StatutLieu.tabs.pdf) | Le statut indique si le lieu est opérationnel, fermé temporairement ou fermé définitivement.Quelques exemples de codes :** FD : Fermé définitivement;** FT : Fermé temporairement;** OP : Opérationnel.Les valeurs de ce code sont répertoriées dans la nomenclature TRE_R203-StatutLieu. |
| accessibiliteLieu : [0..1][Code <<TRE_R202-AccessibiliteLieu>>](http://mos.asipsante.fr/NOS/PDF/TRE_R202-AccessibiliteLieu.tabs.pdf) | Information précisant dans quelle mesure le lieu est conforme aux dispositions règlementaires relatives à l’accessibilité des établissements recevant du public (ex : accessible, non accessible, sur demande, non communiqué, etc.).Rappel sur l'obligation d'accessibilité des établissements recevant du public (ERP) aux personnes handicapées (service-public.fr):Les établissements ouverts au public (magasin, bureau, hôtel, etc.) doivent être accessibles aux personnes handicapées. Les établissements recevant du public (ERP) non conformes aux règles d'accessibilité sont tenus de s'inscrire à un Agenda d'Accessibilité Programmée (Ad'AP) qui permet d'engager les travaux nécessaires dans un délai limité.Règles d'accessibilité:Les normes d'accessibilité doivent permettre aux personnes handicapées de circuler avec la plus grande autonomie possible, d'accéder aux locaux et équipements, d'utiliser les équipements et les prestations, de se repérer et de communiquer.L'accès concerne tout type de handicap (moteur, visuel, auditif, mental...).Les conditions d'accès doivent être les mêmes que pour les personnes valides ou, à défaut, présenter une qualité d'usage équivalente.L'accessibilité de ces établissements et de leurs abords concerne :** les cheminements extérieurs,** le stationnement des véhicules,** les conditions d'accès et d'accueil dans les bâtiments,** les circulations horizontales et verticales à l'intérieur des bâtiments,** les locaux intérieurs et les sanitaires ouverts au public,** les portes, les sas intérieurs et les sorties,** les revêtements des sols et des parois,** les équipements et mobiliers intérieurs et extérieurs susceptibles d'y être installés (dispositifs d'éclairage et d'information des usagers, par exemple).Les valeurs de ce code sont répertoriées dans la nomenclature TRE_R202-AccessibiliteLieu. |
| communeCOG : [0..1][Code <<TRE_R13-CommuneOM>>](http://mos.asipsante.fr/NOS/PDF/TRE_R13-CommuneOM.tabs.pdf) | Code officiel géographique (COG) de la commune dans laquelle le lieu est situé. |
| adresse : [0..1][Adresse](#classe-adresse) | Adresse géopostale du lieu. |
| coordonneeGeographique : [0..1] CoordonneeGeographique | Coordonnées géographiques du lieu. |
| telecommunication : [0..*][Telecommunication](#classe-telecommunication) | Adresse(s) de télécommunication du lieu (numéro de téléphone, adresse email, URL, etc.). |
| metadonnee : [0..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 71 Attributs de la classe "Lieu"

##### Classe "Metadonnee"

Cette classe contient les attributs inhérents et communs à toutes les classes des flux.

Elle permet aux applications consommatrices des flux d'identifier les créations, les modifications et les suppressions d’objets.

| | |
| :--- | :--- |
| identifiant : [0..1] Identifiant | Identifiant technique qui permet à un consommateur de réconcilier les données dans un contexte spécifique d'échange de données. |
| dateCreation : [1..1] DateHeure | Date de création de l'objet. |
| dateMiseJour : [1..1] DateHeure | Date de mise à jour de la dernière donnée mise à jour de l'objet. |
| commentaire : [0..1] Texte | Commentaire qui peut être associé à chaque objet. |

Table 72 Attributs de la classe "Metadonnee"

##### Classe "OrganisationInterne"

La PUI, le service utilisateur sont modélisés par la classe OrganisationInterne (OI) (voir MOS) qui est une classe abstraite contenant les attributs inhérents et communs aux classes décrivant des structures organisationnelles (ou organisations internes), portant des activités sur un lieu au sein d'une entité géographique.

Une organisation interne (OI) peut être composée d’autres organisations internes. Par exemple, un pôle peut être composé de structures internes (ou services), une structure interne peut être composée d'unités fonctionnelles, une unité fonctionnelle peut être composée d'unités élémentaires.

| | |
| :--- | :--- |
| identifiantOI : [1..1] Identifiant | Identifiant de l'organisation interne, unique et persistant au niveau national. |
| nom : [0..1] Texte | Nom de l'organisation interne. |
| typeOI : [1..1][Code <<TRE_R207-TypeOrganisationInterne>>](http://mos.asipsante.fr/NOS/PDF/TRE_R207-TypeOrganisationInterne.tabs.pdf) | Type d'organisation interne (pôle, structure interne ou service, unité fonctionnelle, unité élémentaire, etc.). |
| categorieOrganisation : [0..1][Code <<TRE_R244-CategorieOrganisation>>](http://mos.asipsante.fr/NOS/PDF/TRE_R244-CategorieOrganisation.tabs.pdf) | La catégorie d'organisation caractérise la nature particulière d’une organisation liée à un agrément, un personnel spécialement formé, un environnement particulièrement adapté à l'état de santé des patients, etc.Les valeurs de ce code sont répertoriées dans la nomenclature TRE_R244-CategorieOrganisation. |
| lieu : [0..*] Lieu | Lieu(x) rattaché(s) à l'organisation interne. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 73 Attributs de la classe "OrganisationInterne"

##### Classe "Patient"

Personne physique bénéficiaire de soins, d'examens ou d'actes de prévention.

| | |
| :--- | :--- |
| identite : [1..1] INS | Identifiant national de santé INS accompagné des traits d'identité de l'état civil et des traits complémentaires provenant du Référentiel National d'Identitovigilance (RNIV). |
| identifiantLocal : [0..1] Identifiant | Identifiant du patient dans les référentiels locaux. |
| personne : [1..1][PersonnePhysique](#classe-personnephysique) | Identité civile du patient. |
| adresseCorrespondance : [0..*][Adresse](#classe-adresse) | Adresse(s) de correspondance de la personne prise en charge. |
| telecommunication : [1..*][Telecommunication](#classe-telecommunication) | Adresse(s) de télécommunication de la personne prise en charge (numéro de téléphone, adresse email, URL, etc.). |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 74 Attributs de la classe "Patient"

##### Classe "INS"

La classe INS est reprise de la classe INS du MOS (voir https://mos.esante.gouv.fr)

##### Classe "PersonnePhysique"

| | |
| :--- | :--- |
| nomFamille : [0..1] Texte | Toute personne possède un nom de famille (appelé auparavant nom patronymique). Ce nom figure sur l'acte de naissance. Il peut s'agir par exemple du nom du père. Réf. : Service-public.fr Synonymes : nom patronymique, nom de naissance |
| prenom : [0..1] Texte | Prénom(s) de la personne déclarés à sa naissance. |
| sexe : [0..1] Code | Sexe de la personne physique. |
| dateNaissance : [0..1] Date | Date de naissance de la personne. |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 75 Attributs de la classe "PersonnePhysique"

##### Classe "Professionnel"

Données d'identification pérennes d’une personne physique, qui travaille en tant que professionnel (professionnel enregistré dans RPPS ou ADELI), personnel autorisé ou personnel d’établissement, dans les domaines sanitaire, médico-social et social.

| | |
| :--- | :--- |
| idNat_PS : [1..1] Identifiant | Identification nationale principale du professionnel initiée pour les besoins du SI-CPS.Cette identification est obtenue par la concaténation du type d'identifiant national de personne (provenant de la nomenclature TRE_G08-TypeIdentifiantPersonne) et de l'identifiant de la personne physique provenant, selon le type d’identifiant, soit d’un référentiel national, soit d’un référentiel local propre à la structure d’exercice de la personne physique:** 0 + N° ADELI du professionnelEx : 0123456789 : identification nationale d’un professionnel identifié par un n° ADELI = 123456789;** 1 + Identifiant cabinet ADELI/identifiant interne du professionnel employé au sein d’un cabinetEx : 112345678901/00001 : identification nationale d’un employé dans un cabinet libéral:- le titulaire du cabinet est un professionnel identifié par un n° ADELI = 123456789- le cabinet est identifié par un ADELI-rang = 12345678901 (01 = n° de rang du cabinet du même professionnel sur 2 caractères)- l’identifiant interne de l’employé dans la structure = 00001;** 3 + N° FINESS/identifiant interne du professionnel employé au sein d’une structure FINESS;** 4 + N° Siren/identifiant interne du professionnel employé au sein d’une structure Siren (NB: pas d'utilisation identifiée de cette construction);** 5 + N° Siret/identifiant interne du professionnel employé au sein d’une structure Siret;** 6 + Identifiant cabinet RPPS/ identifiant interne du professionnel employé au sein d’un cabinet- le cabinet est identifié par un RPPS-rang à 14 caractères (numéro RPPS du professionnel + rang sur 2 caractères + clé de Luhn);** 8 + N° RPPS du professionnel ou de l’étudiant;Ex : 810005678901 : identification nationale d’un professionnel ou d’un étudiant identifié par un n° RPPS = 10005678901Le numéro RPPS est un identifiant pérenne, constitué de 11 caractères non significatifs (numéro d’ordre sur 10 caractères + clé de Luhn sur 1 caractère); |
| idPP : [1..1] Identifiant | Identifiant national de la personne physique:** Pour les professionnels de santé: Numéro RPPS ou ADELI.** Pour les étudiants: Numéro RPPS depuis 2017.Remarque, le numéro SIRIUS ou le numéro Etudiant (identifiant ordinal dont les règles de génération sont propres à chaque ordre) peuvent subsister dans certaines cartes et systèmes pendant la période transitoire de généralisation du numéro RPPS.** Pour les acteurs non professionnels de santé employés d’une structure : l’identifiant est composé de l’identifiant principal de la structure et de l’identifiant interne attribué par la structure. |
| personne : [0..1][PersonnePhysique](#classe-personnephysique) | Identité civile du professionnel. |
| adresseCorrespondance : [0..*][Adresse](#classe-adresse) | Adresse(s) de correspondance permettant de contacter les professionnels:** lorsque les structures ne sont pas identifiées : cas des remplaçants ou des professionnels venant de s’inscrire mais non encore installés;** hors de leurs lieux d’exercice, s’ils le souhaitent.Remarque système RPPS : La première occurrence correspond aux coordonnées de correspondance du RPPS. |
| telecommunication : [1..*][Telecommunication](#classe-telecommunication) | Adresse(s) de télécommunication du professionnel (numéro de téléphone, adresse email, URL, etc.). |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 76 Attributs de la classe "Professionnel"

##### Classe "Telecommunication"

Adresse de télécommunication à laquelle une personne ou une organisation peut être contactée (téléphone, fax, e-mail, URL, etc.).

| | |
| :--- | :--- |
| canal : [1..1][Code <<TRE_R200-CanalCommunication>>](http://mos.asipsante.fr/NOS/PDF/TRE_R200-CanalCommunication.tabs.pdf) | Code spécifiant le canal ou la manière dont s'établit la communication (téléphone, e-mail, URL, etc.). |
| adresseTelecom : [1..1] Texte | Valeur de l'adresse de télécommunication dans le format induit par le canal de communication, par exemple un numéro de téléphone, une adresse de courrier électronique, une adresse URL, etc. |
| utilisation : [0..1] Texte | Précise l'utilisation du canal de communication (par exemple à des fins professionnelles, privées, etc.). |
| metadonnee : [1..1] Metadonnee | Informations relatives à la gestion des classes et des données. |

Table 77 Attributs de la classe "Telecommunication"

### Annexes

#### Annexe A - Identification des concepts

##### Définition des concepts métier

| | |
| :--- | :--- |
| Commande/CommandeLivree/Demande/Delivrance/Reception | Eléments nécessaires pour identifier un besoin ou engager une transaction commerciale |
| Ligne (de commande) | Identification d’une référence dans la commande |
| OrganisationInterne | structures organisationnelles portant des activités sur un lieu au sein d'une entité géographique |
| Evènementavec les éléments métiers (Trace/SourceTrace/ActeurEvenement/ObjetEvenement) | Une action nécessitant une traçabilité est définie par, à minima, une date et un type (réception DMI, Envoi DMI vers plateau technique de pose, etc.).Les évènements qui déclenchent le processus de traçabilité de DMI sont les suivants:* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
Demande de DMICommande de DMIRéception de DMI Entree et Sortie StockDélivrance au service utilisateurConsommation de DMIDestérilisation par erreurTaille inadaptéeErreur de côtéAutres éléments sur une non-utilisation de DMI à cause d’un rejet technique ou sanitaireDemande de réassort en DMIAutorisation de paiement de la facture des DMIUn évènement peut déclencher une notification. |
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

##### Mapping MOS

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

#### Annexe B - Nomenclatures

##### Codes associés aux types d'évènements de traçabilité

La terminologie de référence TRE_R254-TypeEvenement[1](#fn:7) des nomenclatures des objets de santé évolue pour inclure les évènements de traçabilité identifiés dans cette étude.

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **1.2.250.1.213.1.1.4.337** | DEM | Demande de dispositifs médicaux à la pharmacie de l’établissement de santé. | DEM | Demande de dispositifs médicaux à la pharmacie de l’établissement de santé |
| **1.2.250.1.213.1.1.4.337** | REP | Réponse de la pharmacie de l’établissement de santé au service responsable de la demande. | REP | Réponse de la pharmacie au service responsable de la demande. |
| **1.2.250.1.213.1.1.4.337** | SDM | Suppression de la demande de dispositif médicaux | SDM | Suppression de la demande de dispositif médicaux |
| **1.2.250.1.213.1.1.4.337** | CDM | Commande de dispositifs médicaux | CDM | Commande de dispositifs médicaux |
| **1.2.250.1.213.1.1.4.337** | REC | Réception valide du dispositif médical par l’établissement de santé | REC | Réception valide du dispositif médical par l’établissement de santé |
| **1.2.250.1.213.1.1.4.337** | NRE | Réception non valide du dispositif médical par l’établissement de santé | NRE | Réception non valide du dispositif médical par l’établissement de santé |
| **1.2.250.1.213.1.1.4.337** | ESD | Entrée de stock des dispositifs médicaux au sein de l’établissement de santé | ESD | Entrée de stock des dispositifs médicaux au sein de l’établissement de santé |
| **1.2.250.1.213.1.1.4.337** | SSD | Sortie de stock des dispositifs médicaux | SSD | Sortie de stock des dispositifs médicaux |
| **1.2.250.1.213.1.1.4.337** | DEL | Délivrance des dispositifs médicaux au service en charge de la pose chez le patient | DEL | Délivrance des dispositifs médicaux |
| **1.2.250.1.213.1.1.4.337** | TRA | Transport des dispositifs médicaux | TRA | Transport des dispositifs médicaux |
| **1.2.250.1.213.1.1.4.337** | POS | Pose du dispositif médical | POS | Pose du dispositif médical |
| **1.2.250.1.213.1.1.4.337** | NCO | Dispositif médical non-conforme, présentant un risque inacceptable pour la santé et la sécurité | NCO | DM non-conforme, avec un risque inacceptable pour la santé et la sécurité |
| **1.2.250.1.213.1.1.4.337** | PER | Dispositif médical périmé | PER | Dispositif médical périmé |
| **1.2.250.1.213.1.1.4.337** | ECH | Echec de pose du dispositif médical | ECH | Echec de pose du dispositif médical |
| **1.2.250.1.213.1.1.4.337** | REA | Demande de réassort en dispositifs médicaux | REA | Demande de réassort en DM |
| **1.2.250.1.213.1.1.4.337** | AUT | Autorisation de paiement de la facture des dispositifs médicaux | AUT | Autorisation de paiement de la facture des dispositifs médicaux |

#### Annexe D - Informations Connexes

##### Modèle de fichier FICHCOMP DMI

Ci-dessous, un modèle de fichier FICHCOMP DMI au format 2009 à 2016 :

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| VARIABLES | **Taille** | **Début** | **Fin** | **Remarques** |
| N° FINESS | 9 | 1 | 9 |  |
| Type de prestation | 2 | 10 | 11 | 02 |
| Année période | 4 | 12 | 15 |  |
| N° période (mois) | 2 | 16 | 17 |  |
| N° d'index du RSA | 10 | 18 | 27 |  |
| Code LPP | 9 | 28 | 36 |  |
| Nombre posé | 10 | 37 | 46 |  |
| Prix d'achat multiplié par le nombre posé | 10 | 47 | 56 | 7+3 |
| Mois de la date de pose (si renseignée) | 2 | 57 | 58 |  |
| Année de la date de pose | 4 | 59 | 62 |  |

Table 70 Modèle de fichier FICHCOMP

Ce fichier a connu un nombre d’évolutions à partir de 2016 et notamment une nouvelle définition des variables :

* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

**N° FINESS :** Numéro identifiant de l’établissement **Type de prestation :** 02 « Dispositifs médicaux implantables »**Année période :** AAAA (Année de traitement du fichier)**N° période (mois) :** 01 à 12. Correspond à la période du 1er janvier à la fin du mois considéré. La saisie est cumulative.**N° d'index du RSA :** lié au RSA du même séjour par un numéro d’index**Code LPP :** La L.P.P est la liste des produits et prestations remboursables par l’assurance maladie. Ces derniers sont identifiés par code de référence LPP est à 7 caractères numériques. Le 1er et 2nd caractères de code de référence LPP correspond respectivement au titre et chapitre de la nomenclature. Les 4 caractères suivants sont aléatoires. Le 7ème caractère correspond à la clé (modulo 11). **Nombre posé :** 10+0**Prix d'achat multiplié par le nombre posé :** 7+3 (Partie entière sur 7 caractères numériques et partie décimale sur 3)**Mois de la date de pose :** 01 à 12 (sachant que « 01 » correspond au mois de janvier de l’année considérée et « 12 » au mois de décembre)**Année de la date de pose :** AAAA

##### Modèle de fichier RSF

Le format RSF de l’ATIH est accessible ici : [https://www.atih.sante.fr/nouveau-format-du-rsf](https://www.atih.sante.fr/nouveau-format-du-rsf)

##### Glossaire

| | |
| :--- | :--- |
| **CI-SIS** | Cadre d’interopérabilité des systèmes d’information de santé |
| **CSP** | Code de la santé publique |
| **DMI** | Dispositif médical implantable |
| **GHS** | Groupe homogène de séjours |
| **HCL** | Hospices civils de Lyon |
| **IPP** | Identifiant permanent du patient |
| **IADE** | Infirmier anesthésiste diplômé d’état   |
| **IBODE** | Infirmier bloc opératoire diplômé d’état  |
| **LPP** | Liste des produits et prestations |
| **MOS** | Modèle des objets de santé |
| **PUI** | Pharmacie à usage intérieur |
| **T2A** | Tarification à l’activité |

##### Personnes ayant contribué à l'élaboration de cette étude

| | |
| :--- | :--- |
| Manuel METZ | Responsable du programme interopérabilité.Pôle Urbanisation et services de confiance – ASIP Santé |
| Eric SEBELIN | Expert interopérabilitéDEII - Architecture et interopérabilité - ANS |
| Nader CHEAIB | Chargé de mission modélisation et référentiels d’interopérabilité.Pôle Urbanisation et services de confiance – ASIP Santé |
| Geneviève LACHENAL | Cadre de Supérieur de SantéRéférente transverse blocs opératoiresHospices civils de Lyon |
| Sophie BONNEFOY | DirectriceDirection Pharmacie StérilisationHospices civils de Lyon |
| Catherine CHATANIER | Cadre IBODE Bloc Opératoire.Hôpital Necker – Enfants Malades |
| Valérie TALON | Pharmacienne responsable des dispositifs médicaux.Hôpital Privé Saint Joseph – Paris |
| Catherine FARGEOT | Pharmacien clinicien des blocs opératoiresResponsable Management de la Qualité (RSMQ) PUIGH Bicêtre - Pôle BPPSP (HUPS /APHP) |
| Patrick MAZAUD | Conseiller Suppléant Section HChargé de Mission Conseil NationalOrdre National des Pharmaciens |
| Cécile VAUGELADE | Directeur Affaires Technico-Réglementaires au SNITEM |
| Dominique THIVEAUD | Président d'Euro-Pharmat |
| Etienne DUBOURDIEU | Responsable de l’unité des dispositifs médicaux chez PHAST |
| François MACARY | Responsable des projets internationaux chez PHAST |

1. http://mos.asipsante.fr/NOS/PDF/TRE_R254-TypeEvenement.tabs.pdf [↩](#fnref:7)

