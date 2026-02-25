### Introduction

Ce document présente l’étude « métier » pour la traçabilité des dispositifs médicaux implantables (DMI) au sein d’un établissement de santé. Cette étude propose, d’une part, la modélisation des flux d’échanges pour la traçabilité du cycle de vie des DMI, au sein d’un établissement de santé et d’autre part, la définition du périmètre métier nécessaire à la mise en œuvre de cette traçabilité entre systèmes d’information ou composants de systèmes d’information.

La finalité de cette étude correspond à la modélisation du circuit des DMI dans les établissements de santé (depuis leur réception dans l'établissement jusqu’à leur pose chez le patient) permettant d'identifier dans les SIH les flux entrant dans le cadre de la traçabilité sanitaire, financière et logistique des DMI. avec « l’appel à la gestion de traces » issue du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces).

Cette étude doit être interprétée à la lumière des exigences réglementaires applicables aux établissements de santé en matière de traçabilité des DMI. En premier lieu, il s'agit des règles de traçabilité sanitaire définies par le Décret n° 2006-1497 du 29 novembre 2006, inscrites dans le code de la santé publique (Art. R5212-36 à R5212-42). En outre, depuis le 26 mai 2021, les établissements de santé doivent enregistrer l'identifiant unique "IUD" des DMI de classe III, comme le prévoit la réglementation européenne (règlement (UE) 2017/745, Art. 27). Enfin, l'arrêté du 8 septembre 2021 relatif au management de la qualité du circuit des DMI ([Arrêté du 8 septembre 2021 relatif au management de la qualité du circuit des dispositifs médicaux implantables dans les établissements de santé et les installations de chirurgie esthétique](https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044053502)) introduit de nouvelles exigences à compter du 26 mai 2022 : renforcement des règles de traçabilité (nouvelles données à enregistrer, respect du cadre d'interopérabilité des systèmes d'information de santé), enregistrement de l'IUD à toutes les étapes du circuit, pour tous les DMI à l'exception des ligatures, sutures et dispositifs d'ostéosynthèse.

Pour faciliter la mise en conformité avec les exigences de traçabilité, renforcer l'identification des DM et optimiser la gestion de leurs informations dans les SIH, les établissements de santé peuvent utiliser depuis plusieurs années des bases de données professionnelles externes
dont certaines permettent la convergence vers le système IUD (CIOdm et autres bases comme par exemple Exhausmed, Vidal, Euro-Pharmat, Phast CIOdm, ACL).

L’élaboration de cette étude a été basée sur un travail de recherche documentaire ainsi que des rencontres avec des acteurs métier (cf.Annexe D).

<u>Remarque</u> :

La modélisation des processus de traçabilité des dispositifs médicaux implantables est invariante selon le mode de gestion des stocks. La gestion des stocks de DMI peut s’effectuer à deux niveaux selon l’organisation interne de l’établissement de santé. Les stocks de
dispositifs médicaux peuvent être gérés par la pharmacie à usage intérieur (PUI) d’une part ou au sein du stock de proximité du plateau technique opératoire d’autre part.

Dans le cadre de cette étude, le parti pris a été celui d’une gestion de stock des DMI partagée et d’un respect des obligations réglementaires :

- La PUI délivre les DMI et trace cette délivrance.
- Le plateau technique opératoire pose les DMI et trace cette pose.

#### Définitions

Ce paragraphe délivre une définition succincte de certains termes utilisés dans ce document

<table style="width:97%;">
<colgroup>
<col style="width: 23%" />
<col style="width: 73%" />
</colgroup>
<thead>
<tr>
<th><ul>
<p>Terme</p>
</ul></th>
<th><ul>
<p>Définition</p>
</ul></th>
</tr>
</thead>
<tbody>
<tr>
<td><ul>
<p><strong>Traçabilité</strong></p>
</ul></td>
<td><ul>
</ul>

<ul>
<li>
Commission nationale de terminologie : « Ensemble des procédures et des contrôles permettant de suivre l'historique d'un produit depuis sa fabrication jusqu'à son administration à un patient ».
</li>

<li>
ISO 9000 : « Aptitude à retrouver l'historique, l'utilisation ou la localisation d'une entité au moyen d'identifications enregistrées ».
</li>

<li>
HAS : « Possibilité de retrouver, dans un système, une liste d’informations déterminées attachées à un ou plusieurs éléments du système pour expliquer ses défaillances ».
</li>

<li>
Du point de vue de la gestion de l’information, mettre en place un système de traçabilité, c’est associer systématiquement un flux d’informations à un flux physique.
</li>
</ul>

<p>
L’objectif est de pouvoir retrouver, à l’instant voulu, des données préalablement enregistrées permettant de localiser l’entité.</p>
<p>Le décret du 29 novembre 2006 demande la traçabilité des DM depuis leur réception jusqu'à leur utilisation chez le patient et leur éventuelle explantation.</p></td>
</tr>
<tr>
<td><ul>
<p><strong>Dispositif médical - DM</strong></p>
</ul></td>
<td><p>L’article 2 partie 1 du Règlement (UE) 2017/745 du 5 avril 2017 définit un DM comme tout instrument, appareil, équipement, logiciel, implant, réactif, matière ou autre article, destiné par le fabricant à être utilisé, seul ou en association, chez l'homme pour l'une ou plusieurs des fins médicales précises suivantes:</p>
<ul>
<li>diagnostic, prévention, surveillance, prédiction, pronostic, traitement ou atténuation d'une maladie,</li>
<li>diagnostic, contrôle, traitement, atténuation d'une blessure ou d'un handicap ou compensation de ceux-ci,</li>
<li>investigation, remplacement ou modification d'une structure ou fonction anatomique ou d'un processus ou état physiologique ou pathologique,</li>
<li>communication d'informations au moyen d'un examen in vitro d'échantillons provenant du corps humain, y compris les dons d'organes, de sang et de tissus,</li>
</ul>
<p>et dont l'action principale voulue dans ou sur le corps humain n'est pas obtenue par des moyens pharmacologiques ou immunologiques ni par métabolisme, mais dont la fonction peut être assistée par de tels moyens. Les produits ci-après sont également réputés être des dispositifs médicaux :</p>
<ul>
<li>les dispositifs destinés à la maîtrise de la conception ou à l'assistance à celle-ci,</li>
<li>les produits spécifiquement destinés au nettoyage, à la désinfection ou à la stérilisation des dispositifs visés à l'article 1er, paragraphe 4, et de ceux visés au premier alinéa du présent point.</li>
</ul></td>
</tr>
<tr>
<td><ul>
<p>
  <a href="https://eur-lex.europa.eu/legal-content/FR/TXT/?uri=CELEX%3A32017R0745">
    <strong>Dispositif médical implantable – DMI</strong>
  </a>
</p>
</ul></td>
<td><p>L’article 2 partie 5 du Règlement (UE) 2017/745 du 5 avril 2017 définit un DMI comme tout dispositif, y compris ceux qui sont absorbés en partie ou en totalité, (i) destiné à être introduit intégralement dans le corps humain ou (ii) à remplacer une surface épithéliale ou la
surface de l'œil - par une intervention clinique et à demeurer en place après l'intervention.</p>
<p>Est également réputé être un DMI tout dispositif destiné à être introduit partiellement dans le corps humain par une intervention clinique et à demeurer en place après l'intervention pendant une période d'au moins trente jours</p></td>
</tr>
<tr>
<td><ul>
<p><strong>DMI gérés en achat </strong></p>
</ul></td>
<td>Les DMI sont commandés par l’établissement de santé et réceptionnés dans une certaine quantité en prévision de leur utilisation future. Ils sont la propriété de l’établissement de santé et sont généralement stockés au niveau de l’arsenal du plateau technique opératoire afin
d’être immédiatement disponible en cas d’intervention. Dans les contrats qui lient les distributeurs aux établissements de santé, la gestion des péremptions et le réapprovisionnement relève de la responsabilité des
établissements<a href="https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044053502"
     target="_blank">(cf arrêté du 8 septembre 2021).</a></td>
</tr>
<tr>
<td><ul>
<p><strong>Fournisseur</strong></p>
</ul></td>
<td>Le fournisseur est une entité commerciale selon son statut défini dans le Règlement (UE) 2017/745 : fabricant, mandataire ou distributeur autorisée à fournir des DM à un établissement de santé client. Elle peut agir dans le cadre d’un contrat (marché public ou privé) qui régit sa
relation commerciale avec son client.</td>
</tr>
<tr>
<td><ul>
<p><strong>DMI gérés en dépôt-vente</strong> </p>
</ul></td>
<td>Le fournisseur met à disposition de l’établissement de santé des DMI. Ils restent la propriété du fournisseur, qui en gère l’inventaire et la péremption, et ce jusqu’à leur utilisation. Lorsque les produits sont en dépôt, l’établissement de santé indique au fournisseur la pose
d’un implant qui est facturé à ce moment-là. Le dépôt vente donne lieu à une convention définissant les obligations des parties (fournisseur et établissement de santé), cette convention est partie intégrante du contrat lorsqu’il existe entre le fournisseur et l’établissement de
santé <a href="https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044053502" target="_blank">(cf arrêté du 8 septembre 2021).</a></td>
</tr>
<tr>
<td><ul>
<p><strong>Patient pris en charge</strong></p>
</ul></td>
<td>Il s’agit de la personne prise en charge que ce soit au niveau sanitaire, médico-administratif, médico-social et social. Cette personne peut être un usager dans le secteur social ou un patient. Dans le contexte de cette étude, il s’agit d’un patient pour lequel un ou
plusieurs DMI sont posés lors d’une intervention médicale ou chirurgicale.</td>
</tr>
<tr>
<td><ul>
<p><strong>Professionnel</strong></p>
</ul></td>
<td><p>Un professionnel est une personne qui participe, au titre de son emploi professionnel, à la prise en charge d’une personne que ce soit au niveau sanitaire, médico-administratif, médico-social ou social. Dans le cadre de cette étude, il s’agit d’un professionnel prenant en charge le
patient au niveau sanitaire ou médico-administratif.</p>
<p>Synonyme : utilisateur (Règlement (UE) 2017/745, Article 2 Point 37).</p></td>
</tr>
<tr>
<td><ul>
<p><strong>PUI</strong></p>
</ul></td>
<td>Pharmacie à usage intérieur.</td>
</tr>
<tr>
<td><ul>
<p><strong>IBODE</strong></p>
</ul></td>
<td>Infirmier de bloc opératoire diplômé d’état</td>
</tr>
</tbody>
</table>

<p style="text-align:center;">Quelques définitions utilisées dans cette étude</p>

#### Exemples de cas d'usage

Ci-dessous des exemples d’usages de la traçabilité de DMI en établissement de santé.

##### Réassort de stock - DMI gérés en achat

- Un besoin de réassort est transmis à la PUI.
- La PUI passe une commande auprès du fournisseur.
- Le fournisseur reçoit la commande, la traite et livre les DMI à la PUI.
- La PUI reçoit les DMI, les enregistre, délivre les DMI au service utilisateur ayant déclenché la demande de réassort et en trace la délivrance.
- Le gestionnaire de comptabilité déclenche le règlement de la facture de DMI.
- L’infirmier ou l’IBODE reçoit les DMI, enregistre leur réception et les place dans le stock de proximité jusqu’à l’opération.
- Le praticien « implanteur » effectue la pose de DMI. Et il enregistre l’acte de pose du DMI dans le système d’information du PMSI.
- L’infirmier ou l’IBODE renseigne les informations relatives à la pose de DMI. Les données relatives aux DMI doivent figurer dans le dossier patient (Article R. 5212-40 du code de la santé publique).
- La lettre de liaison est remise au patient et à son médecin traitant à l’issue de son séjour dans l’établissement de santé (hors périmètre de cette spécification fonctionnelle).

##### Préparation d’une intervention– DMI gérés en dépôt-vente et non disponibles en stock

- Le plateau technique souhaite préparer une intervention chirurgicale avec pose de DMI pour une personne prise en charge.
- Le plateau technique, ne disposant pas de DMI en stock, effectue une demande auprès de la PUI.
-La PUI passe une commande auprès du distributeur (hors périmètre de cette spécification fonctionnelle).
- Le distributeur reçoit la commande, la traite et livre les DMI au lieu de livraison renseigné sur le bon de commande (PUI) (hors périmètre de cette spécification fonctionnelle).
- LaPUI reçoit les DMI, les enregistre, les délivre au plateau technique et en trace la délivrance.L’infirmier ou l’IBODE reçoit les DMI, enregistre leur réception et les stocke dans l’arsenal jusqu’à l’opération.
- Le praticien « implanteur » effectue la pose de DMI. Et il enregistre l’acte de pose du DMI dans le système d’information du PMSI.
- L’infirmier ou l’IBODE renseigne les informations relatives à la pose de DMI. Les données relatives aux DMI doivent figurer dans le dossier patient (Article R. 5212-40 du code de la santé publique).
- La PUI reçoit les informations de pose et donne l’accord de paiement des DMI consommés.
- Le gestionnaire de comptabilité déclenche le règlement de la facture de DMI.Une demande de réassort est éventuellement remontée.
- La PUI réexpédie et trace les produits non posés. Ce cas peut se produire lorsque le distributeur envoie des sets complets avec plusieurs tailles afin de pouvoir répondre aux besoins de choix lors de la pose.
- La lettre de liaison est remise au patient et à son médecin traitant à l’issue de son séjour dans l’établissement de santé (hors périmètre de cette spécification fonctionnelle).

##### Préparation d’une intervention– DMI gérés en dépôt-vente et disponibles en stock

- Le plateau technique souhaite préparer une intervention chirurgicale pour une pose de DMI chez un patient.
- Le plateau technique, disposant du DMI souhaité dans son stock, effectue la sortie du stock nécessaire.
- Le praticien « implanteur » effectue la pose de DMI. Et il enregistre l’acte de pose du DMI dans le système d’information du PMSI.
- L’infirmier ou l’IBODE renseigne les informations relatives à la pose de DMI. Les données relatives aux DMI doivent figurer dans le dossier patient (Article R. 5212-40 du code de la santé publique).
- La PUI reçoit les informations de pose et donne l’accord de paiement des DMI consommés.
- Une demande de réassort est systématiquement remontée pour maintenir constant le niveau de stock selon la convention de réapprovisionnement entre le fournisseur et l’établissement.

#### Cadre juridique

##### Plan national - Traçabilité sanitaire dans le cadre de la matériovigilance

###### Décret n°2006-1497 du 29 novembre 2006

Le décret n°2006-1497 du 29 novembre 2006, modifiant le code de la santé publique (dispositions réglementaires de matériovigilance) institue l’obligation de traçabilité de certains dispositifs médicaux dont la liste a été fixée par l’arrêté du 26 Janvier 2007 :

- dispositifs médicaux incorporant une substance qui, si elle est utilisée séparément, est susceptible d'être considérée comme un médicament dérivé du sang ;
- valves cardiaques ;
- autres dispositifs médicaux implantables :  
  - y compris les implants dentaires ;  
  - à l'exception des ligatures, sutures et dispositifs d'ostéosynthèse.  

Les règles particulières de traçabilité sont posées par les articles du
décret n°2006-1497 détaillés ci-dessous :

- L’article R. 5212-36 circonscrit le périmètre des règles de traçabilité des dispositifs médicaux depuis leur réception dans la structure sanitaire ou de chirurgie esthétique où ils seront utilisés jusqu'à leur utilisation chez le patient.L’objectif de cette traçabilité est de permettre :
  1. l’identification des patients pour lesquels les dispositifs médicaux d'un lot ont été utilisés;
  2. l’identification des lots dont proviennent les dispositifs médicaux utilisés chez un patient.

- L’article R. 5212-37 fixe, la durée de conservation des données de traçabilité : les données relatives à la traçabilité des DMI sont conservées <u>pendant 10 ans</u>. La durée de conservation est <u>portée à 40 ans</u> pour les DM incorporant une substance qui, si elle est utilisée séparément est susceptible d’être considérée comme un dérivé du sang.

- L’article R. 5212-38 porte sur les données de traçabilité relatives à la délivrance des dispositifs médicaux. Ces données sont enregistrées sous le contrôle du pharmacien (L’article L. 5126-5 du code de la santé publique impose que le pharmacien en charge de la gestion d’une PUI soit responsable de l’ensemble de son activité pharmaceutique) gérant de la PUI ou du professionnel de santé responsable et sont ensuite transmises au service utilisateur du DMI. Les données de traçabilité de la délivrance sont :  
  1. l'identification de chaque dispositif médical :  
    a. dénomination ;  
    b. numéro de série ou de lot ;  
    c. nom du fabricant ou de son mandataire.

  2. la date de la délivrance du dispositif médical au service utilisateur ;  
  3. l'identification du service utilisateur.

- L’article R. 5212-39 impose que chaque service utilisateur d'un DMI complète les informations de traçabilité de la délivrance en enregistrant :  
  1. la date d'utilisation ;  
  2. l'identification du patient, et notamment ses : nom, prénom et date de naissance ;  
  3. le nom du médecin ou du chirurgien-dentiste utilisateur.

- L’article R. 5212-40 impose que tout professionnel de santé utilisant le DMI au sein d’un établissement de santé fasse figurer dans le dossier médical les informations suivantes :
  1. l'identification du dispositif médical : dénomination, numéro de série ou de lot, nom du fabricant ou de son mandataire ;  
  2. la date d'utilisation ;  
  3. le nom du médecin ou du chirurgien-dentiste utilisateur.

- Dans le cas d’un professionnel de santé utilisant le DMI en dehors de l’établissement de santé, les principes de traçabilité sont identiques à ceux exigés pour les établissements de santé en plus de l’information portant sur le lieu d'utilisation à renseigner dans le
dossier médical du patient (article R. 5212-41).

- L’article R. 5212-42 stipule qu’à l'issue des soins ou des actes de chirurgie esthétique mettant en œuvre un dispositif médical figurant sur la liste prévue à l'article [R. 5212-36](https://www.legifrance.gouv.fr/affichCodeArticle.do?cidTexte=LEGITEXT000006072665&idArticle=LEGIARTI000006916313&dateTexte=&categorieLien=cid), est transmis au patient un document mentionnant :
  1. l'identification du dispositif médical utilisé : dénomination, numéro de série ou de lot, nom du fabricant ou de son mandataire et marque ;
  2. le lieu et la date d'utilisation ;le nom du médecin ou du chirurgien-dentiste utilisateur ;
  3. l'existence d'une durée de vie limitée du produit et l'éventuelle nécessité de réintervention qui en découle ;
  4. le cas échéant, le suivi médical particulier.
  
Ci-dessous, un tableau récapitulatif des informations obligatoires de traçabilité de DMI.

<table>
<tr>
<th style="text-align:center;">Informations obligatoires</th>
<th style="text-align:center;">Référence</th>
</tr>

<tr>
<td colspan="2" style="text-align:center;">
<strong>
Le pharmacien (Pour les établissements ne disposant pas de PUI, le responsable de la traçabilité est la personne en charge des commandes et de la gestion des stocks dans l'établissement, sous le contrôle d'un professionnel de santé) enregistre les données de réception des DMI et les transmet ensuite au service utilisateur lors de la délivrance du DMI :
</strong>
</td>
</tr>

<tr>
<td>
<ul>
<li>
l’identification de chaque dispositif médical :
<ul>
<li>dénomination ;</li>
<li>numéro de série ou de lot ;</li>
<li>nom du fabricant ou de son mandataire.</li>
</ul>
</li>
<li>la date de la délivrance du dispositif médical au service utilisateur ;</li>
<li>l’identification du service utilisateur.</li>
</ul>
</td>
<td><em>R. 5212-38</em></td>
</tr>

<tr>
<td colspan="2" style="text-align:center;">
<strong>
Le service utilisateur renseigne ces informations lors de l'utilisation du DMI :
</strong>
</td>
</tr>

<tr>
<td>
<ul>
<li>la date d'utilisation ;</li>
<li>l’identification du patient : nom, prénom et date de naissance ;</li>
<li>le nom du médecin ou du chirurgien-dentiste utilisateur.</li>
</ul>
</td>
<td><em>R. 5212-39</em></td>
</tr>

<tr>
<td colspan="2" style="text-align:center;">
<strong>
L'établissement doit faire figurer dans le dossier patient :
</strong>
</td>
</tr>

<tr>
<td>
<ul>
<li>l’identification du dispositif médical : dénomination, numéro de série ou de lot, nom du fabricant ou de son mandataire ;</li>
<li>la date d'utilisation ;</li>
<li>le nom du médecin ou du chirurgien-dentiste utilisateur ;</li>
<li>le lieu d’utilisation.</li>
</ul>
</td>
<td><em>R. 5212-40</em></td>
</tr>
</table>

<p style="text-align:center;">
Les informations obligatoires de traçabilité de DMI
</p>

###### Instruction n° DGOS/PF2/2015/200 du 15 juin 2015

En complément du cadre législatif, la DGOS a mené une enquête aboutissant à la publication en juin 2015 d’une instruction (Instruction N°DGOS/PF2 2015 /200 du 15 juin 2015) comportant une liste de recommandations pour la traçabilité sanitaire des DMI à destination des établissements de santé. Parmi les recommandations spécifiques au système d’information il y a :

- l’utilisation d’un « référentiel des DMI unique et partagé avec l’ensemble des applications informatiques de la PUI (traçabilité financière, processus logistiques) et des applications informatiques concernées des services utilisateurs ».
- « chaque fois que cela est possible, saisir les données de traçabilité (dénomination, numéro de lot ou de série du DMI, identité du patient,…) par la lecture optique de codes à barres ou autre lecteur adapté au support d’information (RFID), a minima avant la délivrance au service utilisateur. Afin de fiabiliser les données de traçabilité, limiter le recours à la saisie manuelle des données autant que de possible. »  

###### Guide de traçabilité des dispositifs médicaux
Le guide de traçabilité des dispositifs médicaux, élaboré par Euro-Pharmat avec la collaboration de l'Agence nationale de sécurité du médicament et des produits de santé (AFSSAPS) , fournit la définition de certaines informations de traçabilité qui seront reprises dans le cadre de la présente étude métier :

<table style="width:99%;">
<colgroup>
<col style="width: 27%" />
<col style="width: 71%" />
</colgroup>
<thead>
<tr>
<th style="text-align: right;">Information de traçabilité</th>
<th style="text-align: center;">Définition</th>
</tr>
</thead>
<tbody>
<tr>
<td>Dénomination du DMI</td>
<td><ul>
<li>dénomination commune issue si possible d’une nomenclature harmonisée
reconnue ;</li>
<li>termes de la dénomination commerciale utiles pour une
identification fiable et unique : modèle / type / référence.</li>
</ul></td>
</tr>
<tr>
<td> 
Service
utilisateur</td>
<td><ul>
<li>nom du service utilisateur ;</li>
<li>code Unité fonctionnelle de
responsabilité médicale ;</li>
<li>lieu géographique d’implantation
(identification du plateau technique, n° salle d’intervention).</li>
</ul></td>
</tr>
<tr>
<td>Médecin
utilisateur, chirurgien-dentiste utilisateur</td>
<td><ul>
<li>
praticien « implanteur », quelle que soit sa qualité</li>
</ul></td>
</tr>
</tbody>
</table>

<p style="text-align: center;">
Les définitions fournies par Euro-Pharmat
</p>

**<u>La traçabilité financière dans le cadre de la T2A (Tarification à l'activité):</u>**  
Le système de financement pour les activités MCO (Médecine, chirurgie, obstétrique) des établissements de santé, T2A, se base sur l’activité réellement produite. Concrètement, chaque séjour de patient est attribué à un groupe homogène de malade (GHM) et est associé à un tarif appelé
groupe homogène de séjours (GHS) qui couvre l’ensemble des coûts fixes et variables correspondant aux prestations dont le patient a bénéficié au cours de son séjour. Les dépenses liées aux DMI sont intégrées dans ces tarifs d’hospitalisation à l’activité. Toutefois, certains DMI ayant un coût trop élevé, sont financés « en sus » des forfaits de séjours et doivent alors figurer dans la Liste des Produits et Prestations remboursables par l’Assurance maladie (LPPr) en application de l'article L. 162-22-7 du code de la sécurité sociale (CSS) en vue de leur remboursement par l’assurance maladie. Les règles d’inscription sur la LPPr sont définies dans l’article L-165-1 du Code de la Sécurité Sociale et la liste est établie après avis d'une commission de la Haute Autorité de Santé et d’autres acteurs mentionnés dans l'article L. 161-37 du CSS.  
  
La traçabilité financière initialement consiste alors en l’attribution d’un ou plusieurs codes LPP à chaque séjour de patient ayant bénéficié de l’implantation de DMI inscrits sur la LPPr. Actuellement, cette traçabilité a évolué et dépasse le périmètre initial des DMI inscrits
sur cette liste :
  
1. Il existe désormais des DMI, des parties de DMI et des accessoires de DMI à traçabilité obligatoire (étant donné qu’ils sont indispensables au fonctionnement du DMI) qui sont facturés dans le cadre de soins externes ;  
2. Certains DMI non-inscrits sur la LPPs font l’objet d’une traçabilité financière puisque qu’ils sont soumis à contrôle, notamment les DMI intra GHS ;  
3. Il existe des DM non implantables pris en charge au Titre V de la LPP, à traçabilité financière indispensable.  
  
Pour être remboursés intégralement ou partiellement par l’assurance maladie, les établissements de santé doivent communiquer mensuellement un fichier FICHCOMP (disponible en annexe) ou un RSF (pour les établissements sous objectif quantifié national) comportant la liste des
séjours des patients accompagnée de la liste des DMI posés et inscrits sur la LPPr ainsi que d’autres informations telles que le n° FINESS de l’établissement, les codes LPP des DMI implantés, le nombre de DMI implantés par code LPP, le prix d’achat des DMI, les dates de pose, etc.

######  Plan Européen

Le règlement européen (UE) 2017/745 impose une traçabilité des dispositifs implantables les plus à risque (classe III) aux opérateurs économiques mais aussi aux établissements de santé. Cette traçabilité se traduit par l’enregistrement de l’IUD des dispositifs qu’ils auront fournis ou qu’on leur aura fournis.

La mise en œuvre de cette traçabilité doit permettre d’identifier rapidement et de façon précise quels dispositifs ont été implantés chez quels patients, a fortiori en cas de rappel de lot. De plus, il faut à tout moment connaitre la localisation d’un DMI non posé, de manière à procéder immédiatement au retrait de lot et à la mise en quarantaine en cas de rappel ou de signalement d’incident.

L’accessibilité à ces informations doit être immédiate pour le correspondant local de matériovigilance  
  
**<u>Système d'identification unique des dispositifs (IUD)</u>**  
La traçabilité des dispositifs doit reposer sur un système d'identification unique des dispositifs (IUD) fondé sur des lignes directrices internationales lequel doit permettre d’assurer :

- la sécurité des dispositifs après commercialisation :
  - notification des incidents ;
  - mesures correctives de sécurité ciblées ;
  - contrôle par les autorités compétentes.

- la réduction du nombre d'erreurs médicales ;
- la lutte contre la falsification de dispositifs ;
- l’amélioration des politiques d'achat ;
- l’amélioration des politiques d'élimination des
déchets ;
- la compatibilité avec d'autres systèmes d'authentification.

Concrètement, cela signifie que le système d’IUD passe par l’obligation faite aux fabricants d’attribuer à chacun de leurs DM mis sur le marché européen un Identifiant Unique du Dispositif (IUD) en suivant les règles d’un organisme de standardisation habilité, puis d’apposer cet IUD sous la forme d’un code-barres sur le conditionnement du dispositif ou le dispositif lui-même. Cet IUD devra être enregistré et partagé par l’ensemble des acteurs intervenant dans la chaîne de distribution (e.g. opérateurs économiques, établissements de santé).

L’IUD est un code alphanumérique. Il permet l'identification sans ambiguïté d'un dispositif médical spécifique sur le marché. Il comprend deux parties :

- une première partie, dite « L'IUD-ID » (pour identifiant du dispositif), qui est propre à un modèle de dispositif médical. Cette partie du code est « statique » et est identique pour tous les dispositifs d’un même modèle. Cet identifiant donne accès aux informations prévues dans l’annexe VI, partie B du Règlement ;
- une seconde partie de l’IUD, dite «IUD-IP » (pour identifiant de la production). Il contient les informations relatives à chaque unité produite. Les différents types d’IUD-IP sont le numéro de série, le numéro de lot, la date de fabrication et/ou d’expiration. Cette partie du code est « dynamique » et est propre à chaque DM produit.

Base de données européenne [EUDAMED](https://ec.europa.eu/growth/sectors/medical-devices/new-regulations/eudamed_en) Le système d’identification IUD doit être « adossé » à une base de données européenne appelée EUDAMED, administrée par la Commission Européenne (CE). Elle permettra de centraliser les informations relatives à tous les DM mis sur le marché de l'Union Européenne, et sera en partie ouverte au public. L'IUD-ID constituera la principale clé d'accès à ces informations.

Cette base EUDAMED a pour objectifs de permettre :

- l'identification unique des DM, et de faciliter leur traçabilité et le suivi de leur marquage CE ;
- d'informer le grand public des DM mis sur le marché et des investigations cliniques ;
- de diffuser une information sur les incidents de matériovigilance ;
- aux autorités compétentes et à la Commission d'exercer une surveillance du marché ;aux fabricants de déposer leurs dossiers d’investigations cliniques ;
- aux autorités compétentes de transmettre les notifications des organismes notifiés (ON) ;

Les informations relatives aux DM seront enregistrées par les fabricants, les organismes notifiés, et les promoteurs d'investigations cliniques selon leurs obligations respectives définies dans le règlement. Ces informations seront ensuite accessibles en globalité aux États membres et à la Commission et en accès limité aux organismes notifiés, aux opérateurs économiques, aux promoteurs et au grand public.

L'obligation faîte aux fabricants d'enregistrer leurs DM dans EUDAMED sera effective 24 mois après publication par la Commission Européenne d'un avis au JOUE déclarant la pleine fonctionnalité de EUDAMED.

**<u>Carte d’implant :</u>**  
Le contenu de la carte d’implant réalisé sous la responsabilité du fabricant relève de l’article 18 du règlement (UE) 2017/745. Cet article présente les informations devant figurer dans une carte d'implant fournie par le fabricant, et la liste des DM exemptés. Cette carte d'implant doit être remise au patient par l'établissement de santé.

###### Arrêté relatif au management de la qualité du circuit des DMI

L’arrêté du 8 septembre 2021 relatif au management de la qualité du circuit des dispositifs médicaux implantables (DMI) dans les établissements de santé et les installations de chirurgie esthétique doit entrer en vigueur le 26 mai 2022. Cet article mentionne des items précis à « récupérer » en sus de ceux décris dans (R 5212-38 et R5212-39) à chaque étape du circuit des DMI :

- Date de péremption
- Dimensions
- Référence
- Nombre d’unités
- IUD lorsqu’il est disponible

#### Méthode d'élaboration

Les spécifications « métier » présentées dans ce document suivent la méthode d’élaboration des spécifications fonctionnelles des échanges mise en oeuvre par l’ANS. Cette méthode est constituée de plusieurs étapes :  
  
- Étape 1: Organisation du contexte métier ;  
- Étape 2: Définition des processus métier collaboratifs ;  
- Étape 3: Description de chaque processus défini et identification des flux d’informations ;  
- Étape 4: Pour chaque flux, identification des concepts "métier" véhiculés ;  
- Étape 5: Élaboration du modèle de chaque flux structuré (sous forme d’un ou plusieurs diagrammes de classes UML). Le modèle de chaque flux repose sur la reprise des composants mutualisés dans le modèle des objets de santé (MOS) et des nomenclatures associées. À l'issue de cette élaboration, il se peut que de nouveaux composants jusqu'alors inexistants dans le MOS aient été définis et soient intégrés par la suite au MOS.  
- Annexe A : Une définition de chaque concept métier identifié à l'étape 4 est présentée. Une mise en correspondance entre ces concepts et ceux du MOS est également présentée.  
- Annexe B : Les listes de codes associés à des attributs définis à l’étape 5 sont présentées.  
- Annexe D : Des informations supplémentaires concernant cette étude métier sont présentées.

#### Lectorat cible

Les lecteurs cibles sont principalement des chefs de projets ainsi que toute personne concernée par la maîtrise d’ouvrage et qui spécifie des projets avec des interfaces interopérables.

### Organisation du contexte métier

Ce chapitre présente la cartographie des processus du circuit DMI permettant son informatisation ainsi que son interopérabilité. La Traçabilité des DMI au sein d'un établissement de santé doit être assuré tout au long du circuit du DMI. Nous entendons par Traçabilité comme précisé dans la définition de la Table 1, le suivi de l’information du début jusqu’à la fin d’un processus. Cette traçabilité se décompose en plusieurs phases identifiées par les processus collaboratifs suivants :

- Demander DMI : la demande du/des DMI est effectuée par le service utilisateur.
- Commander DMI : la commande des DMI par le gestionnaire DMI (ou la PUI).
- Réceptionner par le gestionnaire DMI : la réception des DMI par le Gestionnaire DMI (ou la PUI).
- Délivrer DMI au service utilisateur : la délivrance des DMI par le gestionnaire DMI (ou la PUI).au service utilisateur. Ce processus déclenche également la traçabilité de sortie de stock de la PUI.
- Transporter DMI : le transport intra-hospitalier ou inter-sites est une phase critique dans l’acheminement des dispositifs au service utilisateur. Il est important d’y tracer les différentes étapes de ce processus.
- Réceptionner DMI par le service utilisateur : la réception au sein du service utilisateur avec une entrée de stock dans le stock de proximité du service.
- Poser DMI : l’implantation (pose) chez le patient avec enregistrement des informations essentielles entre le dispositif et le patient dans le système d’information de l’établissement.
- Facturer DMI : la facturation du DMI
- Tracer : la traçabilité de DMI au sein d'un établissement de santé, dans le contexte de cette étude métier, se fait suite au déclenchement de l'un des évènements suivants : demande de DMI, réception de DMI, sortie de stock, délivrance au service utilisateur,
transport du DMI, réception de DMI par le service utilisateur, la consommation de DMI (posé/non posé) et la facturation du DMI.
- Rechercher traces : ce processus concerne la recherche des évènements de traçabilité concernant un ou plusieurs DMI tout au long du circuit d’un DMI au sein d'un établissement de santé.
- Consulter trace : ce processus concerne la consultation d’un évènement de traçabilité concernant un ou plusieurs DMI tout au long du circuit d’un DMI au sein d'un établissement de santé.

Chaque processus peut contenir un ou plusieurs flux d'échanges entre systèmes d'informations ou composants de systèmes d'information.

Il est à noter que d’autres processus pouvant exister comme le processus de stérilisation ou le processus de gestion d’achats sont hors périmètre de cette étude.

L'organisation du contexte métier de la traçabilité de DMI en établissement de santé est représentée par le diagramme de paquetage ci-dessous :

<div class="figure" style="text-align: center;">
    <img src="diag_paquetage.png"
    alt="Diagramme de paquetage"
    title="Diagramme de paquetage"
    style="width:8in;height:4in">

    <p>
    Diagramme de paquetage recensant les processus identifiés 
    </p>
</div>

### Définition du processus collaboratif

L’objectif de cette étape est de définir les processus métier collaboratifs identifiés dans le diagramme à l’étape 1. Cette modélisation est entreprise de façon macroscopique en représentant les processus par des diagrammes de cas d’utilisation UML. Chaque acteurs (personnes physiques et morales) avec leur périmètre d'activité est décrit dans le paragraphe 3.13.

#### Cas d'utilisation "Demander DMI"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisation_demanderDMI.png"
    alt="Cas d'utilisation Demander DMI"
    title="Cas d'utilisation Demander DMI"
    style="width:6in;height:2in">

    <p>
    Cas d'utilisation "Demander DMI"
    </p>
</div>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 84%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Cas d'utilisation</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Demander DMI</td>
<td style="text-align: left;">Le service utilisateur effectue une demande de DMI (ou plusieurs) dans le cadre d'une intervention programmée ou dans le cadre du réapprovisionnement de son stock de DMI en dotation ou en dépôt vente. Cette demande doit être enregistrée au sein du logiciel de traçabilité des DMI.<br/>
Dans ce cas d'utilisation, le gestionnaire DMI analyse la demande au regard de la liste des dispositifs médicaux stériles implantables élaborés par la commission ou conférence médicale (COMEDIMS) d'établissement et dont l'utilisation est préconisée conformément à l'article R.6111-10 du code de la santé publique.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### Cas d'utilisation "Commander les DMI"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisation_commanderDMI.png"
    alt="Cas d'utilisation Commander les DMI"
    title="Cas d'utilisation Commander les DMI"
    style="width:6in;height:2in">

    <p>
    Cas d'utilisation "Commander les DMI"
    </p>
</div>

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 80%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Cas d'utilisation</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Commander les DMI</td>
<td style="text-align: left;">Après validation par le gestionnaire DMI de la demande du service utilisateur, la PUI effectue la commande des DMI.<br />
Le processus de commande des DMI gère les créations, les mises à jour ou les annulations de commandes.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### Cas d'utilisation "Réceptionner et contrôler les DMI"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationReceptionnerControlerDMI.png"
    alt="Cas d'utilisation Réceptionner et contrôler les DMI"
    title="Cas d'utilisation Réceptionner et contrôler les DMI"
    style="width:6in;height:3in">

    <p>
    Cas d'utilisation "Réceptionner et contrôler les DMI"
    </p>
</div>

| Cas d'utilisation | Description |
|:---|:---|
| Réceptionner et contrôler DMI | Le gestionnaire de réception assure l'admission des dispositifs commandés au sein de l'établissement. Il effectue une confrontation des bons de réception/livraison des DMI effectivement livrés. |

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### Cas d'utilisation "Réceptionner le DMI"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationReceptionnerDMI.png"
    alt="Cas d'utilisation Réceptionner le DMI"
    title="Cas d'utilisation Réceptionner le DMI"
    style="width:6in;height:2in">

    <p>
    Cas d'utilisation "Réceptionner le DMI"
    </p>
</div>

| Cas d'utilisation | Description |
|:---|:---|
| Réceptionner le DMI | Le gestionnaire de réception assure également l'enregistrement des informations relatives aux DMI réceptionnés. Cette action nécessite l'utilisation d'un périphérique de douchage. Si aucune alerte sanitaire concerne les DMI reçus, le gestionnaire de réception enregistre l'entrée au stock au sein de l'établissement de santé des nouveaux DMI une fois la réception validée. |

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### Cas d'utilisation "Délivrer les DMI au service utilisateur"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationDelivrerDMI.png"
    alt="Cas d'utilisation Délivrer les DMI au service utilisateur"
    title="Cas d'utilisation Délivrer les DMI au service utilisateur"
    style="width:6in;height:3in">

    <p>
    Cas d'utilisation "Délivrer les DMI au service utilisateur"
    </p>
</div>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 84%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Cas d'utilisation</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Délivrer DMI</td>
<td style="text-align: left;">La délivrance de DMI est réalisée par le gestionnaire DMI (i.e.: PUI) à destination du service utilisateur. Le gestionnaire DMI enregistre la sortie au stock de la PUI des DMI délivrés au service utilisateur. C'est le gestionnaire de réception du service utilisateur qui effectue l'admission des dispositifs au sein du service.<br />
<br />
- Si la PUI gère les dispositifs en stock alors le gestionnaire DMI fait appel au service logistique pour effectuer le transport des dispositifs à destination du service utilisateur.<br />
- Si la PUI gère les dispositifs hors stock ceux-ci étant physiquement dans le stock de proximité du service utilisateur mais sous la responsabilité de la PUI (informatiquement parlant les dispositifs sont considérés appartenir au stock de la PUI jusqu'à la délivrance) , le transport est dans ce cas inutile.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### "Cas d'utilisation "Transporter DMI au sein de l'établissement""

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationTransporterDMI.png"
    alt="Cas d'utilisation Transporter DMI au sein de l'établissement"
    title="Cas d'utilisation Transporter DMI au sein de l'établissement"
    style="width:6in;height:2in">

    <p>
    Cas d'utilisation "Transporter DMI au sein de l'établissement"
    </p>
</div>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 84%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Cas d'utilisation</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Transporter DMI</td>
<td style="text-align: left;">Un contrat définissant les règles et délais de transport doit être rédigé entre la PUI, les services utilisateurs et le service logistique assurant la livraison. La livraison doit s'effectuer dans des conditions permettant d'assurer la bonne conservation et l'intégrité des DMI.<br />
Les étapes de la livraison et le lieu de livraison sont tracés au sein du système d'information ce qui correspond à la traçabilité logistique. Les problèmes rencontrés lors de la livraison sont remontés à la PUI et enregistrés.<br />
Le gestionnaire de réception service utilisateur assure la bonne réception des dispositifs au sein du service utilisateur.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### Cas d'utilisation "Réceptionner les DMI par le service utilisateur"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationReceptionnerDMIserviceUtilisateur.png"
    alt="Cas d'utilisation Réceptionner les DMI par le service utilisateur"
    title="Cas d'utilisation Réceptionner les DMI par le service utilisateur"
    style="width:6in;height:2in">

    <p>
    Cas d'utilisation "Réceptionner les DMI par le service utilisateur"
    </p>
</div>

| Cas d'utilisation | Description |
|:---|:---|
| Réceptionner les DMI par le service utilisateur | Il s'agit pour le gestionnaire de réception du service utilisateur (ou cadre de l'unité de soins) d'enregistrer la réception de DMI dans les locaux de son service. Le cadre de l'unité de soins enregistre l'entrée en stock des DMI dans son service. Comme au sein de la PUI, les DMI sont détenus dans des conditions permettant d'assurer leur intégrité et leur stérilité. |

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### Cas d'utilisation "Poser les DMI"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationPoserDMI.png"
    alt="Cas d'utilisation Poser les DMI"
    title="Cas d'utilisation Poser les DMI"
    style="width:6in;height:2in">

    <p>
    Cas d'utilisation "Poser les DMI"
    </p>
</div>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 84%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Cas d'utilisation</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Poser DMI</td>
<td style="text-align: left;">L'acte de pose de DMI est effectué par le service utilisateur chez la personne prise en charge dans le cadre d’une intervention chirurgicale ou médicale. Le service utilisateur trace les DMI posés. c'est à dire enregistre au sein du logiciel de traçabilité les informations nécessaires à la traçabilité de la pose des DMI (RPPS
poseur, Finess Géographique, IPP patient, ...). Une traçabilité des DMI est réalisée en attribuant les lots concernés au numéro de séjour du patient.<br />
Si un défaut survient lors de l'utilisation du DMI, l'équipe médicale doit déclarer cet événement au correspondant de matériovigilance. Il est nécessaire de tracer tous les DMI non implantés suite aux échecs de pose.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### Cas d'utilisation "Facturation du DMI"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationFacturerDMI.png"
    alt="Cas d'utilisation Facturation du DMI"
    title="Cas d'utilisation Facturation du DMI"
    style="width:6in;height:3in">

    <p>
    Cas d'utilisation "Facturation du DMI"
    </p>
</div>

<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 82%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Cas d'utilisation</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Facturer DMI</td>
<td style="text-align: left;">Lors du processus de pose du (des) dispositifs, le service utilisateur informe la PUI des consommations de DMI.<br />
Le gestionnaire DMI assure durant ce processus les traitements engendrés par la consommation d'un DMI :<br />
- traitement financier dans le cas d'un dépôt vente (temporaire ou permanent)<br />
- et/ou une demande de réassort selon les règles de réassort en DMI auprès du fournisseur définies par l'établissement de santé.<br />
<br />
Les modalités de facturation doivent être intégrées au système de traçabilité des DMI.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### Cas d'utilisation "Tracer"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationTracerDMI.png"
    alt="Cas d'utilisation Tracer"
    title="Cas d'utilisation Tracer"
    style="width:5in;height:1.5in">

    <p>
    Cas d'utilisation "Tracer"
    </p>
</div>

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 84%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Cas d'utilisation</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Tracer</td>
<td style="text-align: left;">Ce processus permet de tracer un évènement au sein de l'établissement de santé. Cette traçabilité se déclenche dans plusieurs étapes afin de suivre le parcours DMI au sein de l’établissement de santé. Les évènements qui peuvent déclencher le processus de traçabilité de DMI sont les suivants:<br />
<br />
- Demande de DMI<br />
- Commande de DMI<br />
- Réception de DMI<br />
- Délivrance au service utilisateur<br />
- Transport de DMI<br />
- Réceptionner les DMI par le service utilisateur<br />
- Consommation de DMI (posé/non posé)<br />
- Facturation de DMI<br />
<br />
Ce processus réutilise le processus générique "Créer des traces" de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces).</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### "Cas d'utilisation "Rechercher des traces""

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationRechercheTrace.png"
    alt="Cas d'utilisation Rechercher des traces"
    title="Cas d'utilisation Rechercher des traces"
    style="width:5in;height:1.5in">

    <p>
    Cas d'utilisation "Rechercher des traces"
    </p>
</div>

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 79%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Cas d'utilisation</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">RechercherTraces</td>
<td style="text-align: left;">Un consommateur recherche les évènements de traçabilité liés à un ou plusieurs évènements de traçabilité.<br />
<br />
Ce processus réutilise le processus générique " Rechercher des traces" de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces).</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### "Cas d'utilisation Consulter une trace"

<div class="figure" style="text-align: center;">
    <img src="cas_utilisationConsulterTrace.png"
    alt="Cas d'utilisation Consulter une trace"
    title="Cas d'utilisation Consulter une trace"
    style="width:6in;height:2in">

    <p>
    Cas d'utilisation Consulter une trace
    </p>
</div>

| Cas d'utilisation | Description |
|:---|:---|
| ConsulterTrace | Ce processus réutilise le processus générique ""Consulter une trace"" de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). |

<p style="text-align: center;"> Table des cas d'utilisation </p>

#### Acteurs

<table>
<colgroup>
<col style="width: 22%" />
<col style="width: 77%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Acteur</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Source de traçabilité</td>
<td style="text-align: left;">Il s’agit d’un acteur système qui envoie les informations de traçabilité liées au parcours du DMI au sein de l’établissement de santé.</td>
</tr>
<tr>
<td style="text-align: left;">Gestionnaire de traçabilité</td>
<td style="text-align: left;">Il s’agit d’un acteur système (un système d'information ou un composant d'un système d'information) qui enregistre les informations de traçabilité liées au parcours du DMI au sein de l’établissement de santé. Le gestionnaire de traçabilité peut être, par exemple, un logiciel de traçabilité.<br />
<br />
Les acteurs humains derrière les différents systèmes sont multiples selon le cycle de vie du DMI au sein de l’établissement de santé. Cela peut concerner les acteurs rattachés à la pharmacie, rattachés au plateau technique de pose, à la gestion de la réception, etc.<br />
<br />
Cette étude métier traite le gestionnaire de traçabilité comme un acteur à part pour une meilleure compréhension du processus. Ceci ne contraint pas la mise en œuvre de cet acteur en tant qu'une fonctionnalité interne au système d'information de chaque service (pharmacie, bloc, etc.). Dans ce cas, un module d'agrégation est nécessaire afin d'agréger les informations de traçabilité dans chaque système d'information afin pour en créer une vue générique sur la traçabilité de DMI le long de la chaine d'approvisionnement au sein d'un établissement de santé.</td>
</tr>
<tr>
<td style="text-align: left;">Consommateur</td>
<td style="text-align: left;">Il s'agit d'un acteur système interne ou externe habilité à accéder aux évènements de traçabilité des DMI.<br />
Les acteurs humains derrière le consommateur sont multiples et peuvent être des personnes rattachées à la pharmacie, au plateau technique de pose, au service de comptabilité, etc.</td>
</tr>
<tr>
<td style="text-align: left;">Fournisseur</td>
<td style="text-align: left;">Il s'agit de la personne morale responsable de la fourniture des DMI (fabricant ou distributeur) lorsqu'ils sont commandés par l'établissement de santé ou de la mise à disposition des DMI selon les termes de l'accord passé entre le fournisseur et l'établissement de santé.</td>
</tr>
<tr>
<td style="text-align: left;">Gestionnaire DMI</td>
<td style="text-align: left;">Le gestionnaire de DMI est un acteur système qui remplit plusieurs fonctions et qui assure la gestion et la traçabilité de DMI au sein de l'établissement de santé. Les responsabilités principales du gestionnaire DMI sont:<br />
<br />
- Traiter la demande du service utilisateur d'un ou de plusieurs DMI pour une intervention chirurgicale ou médicale.<br />
- Commander de DMI auprès du fournisseur. Dans ce rôle, le gestionnaire DMI gère les créations, les mises à jour ou les annulations des commandes. Il assure également le déclenchement du règlement de la facture. L’article. L.5126-5 du CSP précise que, dans le cadre des missions des PUI, les pharmaciens assurent les actes d’exécution des marchés, pour l’approvisionnement en produits pharmaceutiques : médicaments et dispositifs médicaux stériles (DMS) et qu’il ne s’agit
pas d’une délégation de compétence.<br />
- Réceptionner le(s) DMI. Dans ce rôle, le gestionnaire DMI assure la réception et l’enregistrement des informations de DMI réceptionnés. L’admission des fournitures sera prononcée par le pharmacien responsable ou son représentant pour s’assurer de la conformité des produits avec les règles du Code de la santé publique (CSP) et du Code des marchés
publics (CMP).<br />
- Délivrer DMI au service utilisateur. Le gestionnaire DMI, dans ce rôle, assure la délivrance de DMI au plateau technique de pose. Il trace la sortie du stock.<br />
- Déclencher l'autorisation de paiement: dans ce rôle, le gestionnaire DMI assure les traitements engendrés par la consommation d'un DMI. Ceci se caractérise par le déclenchement du traitement financier dans le cas d'un dépôt-vente (temporaire ou permanent), et/ou une demande de réassort selon les règles de réassort définies par l'établissement de
santé. Ainsi, ce gestionnaire déclenche le règlement de la facture auprès du gestionnaire de comptabilité afin que le fournisseur procède à la facturation des DMI.<br />
<br />
Dans cette étude, l'acteur humain derrière le gestionnaire DMI est le magasinier, le préparateur en pharmacie ou le pharmacien responsable de la PUI.</td>
</tr>
<tr>
<td style="text-align: left;">Gestionnaire de réception</td>
<td style="text-align: left;">Il s’agit de la personne physique ou morale responsable du contrôle de la livraison de DMI lorsqu’ils sont commandés à un (des) fournisseur(s) par l’établissement de santé.</td>
</tr>
<tr>
<td style="text-align: left;">Gestionnaire de réception service utilisateur</td>
<td style="text-align: left;">Il s’agit de la personne physique ou morale (Agent de l'unité de soin ou Préparateur) responsable de réceptionner les DMI au sein du service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">Gestionnaire de comptabilité</td>
<td style="text-align: left;">Le gestionnaire de comptabilité est un acteur système assurant le règlement du paiement du fournisseur de DMI.<br />
L’acteur humain derrière la gestion comptable peut-être par exemple le service financier (trésorerie) ou le service achat de
l’établissement.</td>
</tr>
<tr>
<td style="text-align: left;">Service logistique</td>
<td style="text-align: left;">Le service logistique assure le transport de la livraison des commandes destinées aux unités de soins ou toute autre unité (services médico-techniques, services administratifs et techniques, ...).</td>
</tr>
<tr>
<td style="text-align: left;">Service utilisateur</td>
<td style="text-align: left;">Il s’agit du service ayant la responsabilité de l'implantation du DMI chez le patient.<br />
Il est identifié dans la structure de l'établissement de santé par le nom du service et le code U.F. de responsabilité médicale autorisée à poser le dispositif dans le patient.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Table des acteurs </p>

### Description du processus collaboratif et identification des flux

#### Demander DMI

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme
ci-après.  
Se référer au Tableau 14 pour la définition des acteurs.

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteDemanderDMI.png"
    alt="Diagramme d'activité Demander DMI"
    title="Diagramme d'activité Demander DMI"
    style="width:6.5in;height:3.5in">

    <p>
    Diagramme d'activité Demander DMI
    </p>
</div>

##### Actions

<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 82%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Action</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Initier une demande de DMI</td>
<td style="text-align: left;">Cette action consiste à initier une demande d'un ou plusieurs DMI par le service utilisateur au gestionnaire DMI.<br />
A noter que, sauf cas exceptionnel dûment justifié, le DMI demandé doit figurer dans le livret du médicament et du dispositif médical fixé par la COMEDIMS (Commission du Médicament et des Dispositifs Médicaux Stériles).</td>
</tr>
<tr>
<td style="text-align: left;">Traiter la réponse</td>
<td style="text-align: left;">Le service utilisateur reçoit la réponse du gestionnaire DMI et la traite.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer la demande de DMI</td>
<td style="text-align: left;">Cette action est détaillée dans le processus « Tracer » avec le service utilisateur qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la demande des DMI par le service utilisateur et les envoie au gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer la réponse de la PUI</td>
<td style="text-align: left;">Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la réponse à la demande des DMI par le service utilisateur et les envoie au gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Supprimer la demande DMI</td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Actions du Diagramme d'activité Demander DMI </p>

##### Activités structurées

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 81%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Activités structurées</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Traiter la demande de DMI</td>
<td style="text-align: left;">Le gestionnaire DMI reçoit le flux de demande de DMI qui peut être soit une création, soit une mise à jour ou une suppression de demande de DMI.<br />
- Pour la création/mise à jour de demande de DMI. Il traite le flux de demande en vérifiant la disponibilité en stock des DMI demandés.<br />
Une réponse de la part du gestionnaire DMI informe le service utilisateur de la disponibilité ou de l'indisponibilité totale ou partielle en stock des DMI demandés.<br />
Deux cas sont possibles :<br />
<br />
1) Si la quantité demandée est inférieure ou égale à la quantité disponible au stock de la PUI :<br />
Le gestionnaire DMI envoie les DMI demandés au service utilisateur selon le circuit de logistique interne de l’établissement. Le processus «Délivrer les DMI au service utilisateur» est alors déclenché.<br />
<br />
2) Si la quantité demandée est supérieure à la quantité disponible au stock de la PUI :<br />
Le gestionnaire DMI crée une commande à destination du fournisseur pour les DMI manquants. Le processus « Commander les DMI » est alors déclenché.<br />
<br />
La réponse véhicule la référence à demande initiale et informe le service utilisateur de la quantité disponible ainsi que la date de délivrance prévue pour chaque modèle DMI, en tenant compte si nécessaire du délai que prend la commande au fournisseur.<br />
<br />
- Pour la suppression de la demande de DMI, le gestionnaire DMI annule la demande créée au préalable par le service utilisateur.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Activités structurées du Diagramme d'activité Demander DMI </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 2 - ReponseDemandeDMI | Ce flux permet au service utilisateur d'avoir des informations sur le traitement de leur demande. |
| Flux 2a - TracabiliteReponse | Ce flux permet d'enregistrer la réponse du gestionnaire DMI au sein du gestionnaire de traçabilité. |
| Flux 1 - DemandeDMI | Ce flux porte les informations de création, de mise à jour ou de suppression d'une demande de DMI. |
| Flux 1c - TracabiliteDemande | Ce flux permet d'enregistrer la demande de DMI au sein du gestionnaire de traçabilité. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Demander DMI </p>

#### Commander DMI

##### Workflow de l'activité

Le processus de commande de DMI est activé lorsqu’une des conditions ci-dessous est remplie :  
- le Service Utilisateur souhaite préparer une intervention nécessitant une pose de DMI pour une personne prise en charge et les DMI ne sont pas disponibles en stock.  
- le stock de DMI atteint le stock alerte ce qui déclenche le besoin de réassort qui peut être éventuellement automatique. Ces cas concernent le réapprovisionnement sur seuil.  
- la date fixée pour le réassort est atteinte dans le cas d’un approvisionnement sur échéancier.  
  
Ce processus permet d'identifier les flux définis dans le diagramme ci-après.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteCommanderDMI.png"
    alt="Diagramme d'activité Commander les DMI"
    title="Diagramme d'activité Commander les DMI"
    style="width:6in;height:3in">

    <p>
    Diagramme d'activité Commander les DMI
    </p>
</div>

##### Actions

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 81%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Action</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Initier une commande</td>
<td style="text-align: left;">Le gestionnaire DMI crée une commande sur la base de critères prédéfinis et l'envoie au fournisseur.<br />
A noter que, sauf cas exceptionnel dûment justifié, le DMI demandé doit figurer dans le livret du médicament et du dispositif médical fixé par la COMEDIMS.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer la commande de DMI</td>
<td style="text-align: left;">Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la commande des DMI par la PUI et les envoie au gestionnaire de traçabilité.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Actions du Diagramme d'activité Commander les DMI </p>

##### Activités structurées

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Activités structurées</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Traiter la commande</td>
<td style="text-align: left;">Le fournisseur reçoit la commande et la traite. Il prépare les DMI commandés et les envoie via son circuit logistique au lieu de livraison précisé par le gestionnaire DMI.<br />
A préciser que les mécanismes d’identification des DMI par le fournisseur vis-à-vis du catalogue interne de l’établissement de santé sont hors périmètre de la présente étude. Ainsi, le(s) flux dématérialisé(s) engendrés par le circuit de livraison à l’établissement de santé ne sont pas spécifiés dans ce document.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Activités structurées du Diagramme d'activité Commander les DMI </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 3 - CommandeDMI | Ce flux contient les informations nécessaires pour que le gestionnaire DMI passe une commande auprès de son fournisseur. |
| Flux 27 - TracabiliteCommande | Ce flux permet d'enregistrer la commande de DMI au sein du gestionnaire de traçabilité. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Commander les DMI </p>

#### Réceptionner et contrôler DMI

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteReceptionnerControler.png"
    alt="Diagramme d'activité Réceptionner et contrôler DMI"
    title="Diagramme d'activité Réceptionner et contrôler DMI"
    style="width:6.5in;height:3.5in">

    <p>
    Diagramme d'activité Réceptionner et contrôler DMI
    </p>
</div>

##### Actions

| Action | Description |
|:---|:---|
| Livrer le(s) DMI commandé(s) à l'établissement de santé | Le fournisseur livre le(s) DMI commandé(s) au gestionnaire de réception selon le circuit logistique défini. |
| Vérifier la conformité de la livraison par rapport aux bons de commande/livraison | Cette action permet au gestionnaire de réception de confronter les bons de commande et de livraison aux DMI effectivement livrés. Le gestionnaire de réception a pour obligation de vérifier la conformité de la marchandise livrée au moment de la livraison avant de signer le bon de livraison. |
| Enregistrer le rejet de la reception du (des) DMI | Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité du rejet de la totalité de la livraison et les envoie au gestionnaire de traçabilité. |
| Enregistrer la validité du rapprochement | Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la validité de la totalité de la livraison par rapport au bon de livraison des DMI et les envoie au gestionnaire de traçabilité. |

<p style="text-align: center;"> Actions du Diagramme d'activité Réceptionner et contrôler DMI </p>

##### Activités structurées

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Activités structurées</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Pour chaque DMI livré</td>
<td style="text-align: left;">Par cette action, le gestionnaire de
réception passe en revue la liste des DMI livrés.<br />
En s'assurant que le DMI livré n'est pas assujetti à une alerte sanitaire. Cette sous activité permet l'intégration de chaque DMI au sein d'une base de données "référentielle" qui doit être partagée par l'ensemble des services utilisateurs, et être utilisée par tous les logiciels d'aval (par exemple celui permettant de tracer sa pose).</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Activités structurées du Diagramme d'activité Réceptionner et contrôler DMI </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 4 - LivraisonDMI | Ce flux porte les informations envoyées vers le gestionnaire de réception concernant la livraison par le fournisseur du (des) DMI. Cette livraison étant valide ou rejetée. |
| Flux 5 - TracabiliteLivraisonValide | Ce flux permet au gestionnaire de réception de tracer la conformité de la totalité de la commande de DMI par rapport aux bons de livraison dans le gestionnaire de traçabilité. |
| Flux 5a - TracabiliteLivraisonRejet | Ce flux permet au gestionnaire de réception de tracer l'incohérence de la livraison avec les bons de réception des DMI dans le gestionnaire de traçabilité. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Réceptionner et contrôler DMI </p>

#### Réceptionner le DMI

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteReceptionnerDMI.png"
    alt="Diagramme d'activité Réceptionner le DMI"
    title="Diagramme d'activité Réceptionner le DMI"
    style="width:6.5in;height:3.5in">

    <p>
    Diagramme d'activité Réceptionner le DMI
    </p>
</div>

##### Actions

<table>
<colgroup>
<col style="width: 26%" />
<col style="width: 73%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Action</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Enregistrer l'entrée au stock au sein de l'établissement du DMI</td>
<td style="text-align: left;">Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce  cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de l'entrée au stock au sein de l'établissement du DMI et les envoie au gestionnaire de traçabilité.<br />
Que les DMI soient gérés en "stock" ou "hors-stock" par la PUI, les DMI sont sous la responsabilité de la PUI qui les enregistre dans son système d'information.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer le rejet du DMI</td>
<td style="text-align: left;">Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité du rejet de la réception du DMI et les envoie au gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Vérifier qu'aucune alerte sanitaire ne porte sur le DMI</td>
<td style="text-align: left;">Cette action permet au gestionnaire de réception de contrôler qu'aucunes alertes ou rappels de lots ne concernent le DMI.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer la réception du DMI</td>
<td style="text-align: left;">Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception qui représente, dans ce cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la réception du DMI et les envoie au gestionnaire de traçabilité.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Actions du Diagramme d'activité Réceptionner le DMI </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 5e - TracabiliteRejetDMI | Ce flux permet au gestionnaire de réception de tracer la cause du rejet de la réception du DMI dans le gestionnaire de traçabilité. |
| Flux 5b - ReceptionUnitaireDMI | Ce flux véhicule les informations du DMI livré pour qu'il soit délivré par le gestionnaire DMI. |
| Flux 5d - TracabiliteReceptionDMI | Ce flux permet au gestionnaire de réception de tracer la réception du DMI au sein de l'établissement dans le gestionnaire de traçabilité. |
| Flux 5c - TracabiliteEntreeStockDMI | Ce flux permet au gestionnaire de réception de tracer l'entrée au stock au sein de l'établissement du nouveau DMI dans le gestionnaire de traçabilité. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Réceptionner le DMI </p>

#### Délivrer DMI au service utilisateur

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteDelivrerDMI.png"
    alt="Diagramme d'activité Délivrer DMI au Service Utilisateur"
    title="Diagramme d'activité Délivrer DMI au Service Utilisateur"
    style="width:6.5in;height:3.5in">

    <p>
    Diagramme d'activité Délivrer DMI au Service Utilisateur
    </p>
</div>

##### Actions

<table>
<colgroup>
<col style="width: 27%" />
<col style="width: 72%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Action</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Délivrer le(s) DMI</td>
<td style="text-align: left;">Le gestionnaire DMI délivre le(s) DMI demandé(s) à destination du service utilisateur.<br />
L'ensemble des données relatives à la délivrance des DMI sont enregistrées par la PUI.</td>
</tr>
<tr>
<td style="text-align: left;">Tracer la délivrance du (des) DMI</td>
<td style="text-align: left;">Le gestionnaire DMI trace la délivrance au service utilisateur du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer la sortie du stock au sein de la PUI du (des) DMI</td>
<td style="text-align: left;">Le gestionnaire DMI trace la sortie du stock de la PUI du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Actions du Diagramme d'activité Délivrer DMI au Service Utilisateur </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 6a - TracabiliteSortieStock | Ce flux permet au gestionnaire de DMI de tracer la sortie du stock de la PUI du (des) DMI délivrés. |
| Flux 7 - TracabiliteDelivranceSU | Ce flux permet au service utilisateur de tracer la délivrance du (des) DMI au service utilisateur. |
| Flux 6 - DelivranceSU | Ce flux porte les informations de délivrance des DMI au service utilisateur. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Délivrer DMI au Service Utilisateur </p>

#### Transporter DMI

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteTransporterDMI.png"
    alt="Diagramme d'activité Transporter DMI"
    title="Diagramme d'activité Transporter DMI"
    style="width:6.5in;height:3.5in">

    <p>
    Diagramme d'activité Transporter DMI
    </p>
</div>

##### Actions

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 74%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Action</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Initier la livraison du (des) DMI à destination du service utilisateur</td>
<td style="text-align: left;">Après la réalisation du processus de délivrance du (des) DMI au service utilisateur. Le gestionnaire DMI
déclenche une demande de transport de celui(ceux)-ci auprès du service logistique de l'établissement.<br />
Le service logistique assure le transport du (des) DMI. La livraison doit s'effectuer dans des conditions permettant d'assurer la bonne
conservation et l'intégrité du (des) DMI.<br />
L'anonymat des patients doit être respecté durant cette étape, lorsque le DMI est destiné à un patient particulier.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer le transport du (des) DMI</td>
<td style="text-align: left;">Cette action est détaillée dans le processus « Tracer » avec le service logistique qui représente, dans ce
cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité du transport du (des) DMI et les envoie au
gestionnaire de traçabilité.<br />
Les étapes de la livraison, le lieu de livraison ainsi que les incidents éventuels survenus durant le transport sont tracés au sein du système de
traçabilité.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Actions du Diagramme d'activité Transporter DMI </p>

##### Flux identifiés

<table>
<colgroup>
<col style="width: 30%" />
<col style="width: 69%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Flux 8 - TransportDMI</td>
<td style="text-align: left;">Ce flux porte les informations de livraison du (des) DMI à destination du service utilisateur.<br />
Tout incident de transport est mentionné dans le flux.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 9 - TracabiliteTransportDMI</td>
<td style="text-align: left;">Ce flux permet au gestionnaire DMI de tracer le transport du (des) DMI dans le gestionnaire de traçabilité.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Transporter DMI </p>

#### Réceptionner DMI par le service utilisateur

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteReceptionnerDMIserviceUtilisateur.png"
    alt="Diagramme d'activité Réceptionner DMI par le service utilisateur"
    title="Diagramme d'activité Réceptionner DMI par le service utilisateur"
    style="width:6.5in;height:3.5in">

    <p>
    Diagramme d'activité Réceptionner DMI par le service utilisateur
    </p>
</div>

##### Actions

<table>
<colgroup>
<col style="width: 26%" />
<col style="width: 73%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Action</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Livrer le(s) DMI commandé(s) au service utilisateur</td>
<td style="text-align: left;">Le gestionnaire de réception du service utilisateur (SU) fait un rapprochement entre la demande réalisée auprès
de la PUI et les DMI effectivement livrés au service utilisateur. Ce rapprochement est réalisé par le service utilisateur sur la base des
données relatives à la délivrance, transmises par la PUI dans le système d’information.<br />
Le gestionnaire de réception SU accepte ou refuse le DMI (par exemple en cas d'erreur de la PUI ou du transporteur, si le DMI réceptionné n'est
pas conforme et/ou ne correspond pas au DMI qui avait été demandé).</td>
</tr>
<tr>
<td style="text-align: left;">Réceptionner le (les) DMI</td>
<td style="text-align: left;">Le gestionnaire de réception du service utilisateur enregistre la réception du (des) DMI dans ses locaux.</td>
</tr>
<tr>
<td style="text-align: left;">Tracer la réception du (des) DMI</td>
<td style="text-align: left;">Le gestionnaire de réception du service utilisateur trace la réception du (des) DMI au sein du service
utilisateur. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire de réception du service utilisateur qui représente,
dans ce cas, la source de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer l'entrée au stock au sein du service utilisateur du (des) DMI</td>
<td style="text-align: left;">Le gestionnaire de réception du service utilisateur enregistre le rejet du (des) DMI. Cette action est détaillée
dans le processus « Tracer » avec le gestionnaire de réception du service utilisateur qui représente, dans ce cas, la source de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer le rejet du (des) DMI</td>
<td style="text-align: left;">Le gestionnaire de réception du service utilisateur enregistre le rejet du (des) DMI. Cette action est détaillée
dans le processus « Tracer » avec le gestionnaire de réception du service utilisateur qui représente, dans ce cas, la source de traçabilité.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Actions du Diagramme d'activité Réceptionner DMI par le service utilisateur </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 11 - TracabiliteEntreeStockSU | Ce flux permet au gestionnaire de réception du service utilisateur de tracer l'entrée au stock du service utilisateur du (des) DMI réceptionnés. |
| Flux 12 - TracabiliteReceptionSU | Ce flux permet au service utilisateur de tracer la réception du (des) DMI dans leurs locaux. |
| Flux 10 - ReceptionSU | Ce flux porte les informations de réception du (des) DMI au sein du service utilisateur. |
| Flux 28 - TracabiliteRejetDMI | Ce flux permet au gestionnaire de réception du service utilisateur de tracer la cause du rejet de la réception du DMI dans le gestionnaire de traçabilité. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Réceptionner DMI par le service utilisateur </p>

#### Poser DMI 

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme
ci-après.  
Se référer au Tableau 14 pour la définition des acteurs.

<div class="figure" style="text-align: center;">
    <img src="diagramme_activitePoserDMI.png"
    alt="Diagramme d'activité Poser DMI"
    title="Diagramme d'activité Poser DMI"
    style="width:8in;height:5in">

    <p>
    Diagramme d'activité Poser DMI
    </p>
</div>

##### Actions

<table>
<colgroup>
<col style="width: 24%" />
<col style="width: 75%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Action</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Poser le DMI chez le patient</td>
<td style="text-align: left;">Le service utilisateur entreprend la pose du DMI chez le patient. Cette action donne lieu à la traçabilité de la
pose ou de l'échec de pose, et la déclaration de la consommation du DMI à la PUI.<br />
En cas d'échec de pose, le service utilisateur doit déclarer également les DMI dont la pose a échoué précisant le motif de l’échec de pose.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer le DMI posé</td>
<td style="text-align: left;">Cette action est détaillée dans le processus « Tracer » avec le service utilisateur qui représente, dans ce
cas, la source de traçabilité. Celui-ci enregistre les informations nécessaires à la traçabilité de la pose du DMI chez la personne prise en
charge et les envoie au gestionnaire de traçabilité.<br />
<br />
Précision:<br />
- Les informations d’identité du patient retrouvées dans le gestionnaire de traçabilité sont alimentées et mises à jour automatiquement à partir
du référentiel d’identité des patients de l’établissement ou manuellement en scannant l’étiquette du patient (code barre avec le numéro de séjour). Les flux d’échanges concernant l’identité du patient sont hors périmètre de cette étude métier.</td>
</tr>
<tr>
<td style="text-align: left;">Déclarer l'echec de la pose du DMI</td>
<td style="text-align: left;">Le service utilisateur trace l'échec de pose du DMI. Cette action est détaillée dans le processus « Tracer »
avec le service utilisateur qui représente, dans ce cas, la source de traçabilité.<br />
Pour tout défaut survenant lors de l'utilisation du DMI l'équipe médicale doit également déclarer cet événement au correspondant local de
matériovigilance.</td>
</tr>
<tr>
<td style="text-align: left;">Vérifier le DMI au sein du plateau
technique</td>
<td style="text-align: left;">A la réception du DMI au plateau technique de pose, le service utilisateur contrôle :<br />
- que le dispositif est bien celui prévu pour l'opération du patient,<br />
- qu'aucunes alertes ou rappels de lots ne concernent le
dispositif,<br />
- que le dispositif n'est pas endommagé et qu'il est toujours
stérile.<br />
<br />
Si ces critères sont satisfaits, alors le processus de pose continue. Dans le cas contraire, il y a arrêt de l'opération avec le déclenchement d'un évènement de trace.</td>
</tr>
<tr>
<td style="text-align: left;">Déclarer le refus d'utilisation du DMI</td>
<td style="text-align: left;">Le service utilisateur trace le refus de l'utilisation du DMI pour l'opération chirurgicale. Cette action est
détaillée dans le processus « Tracer » avec le service utilisateur qui représente, dans ce cas, la source de traçabilité.<br />
Pour tout défaut survenant lors de l'utilisation du DMI l'équipe médicale doit également déclarer cet événement au correspondant local de
matériovigilance.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer la sortie du stock au sein du service utilisateur du (des) DMI</td>
<td style="text-align: left;">Le service utilisateur enregistre la sortie du stock du (des) DMI. Cette action est détaillée dans le processus 
« Tracer » avec le service utilisateur qui représente, dans ce cas, la source de traçabilité.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Actions du Diagramme d'activité Poser DMI </p>

##### Activités structurées

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Activités structurées</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Informer la PUI de la consommations du
DMI</td>
<td style="text-align: left;">Le service utilisateur informe de la consommation du DMI au gestionnaire DMI. Ce dernier peut déclencher la
procédure financière dans le cas de DMI gérés en dépôt-vente (temporaire ou permanent), et/ou une demande de réassort selon les règles de
réassort définies par l'établissement de santé.<br />
A noter que dans le cas des DMI gérés en dépôt vente, ceux-ci deviennent la propriété de l'établissement au moment de leur utilisation.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Activités structurées du Diagramme d'activité Poser DMI </p>

##### Flux identifiés

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 68%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Flux 15 -TracabilitePose</td>
<td style="text-align: left;">Ce flux permet au service utilisateur de tracer l'acte de pose du DMI chez le patient.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 14 - TracabiliteEchecPose</td>
<td style="text-align: left;">Ce flux porte les informations de traçabilité de l'échec de pose du DMI.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 13 - ConsommationDMI</td>
<td style="text-align: left;">Ce flux permet au service utilisateur<br />
- d'informer le gestionnaire DMI que le DMI est consommé,<br />
- alimenter le dossier patient informatisé, le dossier pharmaceutique, la lettre de liaison, dossier médical partagé.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 13a - TracabiliteRefusDMI</td>
<td style="text-align: left;">Ce flux porte les informations de traçabilité du refus de l'utilisation du DMI au plateau technique.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 30 - TracabiliteSortieStockSU</td>
<td style="text-align: left;">Ce flux permet au service utilisateur de tracer la sortie du stock du service utilisateur du (des) DMI.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Poser DMI </p>

#### Facturer DMI (dépôt-vente)

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.  
  
Préconditions :  
- Réception de l’information de pose des DMI (pose ou échec de pose) envoyée par le service utilisateur au gestionnaire DMI.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteFacturerDMI_dv.png"
    alt="Diagramme d'activité Facturer DMI (dépôt-vente)"
    title="Diagramme d'activité Facturer DMI (dépôt-vente)"
    style="width:8in;height:5in">

    <p>
    Diagramme d'activité Facturer DMI (dépôt-vente)
    </p>
</div>

##### Actions

<table>
<colgroup>
<col style="width: 21%" />
<col style="width: 78%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Action</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Valider l'acquisition</td>
<td style="text-align: left;">Le gestionnaire DMI informe le fournisseur de la consommation des DMI.</td>
</tr>
<tr>
<td style="text-align: left;">Facturer les DMI</td>
<td style="text-align: left;">Sur la base des DMI déclarés comme consommés, le fournisseur établit la facture des DMI et la transmet au
gestionnaire DMI qui vérifie les éléments facturés.</td>
</tr>
<tr>
<td style="text-align: left;">Déclencher le paiement de la facture</td>
<td style="text-align: left;">Le gestionnaire de comptabilité déclenche le processus de paiement de la facture.</td>
</tr>
<tr>
<td style="text-align: left;">Donner l'accord de paiement</td>
<td style="text-align: left;">Le gestionnaire DMI donne au gestionnaire de comptabilité l’accord de paiement du fournisseur sur la base de la
facture transmise par ce dernier.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer les modalités de facturation</td>
<td style="text-align: left;">Le gestionnaire DMI trace les modalités de facturation du (des) DMI. Cette action est détaillée dans le processus «
Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Demander un réassort en DMI</td>
<td style="text-align: left;">Le déclenchement de cette action dépend d'une part du mode de gestion du stock et d'autre part de la gestion des
réapprovisionnements de la PUI.<br />
Le gestionnaire DMI effectue une demande de réassort en DMI auprès du fournisseur selon les règles de réassort définies par l'établissement de
santé.</td>
</tr>
<tr>
<td style="text-align: left;">Enregistrer la demande de réassort</td>
<td style="text-align: left;">Le gestionnaire DMI trace la demande de réassort en DMI. Cette action est détaillée dans le processus « Tracer »
avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Actions du Diagramme d'activité Facturer DMI (dépôt-vente) </p>

##### Activités structurées

| Activités structurées | Description |
|:---|:---|
| Réassort en DMI | Le pharmacien gérant de la PUI déclenche l'action "Demander un réassort en DMI". |

<p style="text-align: center;"> Activités structurées du Diagramme d'activité Facturer DMI (dépôt-vente) </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 3 - CommandeDMI | Ce flux permet au gestionnaire DMI de déclencher une demande de réassort en DMI auprès du fournisseur. |
| Flux 16a - TracabiliteReassortDMI | Ce flux porte les informations de traçabilité de demande de réassort en DMI. |
| Flux 13 - ConsommationDMI | Ce flux permet au gestionnaire DMI de déclaré le (les) DMI consommés auprès du fournisseur. |
| Flux 18 - TracabiliteFacturationDMI | Ce flux porte les informations de traçabilité de la facturation du (des) DMI. |
| Flux 17 - AutorisationPaiement | Ce flux permet au gestionnaire DMI de donner son accord (ou non) pour le paiement de la facture auprès du gestionnaire de comptabilité. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Facturer DMI (dépôt-vente) </p>

#### Facturer DMI (achat)

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.  
  
Préconditions:  
Réception de l’information de validation de la réception des DMI envoyée par le gestionnaire DMI au gestionnaire de comptabilité.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteFacturerDMI_achat.png"
    alt="Diagramme d'activité Facturer DMI (achat)"
    title="Diagramme d'activité Facturer DMI (achat)"
    style="width:6.5in;height:3.5in">

    <p>
    Diagramme d'activité Facturer DMI (achat)
    </p>
</div>

##### Actions

| Action | Description |
|:---|:---|
| Donner l’accord de paiement | Le gestionnaire DMI donne au gestionnaire de comptabilité l’accord de paiement du fournisseur sur la base de la facture transmise par ce dernier. |
| Déclencher le paiement de la facture | Le gestionnaire de comptabilité déclenche le processus de paiement de la facture. |
| Enregistrer les modalités de facturation | Le gestionnaire DMI trace les modalités de facturation du (des) DMI. Cette action est détaillée dans le processus « Tracer » avec le gestionnaire DMI qui représente, dans ce cas, la source de traçabilité. |

<p style="text-align: center;"> Actions du Diagramme d'activité Facturer DMI (achat) </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 18 - TracabiliteFacturationDMI | Ce flux porte les informations de traçabilité de la facturation du (des) DMI |
| Flux 17 : AutorisationPaiement | Ce flux permet au gestionnaire DMI de donner son accord (ou non) pour le paiement de la facture auprès du gestionnaire de comptabilité. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Facturer DMI (achat) </p>

#### Tracer

##### Workflow de l'activité

Ce processus permet de modéliser la traçabilité d'un évènement.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteTracer.png"
    alt="Diagramme d'activité Tracer"
    title="Diagramme d'activité Tracer"
    style="width:6in;height:3in">

    <p>
    Diagramme d'activité Tracer
    </p>
</div>

##### Actions

| Action | Description |
|:---|:---|
| Envoyer les informations de traçabilité | Cette action consiste à envoyer, pour un évènement, les informations de traçabilité au gestionnaire de traçabilité. |
| Enregistrer les informations de traçabilité | Cette action consiste à recevoir et enregistrer les informations de traçabilité du DMI. |

<p style="text-align: center;"> Actions du Diagramme d'activité Tracer </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 22 - TransmissionTrace | Ce flux permet de transmettre les informations de traçabilité d'un évènement. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Tracer </p>

#### Rechercher des traces

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.  

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteRechercheTrace.png"
    alt="Diagramme d'activité Rechercher des traces"
    title="Diagramme d'activité Rechercher des traces"
    style="width:6.5in;height:4in">

    <p>
    Diagramme d'activité Rechercher des traces
    </p>
</div>

##### Actions

| Action | Description |
|:---|:---|
| Rechercher les traces d'un ou plusieurs DMI | Le consommateur demande à rechercher les traces d'un ou plusieurs DMI commandé et/ou acquis et/ou utilisé par l'établissement. |
| Traiter la recherche des traces | Le gestionnaire de traçabilité reçoit et traite la recherche. |
| Traiter le retour du gestionnaire de traçabilité | Le consommateur reçoit et traite le retour du gestionnaire de traçabilité. |

<p style="text-align: center;"> Actions du Diagramme d'activité Rechercher des traces </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 23 - RechercheTraces | Ce flux porte les critères pour rechercher un ou plusieurs évènements de traçabilité |
| Flux 24 - ReponseRechercheTraces | Ce flux porte les informations répondant à la requête du Flux 23. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Rechercher des traces </p>

#### Consulter une trace

##### Workflow de l'activité

Ce processus permet d'identifier les flux définis dans le diagramme ci-après.

<div class="figure" style="text-align: center;">
    <img src="diagramme_activiteConsulterTrace.png"
    alt="Diagramme d'activité Consulter une trace"
    title="Diagramme d'activité Consulter une trace"
    style="width:6.5in;height:4in">

    <p>
    Diagramme d'activité Consulter une trace
    </p>
</div>

##### Actions

| Action | Description |
|:---|:---|
| Demander à consulter la trace d'un évènement | Le consommateur demande à consulter la trace d'un évènement. |
| Traiter la demande de consultation d'une trace | Le gestionnaire de traçabilité reçoit et traite la demande de recherche de l'évènement de trace à consulter. |
| Traiter le retour du gestionnaire de traçabilité | Le consommateur reçoit et traite le retour du gestionnaire de traçabilité. |

<p style="text-align: center;"> Actions du Diagramme d'activité Consulter une trace </p>

##### Flux identifiés

| Nom | Description |
|:---|:---|
| Flux 25 - ConsulterTrace | Ce flux porte les informations pour consulter un évènement de traçabilité. |
| Flux 26 - ReponseConsulterTrace | Ce flux porte les informations répondant à la requête du Flux 25. |

<p style="text-align: center;"> Flux identifiés du Diagramme d'activité Consulter une trace </p>

#### Synthèse des flux

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 68%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Flux 1 - DemandeDMI</td>
<td style="text-align: left;">Ce flux porte les informations de création, de mise à jour ou de suppression d'une demande de DMI.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 1c - TracabiliteDemande</td>
<td style="text-align: left;">Ce flux permet d'enregistrer la demande de DMI au sein du gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 2 - ReponseDemandeDMI</td>
<td style="text-align: left;">Ce flux permet au service utilisateur d'avoir des informations sur le traitement de leur demande.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 2a - TracabiliteReponse</td>
<td style="text-align: left;">Ce flux permet d'enregistrer la réponse du gestionnaire DMI au sein du gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 3 - CommandeDMI</td>
<td style="text-align: left;">Ce flux contient les informations nécessaires pour que le gestionnaire DMI passe une commande auprès de
son fournisseur.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 27 - TracabiliteCommande</td>
<td style="text-align: left;">Ce flux permet d'enregistrer la commande de DMI au sein du gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 4 - LivraisonDMI</td>
<td style="text-align: left;">Ce flux porte les informations envoyées vers le gestionnaire de réception concernant la livraison par le
fournisseur du (des) DMI. Cette livraison étant valide ou rejetée.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 5 - TracabiliteLivraisonValide</td>
<td style="text-align: left;">Ce flux permet au gestionnaire de réception de tracer la conformité de la totalité de la commande de DMI
par rapport aux bons de livraison dans le gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 5a - TracabiliteLivraisonRejet</td>
<td style="text-align: left;">Ce flux permet au gestionnaire de réception de tracer l'incohérence de la livraison avec les bons de réception des DMI dans le gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 5e - TracabiliteRejetDMI</td>
<td style="text-align: left;">Ce flux permet au gestionnaire de réception de tracer la cause du rejet de la réception du DMI dans le gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 5b - ReceptionUnitaireDMI</td>
<td style="text-align: left;">Ce flux véhicule les informations du DMI livré pour qu'il soit délivré par le gestionnaire DMI.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 5d - TracabiliteReceptionDMI</td>
<td style="text-align: left;">Ce flux permet au gestionnaire de réception de tracer la réception du DMI au sein de l'établissement dans
le gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 5c - TracabiliteEntreeStockDMI</td>
<td style="text-align: left;">Ce flux permet au gestionnaire de réception de tracer l'entrée au stock au sein de l'établissement du nouveau DMI dans le gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 6a - TracabiliteSortieStock</td>
<td style="text-align: left;">Ce flux permet au gestionnaire de DMI de tracer la sortie du stock de la PUI du (des) DMI délivrés.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 7 - TracabiliteDelivranceSU</td>
<td style="text-align: left;">Ce flux permet au service utilisateur de tracer la délivrance du (des) DMI au service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 6 - DelivranceSU</td>
<td style="text-align: left;">Ce flux porte les informations de délivrance des DMI au service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 8 - TransportDMI</td>
<td style="text-align: left;">Ce flux porte les informations de livraison du (des) DMI à destination du service utilisateur.<br />
Tout incident de transport est mentionné dans le flux.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 9 - TracabiliteTransportDMI</td>
<td style="text-align: left;">Ce flux permet au gestionnaire DMI de tracer le transport du (des) DMI dans le gestionnaire de
traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 11 - TracabiliteEntreeStockSU</td>
<td style="text-align: left;">Ce flux permet au gestionnaire de réception du service utilisateur de tracer l'entrée au stock du service
utilisateur du (des) DMI réceptionnés.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 12 - TracabiliteReceptionSU</td>
<td style="text-align: left;">Ce flux permet au service utilisateur de tracer la réception du (des) DMI dans leurs locaux.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 10 - ReceptionSU</td>
<td style="text-align: left;">Ce flux porte les informations de réception du (des) DMI au sein du service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 28 - TracabiliteRejetDMI</td>
<td style="text-align: left;">Ce flux permet au gestionnaire de réception du service utilisateur de tracer la cause du rejet de la réception du DMI dans le gestionnaire de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 15 -TracabilitePose</td>
<td style="text-align: left;">Ce flux permet au service utilisateur de tracer l'acte de pose du DMI chez le patient.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 14 - TracabiliteEchecPose</td>
<td style="text-align: left;">Ce flux porte les informations de traçabilité de l'échec de pose du DMI.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 13 - ConsommationDMI</td>
<td style="text-align: left;">Ce flux permet au service utilisateur<br />
- d'informer le gestionnaire DMI que le DMI est consommé,<br />
- alimenter le dossier patient informatisé, le dossier pharmaceutique, la lettre de liaison, dossier médical partagé.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 13a - TracabiliteRefusDMI</td>
<td style="text-align: left;">Ce flux porte les informations de traçabilité du refus de l'utilisation du DMI au plateau technique.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 30 - TracabiliteSortieStockSU</td>
<td style="text-align: left;">Ce flux permet au service utilisateur de tracer la sortie du stock du service utilisateur du (des) DMI.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 22 - TransmissionTrace</td>
<td style="text-align: left;">Ce flux permet de transmettre les informations de traçabilité d'un évènement.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 23 - RechercheTraces</td>
<td style="text-align: left;">Ce flux porte les critères pour rechercher un ou plusieurs évènements de traçabilité</td>
</tr>
<tr>
<td style="text-align: left;">Flux 24 - ReponseRechercheTraces</td>
<td style="text-align: left;">Ce flux porte les informations répondant à la requête du Flux 23.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 25 - ConsulterTrace</td>
<td style="text-align: left;">Ce flux porte les informations pour consulter un évènement de traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">Flux 26 - ReponseConsulterTrace</td>
<td style="text-align: left;">Ce flux porte les informations répondant à la requête du Flux 25.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Description du processus collaboratif et identification des flux </p>

### Elaboration des modèles hiérarchiques des flux structurés

Les flux échangés par les acteurs lors des processus métier collaboratifs ont été identifiés, définis et décrits dans les étapes 1,
2, 3 et 4. Le but de cette étape est d'élaborer pour chaque flux décris dans l'étape 4, la modélisation des données. La liste de ces items
intervenant dans la modélisation sont rendus opposables par l'arrêté du 8 septembre 2021, applicable à compter du 26 mai 2022 (cf "Arrêté du 8
septembre 2021 relatif au management de la qualité du circuit des dispositifs médicaux implantables dans les établissements de santé et
les installations de chirurgie esthétique"). 
  
Le modèle est formalisé par un diagramme de classes UML pour chaque flux faisant partie du périmètre de l’étude métier. La représentation
formalisée du flux doit prendre en compte les trois exigences suivantes:  
- les données sont modélisées en cohérence avec le Modèle des Objets de Santé (MOS) et les nomenclatures associées (NOS) gérés par l'ANS :  
MOS : https://esante.gouv.fr/interoperabilite/mos-nos  
NOS: https://esante.gouv.fr/interoperabilite/mos-nos/nos  
- réutilisation des types de données (classes) mis à disposition dans le MOS  
- définition des associations, y compris leurs cardinalités, entre les classes en respectant les besoins métier.

#### Flux 1 - DemandeDMI

Cette section présente le diagramme de classes du Flux 1 - DemandeDMI. Ce flux concerne la création, la mise à jour ou la suppression d'une
demande de DMI envoyée au gestionnaire DMI par le service utilisateur.

<div class="figure" style="text-align: center;">
    <img src="flux1_demandeDMI.png"
    alt="Flux 1 - DemandeDMI"
    title="Flux 1 - DemandeDMI"
    style="width:9in;height:5in">

    <p>
    Flux 1 - DemandeDMI
    </p>
</div>

##### Classe "Demande"

<table>
<colgroup>
<col style="width: 22%" />
<col style="width: 77%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">reference : [1..1] Identifiant</td>
<td style="text-align: left;">Référence unique de la demande (qui peut être une référence interne dans ce flux). Cet identifiant peut être
généré automatique au moment de la soumission de la demande. Ainsi, il peut ne pas être contenu dans le flux de création d'une demande DMI.</td>
</tr>
<tr>
<td style="text-align: left;">natureDemande : [0..1] Texte</td>
<td style="text-align: left;">Il s'agit de la nature de la demande de DMI. Dans ce flux, il s'agit d'une demande interne du service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">quantiteTotale : [1..1] Numerique</td>
<td style="text-align: left;">Il s'agit de la quantité totale des DMI concernés par la demande.</td>
</tr>
<tr>
<td style="text-align: left;">dateDem : [1..1] DateHeure</td>
<td style="text-align: left;">Il s'agit de la date de la demande par le service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">supprDemande : [0..1] boolean</td>
<td style="text-align: left;">Indicateur pour avertir le gestionnaire DMI que la demande de DMI est à supprimer.<br />
1 : la demande de DMI est supprimée, 0 : dans le cas contraire</td>
</tr>
<tr>
<td style="text-align: left;">motifSuppr : [0..1] Texte</td>
<td style="text-align: left;">Informations relatives à la suppression de la demande de DMI.</td>
</tr>
<tr>
<td style="text-align: left;">infoCompl : [0..1] Texte</td>
<td style="text-align: left;">Toute information complémentaire concernant le traitement de la demande de DMI.</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "Demande" </p>

##### Classe "Ligne"

| Nom | Description |
|:---|:---|
| idLigneAssocieeEntete : \[0..1\] Identifiant | Identifiant commun à toutes les lignes associées à la même entête de Demande. |
| dateUtilisation : \[0..1\] Date | Date prévue d'utilisation du DMI |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "Ligne" </p>

#### Flux 1c - TracabiliteDemande

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la demande ou de la suppression de la demande (Flux 1) de DMI envoyée
par le service utilisateur vers le gestionnaire DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du service utilisateur ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « DEM » de la nomenclature « TRE_R254-TypeEvenement » pour la demande et « SDM » pour la suppression de la demande.  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :
pour la première occurrence :  
. identifiant correspond à l’identifiant du professionnel du service utilisateur.  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence :
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 1   
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 1 encodé en binaire

#### Flux 2 - ReponseDemandeDMI

Cette section présente le diagramme de classes du Flux 2 - ReponseDemandeDMI. Il s'agit du flux de réponse de la part du gestionnaire DMI après avoir reçu la demande soit de création ou de mise à jour.

<div class="figure" style="text-align: center;">
    <img src="flux2_reponseDemandeDMI.png"
    alt="Flux 2 - ReponseDemandeDMI"
    title="Flux 2 - ReponseDemandeDMI"
    style="width:6in;height:3in">

    <p>
    Flux 2 - ReponseDemandeDMI
    </p>
</div>

##### Classe "Reponse"

| Nom | Description |
|:---|:---|
| reference : \[1..1\] Identifiant | Référence unique de la demande (qui peut être une référence interne dans ce flux). Cet identifiant peut être généré automatique au moment de la soumission de la demande. Ainsi, il peut ne pas être contenu dans le flux de création d'une demande DMI. |
| dateDem : \[0..1\] Date | Il s'agit de la date de la demande par le service utilisateur. |
| quantiteTotale : \[0..1\] Numerique | Il s'agit de la quantité totale des DMI concernés par la demande. |
| infoCompl : \[0..1\] Texte | Toute information complémentaire concernant le traitement de la demande de DMI. |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "Reponse" </p>

##### Classe "DetailReponse"

| Nom | Description |
|:---|:---|
| idDetailReponseAssocieEnteteReponse : \[0..1\] Identifiant | Identifiant commun à tous les "DetailReponse" associées à la même entête de "Reponse". |
| dateDelivrance : \[0..1\] Date | Il s'agit de la date prévue de délivrance du DMI par la PUI au service utilisateur. |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "DetailReponse" </p>

#### Flux 2a - TracabiliteReponse 

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la réponse à la demande (Flux 2) de DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au
système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « REP » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du service utilisateur.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 2  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 2 encodé en binaire

#### Flux 3 - CommandeDMI

Cette section présente le diagramme de classes du Flux 3 - CommandeDMI. 
Ce flux concerne la soumission par le gestionnaire DMI de la commande de
DMI auprès du fournisseur (fabricant ou distributeur).

<div class="figure" style="text-align: center;">
    <img src="flux3_commandeDMI.png"
    alt="Flux 3 - CommandeDMI"
    title="Flux 3 - CommandeDMI"
    style="width:9in;height:5in">

    <p>
    Flux 3 - CommandeDMI
    </p>
</div>

##### Classe "Commande"

| Nom | Description |
|:---|:---|
| refCommande : \[1..1\] Identifiant | Il s'agit de l'identifiant interne de la commande passée par le gestionnaire DMI. Cet identifiant peut être généré automatiquement au moment de la soumission d'une commande. |
| type : \[0..1\] Code | Il s'agit du type de la commande. |
| quantiteTotale : \[0..1\] Numerique | Il s'agit de la quantité totale des DMI commandés par le gestionnaire DMI au fournisseur. |
| dateCmd : \[0..1\] DateHeure | Il s'agit de la date et heure de la soumission de la commande envoyée par le gestionnaire DMI. |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "Commande" </p>

##### Classe "Ligne"

| Nom | Description |
|:---|:---|
| IdLigneAssocieeEnteteCommande : \[0..1\] Identifiant | Identifiant commun à toutes les lignes associées à la même entête Commande. |
| dateUtilisation : \[0..1\] Date | La date prévue d'utilisation du DMI |
| metadonnee : \[1..1\] [Metadonnee](#classe-metadonnee) | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "Ligne" </p>

#### Flux 27 - TracabiliteCommande

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la commande de DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « CDM » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du fournisseur.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 3  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 3 encodé en binaire

#### Flux 4 - LivraisonDMI 

Cette section présente le diagramme de classes du Flux 4 - LivraisonDMI.
Ce flux concerne la réception des DMI par le gestionnaire de réception.

<div class="figure" style="text-align: center;">
    <img src="flux4_livraisonDMI.png"
    alt="Flux 4 - LivraisonDMI"
    title="Flux 4 - LivraisonDMI"
    style="width:9in;height:5in">

    <p>
    Flux 4 - LivraisonDMI
    </p>
</div>

##### Classe "Livraison"

| Nom | Description |
|:---|:---|
| referenceCommande : \[1..1\] Identifiant | Numéro du bon de commande. |
| quantiteTotale : \[0..1\] Numerique | Quantité réceptionnée |
| dateLivraison : \[1..1\] DateHeure | La date et l'heure de la réception. |
| livraisonConforme : \[0..1\] boolean | Indicateur de la conformité de la livraison reçue par rapport aux bons de commande et de livraison du fournisseur (fabricant ou distributeur). |
| motifRejet : \[0..1\] Texte | Information complémentaire décrivant le motif du rejet de la livraison par le gestionnaire de réception. |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "Livraison" </p>

#### Flux 5 - TracabiliteLivraisonValide

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la conformité de la livraison de DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  

- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au
système du gestionnaire de réception ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « REC » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire de réception.  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 4  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 4 encodé en binaire

#### Flux 5a - TracabiliteLivraisonRejet

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du rejet de la livraison de DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire de réception ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « NRE » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire de réception.  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence : 
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 4  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 4 encodé en binaire

#### Flux 5b - ReceptionUnitaireDMI

Cette section présente le diagramme de classes du Flux 5b - ReceptionUnitaireDM. Ce flux concerne les DMI réceptionnés par le gestionnaire de réception.

<div class="figure" style="text-align: center;">
    <img src="flux5b_receptionUnitaireDMI.png"
    alt="Flux 5b - ReceptionUnitaireDMI"
    title="Flux 5b - ReceptionUnitaireDMI"
    style="width:9in;height:5in">

    <p>
    Flux 5b - ReceptionUnitaireDMI
    </p>
</div>

##### Classe "StatutReception"

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 70%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">receptionConforme : [1..1] boolean</td>
<td style="text-align: left;">Indicateur de la conformité du dispositif<br />
0 dispositif conforme (i.e. non périmé, ne faisant l'objet d'aucune alerte ou retrait de lot, ou autre non-conformité)<br /> 
1 dispositif non conforme.</td>
</tr>
<tr>
<td style="text-align: left;">motifRejet : [0..1] Texte</td>
<td style="text-align: left;">Information complémentaire décrivant le motif du rejet de la réception du dispositif.</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "StatutReception"</p>

#### Flux 5c - TracabiliteEntreeStockDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de l'entrée en stock du DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « ESD » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire de réception  
. role = émetteur de la trace (cet attribut est nomenclaturé).   pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 5b  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 5b encodé en binaire

#### Flux 5d - TracabiliteReceptionDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la réception unitaire du DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « REC » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire de réception  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 5b  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 5b encodé en binaire

#### Flux 5e - TracabiliteRejetDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du rejet de la réception unitaire du DM.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « NCO » ou « PER » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire de réception  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 5b  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 5b encodé en binaire

#### Flux 6 - DelivranceSU

Cette section présente le diagramme de classes du Flux 6 - DelivranceSU.
Ce flux concerne l'envoie des informations nécessaires au gestionnaire de réception du service utilisateur concernant les DMI délivrés par la PUI.

<div class="figure" style="text-align: center;">
    <img src="flux6_delivrerSU.png"
    alt="Flux 6 - DelivrerSU"
    title="Flux 6 - DelivrerSU"
    style="width:9in;height:5in">

    <p>
    Flux 6 - DelivrerSU
    </p>
</div>

##### Classe "Delivrance"

| Nom | Description |
|:---|:---|
| referenceDelivrance : \[1..1\] Identifiant | Référence unique de la délivrance (qui peut être une référence interne). |
| dateDelivrance : \[1..1\] DateHeure | Date de délivrance au service utilisateur. |
| quantiteDelivree : \[1..1\] Numerique | Il s'agit de la quantité totale des DMI délivrés au service utilisateur. |
| informationComplementaire : \[0..1\] Texte | Toutes informations complémentaires concernant la délivrance de DMI au service utilisateur. |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "Delivrance"</p>

####  Flux 6a - TracabiliteSortieStock

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la sortie du stock de la PUI du (des) DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « SSD » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire DMI  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 6  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 6 encodé en binaire

#### Flux 7 - TracabiliteDelivranceSU

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la délivrance du (des) DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « DEL » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire DMI  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 6  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 6 encodé en binaire

#### Flux 8 - TransportDMI 

Cette section présente le diagramme de classes du Flux 8 - TransportDMI.
Ce flux concerne l'envoie des informations nécessaires au gestionnaire de réception du service utilisateur concernant le transport des DMI qui sont acheminés.

<div class="figure" style="text-align: center;">
    <img src="flux8_transportDMI.png"
    alt="Flux 8 - TransportDMI"
    title="Flux 8 - TransportDMI"
    style="width:8in;height:4in">

    <p>
    Flux 8 - TransportDMI
    </p>
</div>

##### Classe "Transport"

<table>
<colgroup>
<col style="width: 34%" />
<col style="width: 65%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">referenceTransport : [1..1] Identifiant</td>
<td style="text-align: left;">Référence unique du transport (qui peut être une référence interne).</td>
</tr>
<tr>
<td style="text-align: left;">referenceDelivrance : [1..1] Identifiant</td>
<td style="text-align: left;">Référence de la délivrance du (des) DMI associée à ce transport.</td>
</tr>
<tr>
<td style="text-align: left;">dateDelivrance : [1..1] DateHeure</td>
<td style="text-align: left;">Date de délivrance au service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">quantiteTransportee : [1..1] Numerique</td>
<td style="text-align: left;">Il s'agit de la quantité totale des DMI transportés par le service logistique vers le gestionnaire de réception
du service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">IncidentTransport : [0..1] boolean</td>
<td style="text-align: left;">Indicateur de la conformité du transport du (des) dispositif(s)<br />
0 aucun incident durant le transport du (des) dispositif(s).<br />
1 incident survenu durant le transport du (des) dispositif(s).</td>
</tr>
<tr>
<td style="text-align: left;">detailIncident : [0..1] Texte</td>
<td style="text-align: left;">Information complémentaire décrivant l'incident survenu sur le(s) dispositif(s) pendant le transport.</td>
</tr>
<tr>
<td style="text-align: left;">informationComplementaire : [0..1]
Texte</td>
<td style="text-align: left;">Toutes informations complémentaires concernant le transport du (des) DMI vers le gestionnaire de réception du service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "Transport"</p>

#### Flux 9 - TracabiliteTransportDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du transport du (des) DMI délivrés au service utilisateur.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « TRA » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire DMI  
. role = émetteur de la trace (cet attribut est nomenclaturé).   pour la deuxième occurrence  
. identifiant correspond à l’identifiant du service utilisateur.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 8  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 8 encodé en binaire

#### Flux 10 - ReceptionSU

Cette section présente le diagramme de classes du Flux 10 - ReceptionSU.
Ce flux concerne l'envoie des informations nécessaires au service
utilisateur concernant la réception des DMI dans ses locaux.

<div class="figure" style="text-align: center;">
    <img src="flux10_receptionSU.png"
    alt="Flux 10 - ReceptionSU"
    title="Flux 10 - ReceptionSU"
    style="width:9in;height:5in">

    <p>
    Flux 10 - ReceptionSU
    </p>
</div>

##### Classe "ReceptionDMI"

| Nom | Description |
|:---|:---|
| referenceReception : \[1..1\] Identifiant | Référence unique de la réception des DMI au sein du service utilisateur (qui peut être une référence interne). |
| referenceDelivrance : \[1..1\] Identifiant | Référence unique de la délivrance qui est associée à cette réception des DMI. |
| quantiteReceptionnee : \[0..1\] Numerique | Il s'agit de la quantité totale des DMI réceptionnés. |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "ReceptionDMI"</p>

##### Classe "Ligne"

<table>
<colgroup>
<col style="width: 27%" />
<col style="width: 72%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">dateReceptionSU : [1..1] DateHeure</td>
<td style="text-align: left;">Date de reception du DMI</td>
</tr>
<tr>
<td style="text-align: left;">receptionConforme : [1..1] boolean</td>
<td style="text-align: left;">Indicateur de la conformité du dispositif<br />
0 dispositif conforme<br />
1 dispositif non conforme (i.e. en cas d'erreur de la PUI ou du transporteur, si le DMI réceptionné n'est pas conforme et/ou ne correspond pas au DMI qui avait été demandé) .</td>
</tr>
<tr>
<td style="text-align: left;">motifRejet : [0..1] Texte</td>
<td style="text-align: left;">Information complémentaire décrivant le motif du rejet de la réception du dispositif dans le service utilisateur.</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des sclasses et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "Ligne"</p>

#### Flux 11 - TracabiliteEntreeStock

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour l'entrée en stock du (des) DMI au sein du service utilisateur.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire de réception du service utilisateur ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « ESD » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du service utilisateur.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 10  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 10 encodé en binaire

#### Flux 12 - TracabiliteReceptionSU

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour la réception du (des) DMI au sein du service utilisateur.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire de réception du service utilisateur ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « REC » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du service utilisateur.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 10  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 10 encodé en binaire

#### Flux 28 - TracabiliteRejetDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du rejet de la réception du DM au sein du service utilisateur.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « NCO » ou « PER » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire de réception service utilisateur  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du service utilisateur.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 10  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 10 encodé en binaire

#### Flux 13 - ConsommationDMI

Cette section présente le diagramme de classes du Flux 13 - ConsommationDMI. Ce flux concerne l'envoie des informations nécessaires au gestionnaire DMI concernant la pose du (des) DMI par le service utilisateur chez un patient.

<div class="figure" style="text-align: center;">
    <img src="flux13_consommationDMI.png"
    alt="Flux 13 - ConsommationDMI"
    title="Flux 13 - ConsommationDMI"
    style="width:9in;height:5in">

    <p>
    Flux 13 - ConsommationDMI
    </p>
</div>

##### Classe "InterventionMedicale"

<table>
<colgroup>
<col style="width: 32%" />
<col style="width: 67%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">idIntervention : [1..1] Identifiant</td>
<td style="text-align: left;">Identifiant de l’intervention médicale.</td>
</tr>
<tr>
<td style="text-align: left;">numSejour : [0..1] Identifiant</td>
<td style="text-align: left;">Numéro de séjour correspondant à l’intervention médicale.</td>
</tr>
<tr>
<td style="text-align: left;">typeIntervention : [0..1] Code</td>
<td style="text-align: left;">Code spécifiant le type d’intervention.</td>
</tr>
<tr>
<td style="text-align: left;">dateIntervention : [1..1] DateHeure</td>
<td style="text-align: left;">Date/heure à laquelle l’intervention a eu lieu.</td>
</tr>
<tr>
<td style="text-align: left;">emplacementDMI : [0..1] Texte</td>
<td style="text-align: left;">Emplacement anatomique du DMI posé.</td>
</tr>
<tr>
<td style="text-align: left;">poseConforme : [1..1] boolean</td>
<td style="text-align: left;">Indicateur de la conformité de la pose du dispositif<br />
0 aucun échec de pose pour ce dispositif.<br />
1 échec de la pose du dispositif.</td>
</tr>
<tr>
<td style="text-align: left;">motifEchec : [0..1] Texte</td>
<td style="text-align: left;">Information complémentaire décrivant le motif de l'échec de la pose du dispositif.</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "InterventionMedicale"</p>

####  Flux 30 - TracabiliteSortieStockSU

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de la sortie du stock du (des) DMI du service utilisateur.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au système du gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « SSD » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du service utilisateur  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 13  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 13 encodé en binaire

#### Flux 13a - TracabiliteRefusDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité du refus de la part du service utilisateur d'utiliser le DMI durant l'opération.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au service utilisateur ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « NCO » ou « PER » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du service utilisateur  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 13  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 13 encodé en binaire

#### Flux 14 - TracabiliteEchecPose

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité de l'échec de pose du DMI durant l'opération.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au service utilisateur ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « ECH » ou « NCO » ou « PER » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du service utilisateur  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 13  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 13 encodé en binaire

#### Flux 15 -TracabilitePose

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour la pose du DMI chez le patient pendant l'opération.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au service utilisateur ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « POS » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du service utilisateur  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 13  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 13 encodé en binaire

#### Flux 16a - TracabiliteReassortDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour le réassort en DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « REA » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du fournisseur.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  
  
- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 3  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 3 encodé en binaire

#### Flux 17 - AutorisationPaiement

Cette section présente le diagramme de classes du Flux 17 - AutorisationPaiement. Ce flux concerne l'envoie des informations nécessaires au gestionnaire de compatibilité afin de régler la facture auprès du fournisseur.

<div class="figure" style="text-align: center;">
    <img src="flux17_authorisationPaiement.png"
    alt="Flux 17 - AutorisationPaiement"
    title="Flux 17 - AutorisationPaiement"
    style="width:9in;height:5in">

    <p>
    Flux 17 - AutorisationPaiement
    </p>
</div>

##### Classe "Facture"

| Nom | Description |
|:---|:---|
| refFacture : \[1..1\] Identifiant | Identifiant de la facture du fournisseur. |
| facture : \[0..1\] ObjetBinaire | Valeur binaire de la facture du fournissuer. |
| typeFacture : \[0..1\] Code | Il s'agit de l'attribut spécifiant le type de la facture. |
| refCommande : \[1..1\] Identifiant | Numéro de la commande ou du bon de commande associée à la facture. |
| dateEmission : \[0..1\] Date | Date d'émission de la facture. |
| instructionPaiement : \[0..1\] Texte | Toute instruction de paiement pour le règlement de la facture. |
| montantTotal : \[0..1\] Numerique | Montant total de la facture à régler |
| devise : \[0..1\] Code | Devise de règlement de la facture |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "Facture"</p>

##### Classe "Ligne"

| Nom | Description |
|:---|:---|
| dateAchat : \[1..1\] Date | Date d'achat du DMI par l'établissement. |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "Ligne"</p>

#### Flux 18 - TracabiliteFacturationDMI

Ce flux concerne l'enregistrement dans le gestionnaire de traçabilité pour le paiement de la facture de DMI.  
  
Ce flux est un cas particulier du "Flux 22 - TransmissionTrace" avec :  
  
- la classe Trace avec l’attribut :  
. identifiant : identifiant de la trace.  
  
- la classe SourceTrace avec l’attribut :  
. identifiant : identifiant de la source de la trace qui correspond au gestionnaire DMI ayant émis la trace.  
  
- la classe Evenement dont les attributs sont définis par :  
. typeEvenement correspondant au code « AUT » de la nomenclature « TRE_R254-TypeEvenement ».  
. occurence correspond à la date/heure à laquelle le flux a été généré.  
. declaration correspond à la date/heure à laquelle le flux a été transmis.  
. description correspond à la description textuelle de l'évènement.  
  
- deux occurrences de la classe ActeurEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. identifiant correspond à l’identifiant du gestionnaire DMI.  
. role = émetteur de la trace (cet attribut est nomenclaturé).  
pour la deuxième occurrence  
. identifiant correspond à l’identifiant du gestionnaire de comptabilité.  
. role = récepteur de la trace (cet attribut est nomenclaturé).  

- deux occurrences de la classe ObjetEvenement dont les attributs sont définis par :  
pour la première occurrence :  
. type correspond au type de l’objet = « Structuré » (cet attribut est nomenclaturé).  
. contenu correspond à l'ensemble des classes correspondant au contenu structuré du Flux 17  
pour la deuxième occurrence :  
. type correspond au type de l’objet = « Non structuré » (cet attribut est nomenclaturé).  
. contenu correspond aux informations métiers du Flux 17 encodé en binaire

#### Flux 22 - TransmissionTrace

Ce flux correspond au « Flux 1 – TransmissionTrace » de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier –
Généricisation : Spécifications fonctionnelles des échanges Gestion des traces).  
Dans le flux « TransmissionTrace » : L’acteur « source de traces » envoie par la méthode POST la demande de traitement de création d’une trace constituée d’une ressource générique (transaction) qui contient :  
- Les attributs de l’événement  
- La description détaillée de l’événement au format non structuré  
- La description détaillée de l’événement au format structuré  
  
Les objets entrant dans la composition de ce flux (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces) correspondent à :  
- la classe Trace  
- la classe SourceTrace  
- la classe Evenement  
- la classe ActeurEvenement  
- la classe ObjetEvenement

#### Flux 23 - RechercheTraces

Ce flux correspond au « Flux 4 – RechercheTraces » de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). Les paramètres de recherche génériques sont ici complétés en
fonction des flux métiers de cette étude.

La table ci-dessous qui liste ces paramètres n’est pas exhaustive.

<table style="width:91%;">
  <colgroup>
    <col style="width: 37%" />
    <col style="width: 53%" />
  </colgroup>
  <thead>
    <tr>
      <th style="text-align: center;">Classe/attribut</th>
      <th style="text-align: center;">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2" style="text-align: left;">
        Tous les paramètres génériques de l'étude (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces)
      </td>
    </tr>
    <tr>
      <td style="text-align: left;">autreParametres</td>
      <td style="text-align: left;">
        <p>Paramètres à renseigner en fonction des flux métiers. Ceux-ci peuvent correspondre à :</p>
        <ul>
          <li>DispositifMedical/support/identifiantHRF (Identifiant du dispositif médical)</li>
          <li>DispositifMedical/support/IUD-ID (Identifiant du modèle du dispositif médical)</li>
          <li>DispositifMedical/support/IUD-IPNumLot (Numéro du lot auquel appartient le DM)</li>
          <li>DispositifMedical/support/IUD-IPNumSerie (Numéro de série propre au DM)</li>
          <li>DispositifMedical/codeEMDN (Code du dispositif médical)</li>
          <li>DispositifMedical/referenceFabricant</li>
          <li>Patient/identite/matriculeINS (Identifiant du patient national)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Flux 24 - ReponseRechercheTraces

Ce flux correspond au « Flux 5 - ReponseRechercheTraces» de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier –
Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). Le modèle du flux est identique au Flux 22 de cette étude à la
différence que la recherche peut ne retourner aucune source, une seule ou plusieurs.

#### Flux 25 - ConsulterTrace

Ce flux correspond au « Flux 2 - ConsultationTrace» de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier – Généricisation : Spécifications fonctionnelles des échanges Gestion des traces).

#### Flux 26 - ReponseConsulterTrace

Ce flux correspond au « Flux 3 - ReponseConsultationTrace» de l’étude métier du volet « Traçabilité d’événements » (cf. CI-SIS Etude métier –
Généricisation : Spécifications fonctionnelles des échanges Gestion des traces). Le modèle du flux est identique au Flux 22 de cette étude à la
différence que la consultation peut ne retourner aucune source, une seule ou plusieurs.

#### Classes communes aux flux

##### Classe "Adresse"

Adresse géopostale. Un emplacement auquel une personne ou une organisation peut être trouvée ou être atteinte, d'après la norme NF Z 10-011.

<table>
<colgroup>
<col style="width: 35%" />
<col style="width: 64%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">identificationDestinataire : [0..1] Texte</td>
<td style="text-align: left;">Eléments d'identification du destinataire c’est-à-dire la personne physique ou morale à qui un envoi est adressé.<br />
1) Le destinataire est une personne physique :<br />
* Qualité: civilité ou condition sociale, civile, juridique ou titre sous lequel une partie figure dans un acte juridique.<br />
* Prénom<br />
* Nom<br />
* Titre: désignation honorifique exprimant une distinction de rang, une dignité (titres nobiliaires, religieux, militaires, etc.).<br />
* Profession, fonction<br />
Une personne physique peut être désignée soit par son nom et éventuellement son prénom, soit par son nom et sa fonction ou sa profession, enfin, dans certains cas particuliers, par ses seuls titres, fonction ou profession.<br />
2) Le destinataire est une personne morale :<br />
* Forme juridique: Indication du statut juridique de la personne morale : SA, SARL, GIE, Société civile, Mutuelle, Association, Fondation, etc.<br />
* Raison ou dénomination sociale<br />
* Domaine d'activité<br />
* Enseigne commerciale<br />
* Nom commercial<br />
* Subdivision au sein de l'entreprise (Direction, service, etc.) ou organisation interne de la personne morale (fonctionnelle ou géographique).<br />
Une personne morale peut être désignée au moins par sa raison sociale, son enseigne ou nom commercial.</td>
</tr>
<tr>
<td style="text-align: left;">identificationDomicilie : [0..1]
Texte</td>
<td style="text-align: left;">Eléments d'identification du domicilié c’est-à-dire le titulaire du domicile du destinataire (lieu ordinaire d'habitation, demeure légale et habituelle)<br />
1) Le domicilié est une personne physique:<br />
* Qualité<br />
* Prénom<br />
* Nom<br />
* Titre<br />
* Profession, fonction<br />
Les éléments d'identification du domicilié sont précédés de la mention «chez»<br />
2) Le domicilié est une personne morale:<br />
* Forme juridique<br />
* Dénomination sociale<br />
* Activité principale<br />
* Enseigne ou nom de l'établissement<br />
* Subdivision au sein de l'entreprise (Direction, service,...).</td>
</tr>
<tr>
<td style="text-align: left;">pointRemise : [0..1] Texte</td>
<td style="text-align: left;">Lieu où le destinataire prend possession de son courrier. Il est matérialisé, dans la plupart des cas, par la
présence<br />
d'une boîte aux lettres; il est constitué des éléments suivants :<br />
* Local ou logement : Numéro ou désignation d'appartement, logement, pièce, bureau, local commercial ou industriel<br />
* Accès au local ou au logement: indications de couloir, d'étage ou de niveau<br />
* Boîte aux lettres : Numéro voire dénomination (éventuellement CIDEX)<br />
* Accès à la boîte à lettres: si nécessaire,: identification du couloir d'accès, de la batterie de boîtes s'il en existe plusieurs<br />
* Code acheminement interne à l'entreprise (CAIE): Codification identifiant le découpage au sein de l'entreprise en vue du traitement de
courrier par les services dédiés internes à l'entreprise. Les informations d'identification du domicilié (Chez M.X) pourraient figurer
dans cet attribut.</td>
</tr>
<tr>
<td style="text-align: left;">complementPointGeographique : [0..1]
Texte</td>
<td style="text-align: left;">Un complément de l'adresse au point géographique constitué des éléments suivants:<br />
* Bâtiment: les bâtiments sont désignés par leur type (bâtiment, immeuble, tour,...), éventuellement des mentions d'orientation (est,
ouest,...), une dénomination littérale ou une numérotation; exemple: Tour DELTA<br />
* Accès au bâtiment: l'accès au bâtiment est identifié par un numéro, une lettre, une combinaison alphanumérique. Ces éléments identifient une
entrée, porte, etc.; exemple: Entrée A<br />
* Ensemble immobilier: ensemble d'habitations reliées à la voie publique par un ou plusieurs points d'accès (résidence, zone<br />
industrielle,...); exemple: Résidence des Fleurs.</td>
</tr>
<tr>
<td style="text-align: left;">numeroVoie : [0..1] Texte</td>
<td style="text-align: left;">Un numéro dans la voie; dans les cas de numérotation sans extension, il est composé de 0 à 4 caractères
numériques au maximum.</td>
</tr>
<tr>
<td style="text-align: left;">extension : [0..1] Texte</td>
<td style="text-align: left;">Extension ou indice de répétition: mention bis, ter, quater, ...ou une lettre A, B, C, D, etc. lorsque ce caractère
complète une numérotation de voirie.</td>
</tr>
<tr>
<td style="text-align: left;">typeVoie : [0..1] <a href="http://mos.asipsante.fr/NOS/PDF/TRE_R35-TypeVoie.tabs.pdf">Code &lt;&lt;TRE_R35-TypeVoie&gt;&gt;</a></td>
<td style="text-align: left;">Type de voie : rue, avenue, boulevard, etc.<br />
Attribut obsolète et non conforme à la norme postale en vigueur qui définit cette information comme faisant partie de l'attribut libelleVoie. Il apparait dans la classe Adresse uniquement parce que des systèmes existants l'utilisent encore.<br />
Les valeurs de ce code sont répertoriées dans la nomenclature TRE_R35-TypeVoie.</td>
</tr>
<tr>
<td style="text-align: left;">libelleVoie : [0..1] Texte</td>
<td style="text-align: left;">Appellation qui est donnée à la voie par les municipalités. Ce libellé figure in extenso ou en abrégé sur les
plaques aux différents angles de chaque rue.<br />
Synonyme: nom de la voie</td>
</tr>
<tr>
<td style="text-align: left;">lieuDit : [0..1] Texte</td>
<td style="text-align: left;">Lieu qui porte un nom rappelant une particularité topographique ou historique et qui, souvent, constitue un
écart d'une commune (un écart est une petite agglomération distincte du centre de la commune à laquelle elle appartient).</td>
</tr>
<tr>
<td style="text-align: left;">mentionDistribution : [0..1] Texte</td>
<td style="text-align: left;">Mentions particulières de distribution. Il s'agit de mentions identifiant le service proposé par La Poste au
destinataire. Ces mentions sont formées d'un libellé et d'un numéro de séparation (exemple : BP 42534).</td>
</tr>
<tr>
<td style="text-align: left;">codePostal : [0..1] Code</td>
<td style="text-align: left;">Code Postal : Code Postal ou code postal spécifique CEDEX<br />
* Code postal: Un code à 5 chiffres servant à l'acheminement et/ou à la distribution des envois. Il identifie un bureau distributeur dans la
chaîne de traitement du courrier.<br />
* Code CEDEX (Courrier d'Entreprise à Distribution Exceptionnelle); le CEDEX est une modalité d'acheminement du courrier associée à des
services particuliers de distribution offerts aux entreprises caractérisées par un adressage spécifique; le code postal spécifique CEDEX est un code attribué aux organismes, entreprises, services publics recevant un fort trafic. Il identifie un client ou un ensemble de clients. Il est positionné aux lieu et place du code postal général dans le cas des adresses CEDEX. Ainsi, un code peut être associé à un client (code individuel) ou partagé entre plusieurs clients (code collectif).</td>
</tr>
<tr>
<td style="text-align: left;">localite : [0..1] Texte</td>
<td style="text-align: left;">Localité ou Libellé du bureau distributeur CEDEX<br />
** Localité: Zone d'habitation, en général la commune d'implantation du destinataire. Elle est identifiée par son libellé INSEE sauf dans
quelques cas où le libellé postal diffère du libellé INSEE, généralement pour lever des ambiguïtés.<br />
** Libellé du bureau distributeur CEDEX.<br />
Libellé du bureau distributeur c'est-à-dire (dans la très grande majorité des cas) le libellé de la commune siège du bureau CEDEX; la
mention CEDEX doit obligatoirement suivre le libellé du bureau CEDEX; dans le cas où il existe plusieurs bureaux CEDEX pour une même entité ou
commune, chaque bureau CEDEX sera identifié par un numéro (exemple : ROUBAIX CEDEX 2); ce numéro correspond au numéro d'arrondissement dans
le cas des villes à arrondissements, à un numéro d'ordre dans les autres cas.</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [0..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "Adresse"</p>

##### Classe "DispositifMedical"

Cette classe correspond à l'élaboration de la brique élémentaire du dispositif médical (DM). Cette modélisation a été réalisée en collaboration avec les Groupes de Travail « Dispositifs Médicaux » pilotés par Interop’Santé/PHAST/ANS depuis 2019.

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 68%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">support : [0..1] <a
href="#classe-supportiud">SupportIUD</a></td>
<td style="text-align: left;">Le support IUD est la manière dont l'IUD est communiqué grâce à l'AIDC et, le cas échéant, son marquage en clair.<br />
Parmi les supports IUD, on trouve notamment les codes à barres unidimensionnels ou linéaires, les codes à barres à deux dimensions/code QR, les identifiants RFID.</td>
</tr>
<tr>
<td style="text-align: left;">identifiantLocalDM : [0..*] Identifiant</td>
<td style="text-align: left;">Identifiants affectés au dispositif médical dans les référentiels locaux.</td>
</tr>
<tr>
<td style="text-align: left;">classeRisque : [0..1] Code</td>
<td style="text-align: left;">Classe de risque du dispositif. Les dispositifs sont répartis en classe I, classe IIa, classe IIb et classe
III en fonction de la destination des dispositifs et des risques qui leur sont inhérents. La classification est effectuée conformément à
l'annexe VIII du Règlement (UE) 2017/745.</td>
</tr>
<tr>
<td style="text-align: left;">marquageCE : [0..1] <a href="#classe-marquagece">MarquageCE</a></td>
<td style="text-align: left;">Précise si le DM a obtenu le arquage CE et renvoie vers l'organisme ayant accordé le marquage CE au DM.</td>
</tr>
<tr>
<td style="text-align: left;">referenceFabricant : [0..1] Identifiant</td>
<td style="text-align: left;">Référence du dispositif médical ou numéro dans le catalogue du fabricant.</td>
</tr>
<tr>
<td style="text-align: left;">referenceDistributeur : [0..1] Identifiant</td>
<td style="text-align: left;">Référence du dispositif médical ou numéro dans le catalogue du distributeur.</td>
</tr>
<tr>
<td style="text-align: left;">modele : [0..1] Texte</td>
<td style="text-align: left;">Modèle du dispositif médical.</td>
</tr>
<tr>
<td style="text-align: left;">nomCommercial : [0..1] Texte</td>
<td style="text-align: left;">Dénomination commerciale du dispositif médical.</td>
</tr>
<tr>
<td style="text-align: left;">codeEMDN : [0..1] Code</td>
<td style="text-align: left;">Code du dispositif médical dans la nomenclature EMDN (European Medical Device Nomenclature).</td>
</tr>
<tr>
<td style="text-align: left;">usageUnique : [0..1] Indicateur</td>
<td style="text-align: left;">Indicateur pour spécifier si le dispositif est à usage unique.<br />
1 : dispositif à usage unique, 0 : dans le cas contraire.</td>
</tr>
<tr>
<td style="text-align: left;">nbReutilisation : [0..1] integer</td>
<td style="text-align: left;">Le nombre limité de réutilisations du dispositif médical.</td>
</tr>
<tr>
<td style="text-align: left;">emballageSterile : [0..1] Indicateur</td>
<td style="text-align: left;">Indicateur pour spécifier si le dispositif a un emballage stérile.<br />
1 : dispositif stérile, 0 : dans le cas contraire.</td>
</tr>
<tr>
<td style="text-align: left;">sterilisationAvantUtilisation : [0..1] Indicateur</td>
<td style="text-align: left;">Indicateur pour spécifier si le dispositif doit être stérilisé avant utilisation.<br />
1 : dispositif doit être stérilisé, 0 : dans le cas contraire.</td>
</tr>
<tr>
<td style="text-align: left;">contientLatex : [0..1] Indicateur</td>
<td style="text-align: left;">Indicateur pour spécifier si le dispositif contient du latex.<br />
1 : dispositif contient du latex, 0 : dans le cas contraire.</td>
</tr>
<tr>
<td style="text-align: left;">CMR1A1B : [0..1] Indicateur</td>
<td style="text-align: left;">Indicateur pour spécifier si le dispositif contient des substances CMR IA et IB.<br />
1 : dispositif contient des substances CMR 1A et 1B, 0 : dans le cas contraire.</td>
</tr>
<tr>
<td style="text-align: left;">implantable : [0..1] Indicateur</td>
<td style="text-align: left;">Indicateur pour spécifier si le dispositif est implantable.<br />
1 : dispositif implantable, 0 : dans le cas contraire.</td>
</tr>
<tr>
<td style="text-align: left;">actif : [0..1] Indicateur</td>
<td style="text-align: left;">Indicateur pour spécifier si le dispositif est actif.<br />
L’article 2 partie 4 du Règlement (UE) 2017/745 du 5 avril 2017 définit les dispositifs actifs comme "tout dispositif dont le fonctionnement
dépend d'une source d'énergie autre que celle générée par le corps humain à cette fin ou par la pesanteur et agissant par modification de
la densité de cette énergie ou par conversion de celle-ci. Les dispositifs destinés à la transmission d'énergie, de substances ou d'autres éléments, sans modification significative, entre un dispositif actif et le patient ne sont pas réputés être des dispositifs actifs. Les
logiciels sont aussi réputés être des dispositifs actifs."<br />
1 : dispositif actif, 0 : dans le cas contraire.</td>
</tr>
<tr>
<td style="text-align: left;">irmCompatible : [0..1] Code</td>
<td style="text-align: left;">La norme ASTM (American Society for Testing and Materials ) F2503 distingue 3 niveaux de compatibilité IRM
d’un dispositif médical :<br />
‒ « MR Safe » (IRM compatible sans conditions) : dispositifs pouvant être introduits dans tout type d’IRM sans risque (matériau non
conducteur, non métallique, non magnétique) ;<br />
‒ « MR Unsafe » (non IRM compatible) : dispositifs engendrant un risque pour le patient lors de son introduction dans l’IRM ;<br />
‒ « MR Conditional » (IRM compatible sous conditions) : dispositifs pouvant être introduits dans l’IRM sous des conditions précises pré
spécifiées par le fabricant. Seul le respect de toutes ces conditions pourra permettre la réalisation d’une IRM sans risque. Cela revient à
évaluer les conditions dans lesquelles un dispositif médical n’est pas dangereux dans un environnement à résonance magnétique.<br />
<br />
La FDA recommande que tous les Dispositifs Médicaux Implantables Actifs (DMIA) soient classés « MR Conditional » (IRM compatible sous
conditions) ou « MR Unsafe » (non IRM compatible) selon les cas, compte tenu de la présence de composants électroniques conducteurs. Autrement
dit, un DMIA ne doit jamais être considéré comme « MR Safe ».<br />
<br />
La création de la nomenclature associée est en cours.</td>
</tr>
<tr>
<td style="text-align: left;">dimensionsCliniques : [0..1] <a
href="#classe-dimensionsdm">DimensionsDM</a></td>
<td style="text-align: left;">Dimensions cliniques du dispositif.</td>
</tr>
<tr>
<td style="text-align: left;">codeLPP : [0..1] Code</td>
<td style="text-align: left;">Code LPP du DM.<br />
Il s'agit d'un code national utilisé pour obtenir le remboursement par l'Assurance Maladie de certains DM (implantables ou invasifs non
implantables) en sus des prestations d’hospitalisations à l’hôpital, ou le remboursement de certains produits et prestations en ville.</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "DispositifMedical"</p>

##### Classe "MarquageCE"

<table>
<colgroup>
<col style="width: 28%" />
<col style="width: 71%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">organismeNotifie : [0..1] <a
href="#classe-entitejuridique">EntiteJuridique</a></td>
<td style="text-align: left;">Données relatives à l’organisme notifié ayant accordé le marquage CE au DM, n’est pas obligatoire pour les DM de classe I (autocertification).</td>
</tr>
<tr>
<td style="text-align: left;">libelleAutorisation : [1..1] Texte</td>
<td style="text-align: left;">Identification de l’autorisation qui a été délivrée par l’organisme règlementaire. Il s’agit en France, du numéro
d’agrément sanitaire constitué :<br />
- de la lettre F (pour France)<br />
- du n° de codification du département<br />
- du n° de codification de la commune ou , pour Paris, Lyon et Marseille, de l’arrondissement,<br />
- du n° d’ordre de l’établissement dans la commune ou l’arrondissement<br />
- de la mention CEE (pour Communauté Economique Européenne<br />
Exemple : F 22.049.01 CEE (arrêté du 6 nov 2000 : ministère de l’agriculture et de la pêche).</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "MarquageCE"</p>

##### Classe "SupportIUD"

Le support IUD (transcription AIDC et marquage en clair de l'IUD) est apposé sur l'étiquette ou sur le dispositif proprement dit et sur tous
les niveaux de conditionnement supérieurs du dispositif. Les conteneurs de transport ne font pas partie des niveaux de conditionnement
supérieurs.

L’article 27 partie 3 du Règlement (UE) 2017/745 du 5 avril 2017 définit le système d'identification unique des dispositifs (IUD).

Ce système permet l'identification et facilite la traçabilité des dispositifs autres que les dispositifs sur mesure et les dispositifs
faisant l'objet d'une investigation.

La production d'un IUD comprenant:

\*\* un identifiant «dispositif» IUD (IUD-ID), propre à un fabricant et à un dispositif ;

\*\* un identifiant «production» IUD (IUD-IP), qui identifie l'unité de production du dispositif et, le cas échéant, les dispositifs conditionnés.

<table>
<colgroup>
<col style="width: 27%" />
<col style="width: 72%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">IUD-ID : [0..1] Identifiant</td>
<td style="text-align: left;">L'IUD-ID est un code numérique ou alphanumérique unique propre à un modèle de dispositif qui sert également de clé d'accès aux informations stockées dans une base de données IUD.</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPNumSerie : [0..1] Identifiant</td>
<td style="text-align: left;">Numéro de série du DM.<br />
Au sein d'un lot de fabrication, un DM peut être affecté d'un numéro de série unique permettant une meilleure traçabilité.</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPNumLot : [0..1] Identifiant</td>
<td style="text-align: left;">Numéro du lot auquel appartient le DM.<br />
Après l'entrée en application du Règlement (UE) 2017/745, le numéro de lot du DM constitue un type d’IUD-IP. L’affectation d’un numéro de lot
ou d’un numéro de série est obligatoire pour les DMI marqués CE au titre du règlement.</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPIdLogiciel : [0..1] Identifiant</td>
<td style="text-align: left;">Identifiant du logiciel.<br />
L'IUD est attribué au niveau du système du logiciel. Seuls les logiciels qui sont disponibles en soi dans le commerce et ceux qui constituent un
dispositif à part entière sont soumis à cette exigence.<br />
L'identification du logiciel est considérée comme un mécanisme de contrôle de la fabrication et est indiquée dans l'IUD-IP</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPDateFabrication : [0..1] Date</td>
<td style="text-align: left;">Après l'entrée en application du Règlement (UE) 2017/745, la date de fabrication constitue un type d’IUD-IP.</td>
</tr>
<tr>
<td style="text-align: left;">IUD-IPDateExpiration : [0..1] Date</td>
<td style="text-align: left;">Après l'entrée en application du Règlement (UE) 2017/745, la date d’expiration constitue un type d’IUD-IP.</td>
</tr>
<tr>
<td style="text-align: left;">identifiantIUD_HRF : [0..1] Texte</td>
<td style="text-align: left;">Transcription HRF ("Human-Readable Format") de l'identifiant complet IUD du dispositif médical, tel qu’il apparaît en clair sur le dispositif ou son conditionnement.<br />
<br />
Si les identifiants « dispositif » (IUD-ID) et « production » (IUD-IP) sont symbolisés dans des codes-barres différents, concaténer les chaînes
de caractères en commençant par l’IUD-ID.</td>
</tr>
<tr>
<td style="text-align: left;">identifiantIUD_AIDC : [0..1] ObjetBinaire</td>
<td style="text-align: left;">Transcription AIDC (partie encodée lisible par les techniques d'identification et de capture automatique des
données) de l'identifiant complet IUD du dispositif médical.<br />
<br />
Si les identifiants « dispositif » (IUD-ID) et « production » (IUD-IP) sont symbolisés dans des codes-barres différents, concaténer les chaînes
de caractères en commençant par l’IUD-ID.</td>
</tr>
<tr>
<td style="text-align: left;">identifiantIUD_Source : [0..1] Code</td>
<td style="text-align: left;">Une entrée codée indiquant comment l'IUD a été saisie: code à barre, RFID, manuellement, à partir de la carte
d'implant d'un patient ...<br />
Le code renvoie à une terminologie définissant les différents types (cf. Value set HL7 FHIR Value Set http://hl7.org/fhir/ValueSet/udi-entry-type).</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "SupportIUD"</p>

##### Classe "DimensionsDM"

Cette classe correspond aux dimensions cliniques du dispositif médical.

| Nom | Description |
|:---|:---|
| volume : \[0..1\] Mesure | Volume du dispositif. |
| longueur : \[0..1\] Mesure | Longueur du dispositif. |
| calibre : \[0..1\] Mesure | Calibre du dispositif. |
| diametre : \[0..1\] Mesure | Diamètre du dispositif. |
| poids : \[0..1\] Mesure | Poids du dispositif. |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;"> Attributs de la classe "DimensionsDM"</p>

##### Classe "EntiteJuridique"

<table>
<colgroup>
<col style="width: 36%" />
<col style="width: 63%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">idNat_Struct : [1..1] Identifiant</td>
<td style="text-align: left;">Identification nationale de l'Entité juridique initiée pour les besoins du SI-CPS.<br />
Cette identification est obtenue par la concaténation du type d'identifiant national de structure (provenant de la nomenclature TRE_G07-TypeIdentifiantStructure) et de l'identifiant de la structure:<br />
** 1 + N° FINESS (entité juridique et entité géographique indéterminées);<br />
** 2 + N° Siren.</td>
</tr>
<tr>
<td style="text-align: left;">numSiren : [1..1] Identifiant</td>
<td style="text-align: left;">Le numéro Siren est le numéro unique d'identification attribué à chaque entreprise ou organisme par l'INSEE.</td>
</tr>
<tr>
<td style="text-align: left;">numFINESS : [0..1] Identifiant</td>
<td style="text-align: left;">Identifiant FINESS de l'entité juridique attribué lors de sa création.<br />
Les personnes morales identifiées par des numéros FINESS sont également dotées de numéros Siren. Le numéro FINESS étant porteur intrinsèquement
de liens avec le domaine sanitaire ou le domaine médico-social.</td>
</tr>
<tr>
<td style="text-align: left;">numeroTVAIntracommunautaire : [0..1] Identifiant</td>
<td style="text-align: left;">Le numéro de TVA intracommunautaire est un numéro d'identification individuel. Il est délivré par l'administration
fiscale du pays de domiciliation de l'entreprise concernée au moment de son immatriculation ou de sa déclaration d'activité.</td>
</tr>
<tr>
<td style="text-align: left;">numeroSRN : [0..*] Identifiant</td>
<td style="text-align: left;">Numéro d'enregistrement unique (Single Registration Number - SRN) de l’acteur EUDAMED.<br />
Un acteur est un opérateur économique dont le rôle vis-à-vis du dispositif médical est enregistré dans la base de données EUDAMED :<br />
**MF : Fabricant<br />
**AR : Mandataire<br />
**IM : Importateur<br />
**PR : Assembleur<br />
Ce numéro est construit sur la base du numéro de tva intracommunautaire.<br />
<br />
Il est à noter que l’obligation de s’enregistrer dans EUDAMED ne concerne pas les distributeurs, qui par conséquent n’auront pas de SRN.</td>
</tr>
<tr>
<td style="text-align: left;">raisonSociale : [1..1] Texte</td>
<td style="text-align: left;">La raison sociale est le nom de l'entité juridique.<br />
Il s’agit par exemple de la dénomination usuelle du fabricant ou du distributeur du dispositif médical.</td>
</tr>
<tr>
<td style="text-align: left;">raisonSocialeLongue : [0..1] Texte</td>
<td style="text-align: left;">Raison sociale complète de l'entité juridique (acronymes, sigles ou abréviations développées).</td>
</tr>
<tr>
<td style="text-align: left;">adresseEJ : [0..1] <a
href="#classe-adresse">Adresse</a></td>
<td style="text-align: left;">Adresse géopostale de l'entité juridique.</td>
</tr>
<tr>
<td style="text-align: left;">telecommunication : [0..*] <a href="#classe-telecommunication">Telecommunication</a></td>
<td style="text-align: left;">Adresse(s) de télécommunication de l'entité juridique (numéro de téléphone, adresse email, URL, etc.).</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "EntiteJuridique"</p>

##### Classe "EntiteGeographique"

<table>
<colgroup>
<col style="width: 30%" />
<col style="width: 69%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">idNat_Struct : [1..1] Identifiant</td>
<td style="text-align: left;">Identification nationale de l'Entité Géographique définie dans le CI-SIS.<br />
Cette identification est obtenue par la concaténation du type d'identifiant national de structure (provenant de la nomenclature TRE_G07-TypeIdentifiantStructure) et de l'identifiant de la structure.<br />
Pour une Entité Géographiques, IdNat_Struct peut prendre les valeurs suivantes :<br />
** 0 + Identifiant cabinet ADELI<br />
** 1 + N° FINESS de l'entité géographique<br />
** 3 + N° SIRET<br />
** 4 + Identifiant cabinet RPPS</td>
</tr>
<tr>
<td style="text-align: left;">numFINESS : [1..1] Identifiant</td>
<td style="text-align: left;">Numéro FINESS de l'entité géographique.<br />
Le numéro FINESS étant porteur intrinsèquement de liens avec le domaine sanitaire ou le domaine médico-social, il est, s'il existe, à
privilégier pour l’identification des entités géographiques en tant qu’acteurs sanitaires et médico-sociaux par rapport au numéro SIRET
(Référentiel d’identification des acteurs sanitaires et médico-sociaux - Politique Générale de Sécurité des Systèmes d’Information de Santé
(PGSSI-S)).<br />
A chaque EG (établissement) est attribué un numéro FINESS qui est composé de 9 caractères numériques, tels que :<br />
** Position 1-2 : numéro du département d'implantation ("2A", "2B" pour la Corse; "97" pour les départements d’Outre-mer; "98" pour Mayotte);<br />
** Position 3 : "0";<br />
** Position 4-8: "1" pour Guadeloupe, "2" pour Martinique, "3" pour Guyane, "4" pour Réunion, "5" pour Saint-Pierre-et-Miquelon + numéro
d'ordre de 4 chiffres;<br />
** Position 4-8 : numéro d’ordre de 5 chiffres pour tous les autres départements;<br />
** Position 9 : clé de Luhn calculée automatiquement.</td>
</tr>
<tr>
<td style="text-align: left;">numSiret : [0..1] Identifiant</td>
<td style="text-align: left;">Le numéro Siret est le numéro unique d'identification, attribué par l'INSEE, à chaque entité géographique.</td>
</tr>
<tr>
<td style="text-align: left;">denominationEG : [0..1] Texte</td>
<td style="text-align: left;">Nom sous lequel l'entité géographique exerce son activité.<br />
Dans le cas d'un établissement enregistré dans le FINESS, cet attribut correspond à la notion de "raison sociale d'un établissement" renseignée
dans le FINESS.</td>
</tr>
<tr>
<td style="text-align: left;">denominationEGLongue : [0..1] Texte</td>
<td style="text-align: left;">Nom, sous sa forme la plus longue et complète, sous lequel l'entité géographique exerce son activité
(acronymes, sigles ou abréviations développés).</td>
</tr>
<tr>
<td style="text-align: left;">adresseEG : [0..1] <a
href="#classe-adresse">Adresse</a></td>
<td style="text-align: left;">Adresse(s) géopostale(s) de l'entité géographique en fonction de l'usage (adresse administrative, adresse
entrée des véhicules, adresse entrée piétonne, etc.).<br />
L'implantation géographique peut également être décrite au travers de la classe Lieu.</td>
</tr>
<tr>
<td style="text-align: left;">implantationGeographique : [0..1]
Lieu</td>
<td style="text-align: left;">Implantation géographique de l’EG sur un lieu connu.</td>
</tr>
<tr>
<td style="text-align: left;">telecommunication : [0..1] <a
href="#classe-telecommunication">Telecommunication</a></td>
<td style="text-align: left;">Adresse(s) de télécommunication de l'entité géographique (numéro de téléphone, adresse email, URL, etc.).</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "EntiteGeographique"</p>

##### Classe "Fabricant"

\*\* Classe spécialisée, hérite de le classe EntiteJuridique

Cette classe regroupe les items pouvant caractériser le fabricant du dispositif médical.

| Nom | Description |
|:---|:---|
| identifiantLocalFabricant : \[0..\*\] Identifiant | Identifiants affectés au fabricant dans les référentiels locaux (autres que ceux de la Commission Européenne). |

<p style="text-align: center;"> Attributs de la classe "Fabricant"</p>

##### Classe "Distributeur"

\*\* Classe spécialisée, hérite de le classe EntiteJuridique

Cette classe regroupe les items pouvant caractériser le distributeur du dispositif médical.

| Nom | Description |
|:---|:---|
| identifiantLocalDistributeur : \[0..\*\] Identifiant | Identifiants affectés au distributeur dans les référentiels locaux (autres que ceux de la Commission Européenne). |

<p style="text-align: center;"> Attributs de la classe "Distributeur"</p>

##### Classe "Lieu"

Informations relatives à une portion déterminée de l'espace, fixe ou mobile du point de vue de son affectation ou de ce qui s'y passe.

Cas particulier de l'entité géographique : plusieurs lieux peuvent être associés à une même EG, ils peuvent décrire, à la fois, son adresse et
des lieux spécifiques à l'EG.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 66%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">identifiant : [0..*] Identifiant</td>
<td style="text-align: left;">Identifiant(s) métier du lieu.</td>
</tr>
<tr>
<td style="text-align: left;">nom : [0..1] Texte</td>
<td style="text-align: left;">Nom, exprimé sous la forme de texte, du lieu.</td>
</tr>
<tr>
<td style="text-align: left;">description : [0..1] Texte</td>
<td style="text-align: left;">Description textuelle du lieu, indiquant comment l'atteindre.</td>
</tr>
<tr>
<td style="text-align: left;">typeLieu : [0..1] Code</td>
<td style="text-align: left;">Information catégorisant physiquement le lieu, par exemple un bâtiment, un véhicule, une chambre, une route, etc.</td>
</tr>
<tr>
<td style="text-align: left;">fonctionLieu : [0..1] Code</td>
<td style="text-align: left;">Fonction à laquelle le lieu est dédié. Par exemple, le lieu d'implantation d'une entité géographique ou la salle de
prélèvements dans un service.</td>
</tr>
<tr>
<td style="text-align: left;">statut : [0..1] <a href="http://mos.asipsante.fr/NOS/PDF/TRE_R203-StatutLieu.tabs.pdf">Code
&lt;&lt;TRE_R203-StatutLieu&gt;&gt;</a></td>
<td style="text-align: left;">Le statut indique si le lieu est opérationnel, fermé temporairement ou fermé définitivement.<br />
Quelques exemples de codes :<br />
** FD : Fermé définitivement;<br />
** FT : Fermé temporairement;<br />
** OP : Opérationnel.<br />
Les valeurs de ce code sont répertoriées dans la nomenclature TRE_R203-StatutLieu.</td>
</tr>
<tr>
<td style="text-align: left;">accessibiliteLieu : [0..1] <a href="http://mos.asipsante.fr/NOS/PDF/TRE_R202-AccessibiliteLieu.tabs.pdf">Code
&lt;&lt;TRE_R202-AccessibiliteLieu&gt;&gt;</a></td>
<td style="text-align: left;">Information précisant dans quelle mesure le lieu est conforme aux dispositions règlementaires relatives à
l’accessibilité des établissements recevant du public (ex : accessible, non accessible, sur demande, non communiqué, etc.).<br />
Rappel sur l'obligation d'accessibilité des établissements recevant du public (ERP) aux personnes handicapées (service-public.fr):<br />
Les établissements ouverts au public (magasin, bureau, hôtel, etc.) doivent être accessibles aux personnes handicapées. Les établissements
recevant du public (ERP) non conformes aux règles d'accessibilité sont tenus de s'inscrire à un Agenda d'Accessibilité Programmée (Ad'AP) qui
permet d'engager les travaux nécessaires dans un délai limité.<br />
Règles d'accessibilité:<br />
Les normes d'accessibilité doivent permettre aux personnes handicapées de circuler avec la plus grande autonomie possible, d'accéder aux locaux
et équipements, d'utiliser les équipements et les prestations, de se repérer et de communiquer.<br />
L'accès concerne tout type de handicap (moteur, visuel, auditif, mental...).<br />
Les conditions d'accès doivent être les mêmes que pour les personnes valides ou, à défaut, présenter une qualité d'usage équivalente.<br />
L'accessibilité de ces établissements et de leurs abords concerne :<br />
** les cheminements extérieurs,<br />
** le stationnement des véhicules,<br />
** les conditions d'accès et d'accueil dans les bâtiments,<br />
** les circulations horizontales et verticales à l'intérieur des bâtiments,<br />
** les locaux intérieurs et les sanitaires ouverts au public,<br />
** les portes, les sas intérieurs et les sorties,<br />
** les revêtements des sols et des parois,<br />
** les équipements et mobiliers intérieurs et extérieurs susceptibles d'y être installés (dispositifs d'éclairage et d'information des
usagers, par exemple).<br />
Les valeurs de ce code sont répertoriées dans la nomenclature TRE_R202-AccessibiliteLieu.</td>
</tr>
<tr>
<td style="text-align: left;">communeCOG : [0..1] <a href="http://mos.asipsante.fr/NOS/PDF/TRE_R13-CommuneOM.tabs.pdf">Code &lt;&lt;TRE_R13-CommuneOM&gt;&gt;</a></td>
<td style="text-align: left;">Code officiel géographique (COG) de la commune dans laquelle le lieu est situé.</td>
</tr>
<tr>
<td style="text-align: left;">adresse : [0..1] <a href="#classe-adresse">Adresse</a></td>
<td style="text-align: left;">Adresse géopostale du lieu.</td>
</tr>
<tr>
<td style="text-align: left;">coordonneeGeographique : [0..1] CoordonneeGeographique</td>
<td style="text-align: left;">Coordonnées géographiques du lieu.</td>
</tr>
<tr>
<td style="text-align: left;">telecommunication : [0..*] <a href="#classe-telecommunication">Telecommunication</a></td>
<td style="text-align: left;">Adresse(s) de télécommunication du lieu (numéro de téléphone, adresse email, URL, etc.).</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [0..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "Lieu"</p>

##### Classe "Metadonnee"

Cette classe contient les attributs inhérents et communs à toutes les classes des flux.

Elle permet aux applications consommatrices des flux d'identifier les créations, les modifications et les suppressions d’objets.

| Nom | Description |
|:---|:---|
| identifiant : \[0..1\] Identifiant | Identifiant technique qui permet à un consommateur de réconcilier les données dans un contexte spécifique d'échange de données. |
| dateCreation : \[1..1\] DateHeure | Date de création de l'objet. |
| dateMiseJour : \[1..1\] DateHeure | Date de mise à jour de la dernière donnée mise à jour de l'objet. |
| commentaire : \[0..1\] Texte | Commentaire qui peut être associé à chaque objet. |

<p style="text-align: center;"> Attributs de la classe "Metadonnee"</p>

##### Classe "OrganisationInterne"

La PUI, le service utilisateur sont modélisés par la classe OrganisationInterne (OI) (voir MOS) qui est une classe abstraite contenant les attributs inhérents et communs aux classes décrivant des structures organisationnelles (ou organisations internes), portant des
activités sur un lieu au sein d'une entité géographique.

Une organisation interne (OI) peut être composée d’autres organisations internes. Par exemple, un pôle peut être composé de structures internes
(ou services), une structure interne peut être composée d'unités fonctionnelles, une unité fonctionnelle peut être composée d'unités élémentaires.

<table>
<colgroup>
<col style="width: 38%" />
<col style="width: 61%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">identifiantOI : [1..1] Identifiant</td>
<td style="text-align: left;">Identifiant de l'organisation interne, unique et persistant au niveau national.</td>
</tr>
<tr>
<td style="text-align: left;">nom : [0..1] Texte</td>
<td style="text-align: left;">Nom de l'organisation interne.</td>
</tr>
<tr>
<td style="text-align: left;">typeOI : [1..1] <a href="http://mos.asipsante.fr/NOS/PDF/TRE_R207-TypeOrganisationInterne.tabs.pdf">Code
&lt;&lt;TRE_R207-TypeOrganisationInterne&gt;&gt;</a></td>
<td style="text-align: left;">Type d'organisation interne (pôle, structure interne ou service, unité fonctionnelle, unité élémentaire, etc.).</td>
</tr>
<tr>
<td style="text-align: left;">categorieOrganisation : [0..1] <a href="http://mos.asipsante.fr/NOS/PDF/TRE_R244-CategorieOrganisation.tabs.pdf">Code
&lt;&lt;TRE_R244-CategorieOrganisation&gt;&gt;</a></td>
<td style="text-align: left;">La catégorie d'organisation caractérise la nature particulière d’une organisation liée à un agrément, un personnel
spécialement formé, un environnement particulièrement adapté à l'état de santé des patients, etc.<br />
Les valeurs de ce code sont répertoriées dans la nomenclature TRE_R244-CategorieOrganisation.</td>
</tr>
<tr>
<td style="text-align: left;">lieu : [0..*] Lieu</td>
<td style="text-align: left;">Lieu(x) rattaché(s) à l'organisation interne.</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;"> Attributs de la classe "OrganisationInterne"</p>

##### Classe "Patient"

Personne physique bénéficiaire de soins, d'examens ou d'actes de prévention.

| Nom | Description |
|:---|:---|
| identite : \[1..1\] INS | Identifiant national de santé INS accompagné des traits d'identité de l'état civil et des traits complémentaires provenant du Référentiel National d'Identitovigilance (RNIV). |
| identifiantLocal : \[0..1\] Identifiant | Identifiant du patient dans les référentiels locaux. |
| personne : \[1..1\] [PersonnePhysique](#classe-personnephysique) | Identité civile du patient. |
| adresseCorrespondance : \[0..\*\] [Adresse](#classe-adresse) | Adresse(s) de correspondance de la personne prise en charge. |
| telecommunication : \[1..\*\] [Telecommunication](#classe-telecommunication) | Adresse(s) de télécommunication de la personne prise en charge (numéro de téléphone, adresse email, URL, etc.). |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;">Attributs de la classe "Patient"</p>

##### Classe "INS"

La classe INS est reprise de la classe INS du MOS (voir https://mos.esante.gouv.fr)

##### Classe "PersonnePhysique"

| Nom | Description |
|:---|:---|
| nomFamille : \[0..1\] Texte | Toute personne possède un nom de famille (appelé auparavant nom patronymique). Ce nom figure sur l'acte de naissance. Il peut s'agir par exemple du nom du père. Réf. : Service-public.fr Synonymes : nom patronymique, nom de naissance |
| prenom : \[0..1\] Texte | Prénom(s) de la personne déclarés à sa naissance. |
| sexe : \[0..1\] Code | Sexe de la personne physique. |
| dateNaissance : \[0..1\] Date | Date de naissance de la personne. |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;">Attributs de la classe "PersonnePhysique"</p>

##### Classe "Professionnel"

Données d'identification pérennes d’une personne physique, qui travaille en tant que professionnel (professionnel enregistré dans RPPS ou ADELI),
personnel autorisé ou personnel d’établissement, dans les domaines sanitaire, médico-social et social.

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 70%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Nom</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">idNat_PS : [1..1] Identifiant</td>
<td style="text-align: left;">Identification nationale principale du professionnel initiée pour les besoins du SI-CPS.<br />
Cette identification est obtenue par la concaténation du type d'identifiant national de personne (provenant de la nomenclature TRE_G08-TypeIdentifiantPersonne) et de l'identifiant de la personne physique provenant, selon le type d’identifiant, soit d’un référentiel
national, soit d’un référentiel local propre à la structure d’exercice de la personne physique:<br />
** 0 + N° ADELI du professionnel<br />
Ex : 0123456789 : identification nationale d’un professionnel identifié par un n° ADELI = 123456789;<br />
** 1 + Identifiant cabinet ADELI/identifiant interne du professionnel employé au sein d’un cabinet<br />
Ex : 112345678901/00001 : identification nationale d’un employé dans un cabinet libéral:<br />
- le titulaire du cabinet est un professionnel identifié par un n° ADELI = 123456789<br />
- le cabinet est identifié par un ADELI-rang = 12345678901 (01 = n° de rang du cabinet du même professionnel sur 2 caractères)<br />
- l’identifiant interne de l’employé dans la structure = 00001;<br />
** 3 + N° FINESS/identifiant interne du professionnel employé au sein d’une structure FINESS;<br />
** 4 + N° Siren/identifiant interne du professionnel employé au sein d’une structure Siren (NB: pas d'utilisation identifiée de cette
construction);<br />
** 5 + N° Siret/identifiant interne du professionnel employé au sein d’une structure Siret;<br />
** 6 + Identifiant cabinet RPPS/ identifiant interne du professionnel employé au sein d’un cabinet<br />
- le cabinet est identifié par un RPPS-rang à 14 caractères (numéro RPPS du professionnel + rang sur 2 caractères + clé de Luhn);<br />
** 8 + N° RPPS du professionnel ou de l’étudiant;<br />
Ex : 810005678901 : identification nationale d’un professionnel ou d’un étudiant identifié par un n° RPPS = 10005678901<br />
Le numéro RPPS est un identifiant pérenne, constitué de 11 caractères non significatifs (numéro d’ordre sur 10 caractères + clé de Luhn sur 1
caractère);</td>
</tr>
<tr>
<td style="text-align: left;">idPP : [1..1] Identifiant</td>
<td style="text-align: left;">Identifiant national de la personne physique:<br />
** Pour les professionnels de santé: Numéro RPPS ou ADELI.<br />
** Pour les étudiants: Numéro RPPS depuis 2017.<br />
Remarque, le numéro SIRIUS ou le numéro Etudiant (identifiant ordinal dont les règles de génération sont propres à chaque ordre) peuvent
subsister dans certaines cartes et systèmes pendant la période transitoire de généralisation du numéro RPPS.<br />
** Pour les acteurs non professionnels de santé employés d’une structure : l’identifiant est composé de l’identifiant principal de la structure
et de l’identifiant interne attribué par la structure.</td>
</tr>
<tr>
<td style="text-align: left;">personne : [0..1] <a href="#classe-personnephysique">PersonnePhysique</a></td>
<td style="text-align: left;">Identité civile du professionnel.</td>
</tr>
<tr>
<td style="text-align: left;">adresseCorrespondance : [0..*] <a href="#classe-adresse">Adresse</a></td>
<td style="text-align: left;">Adresse(s) de correspondance permettant de contacter les professionnels:<br />
** lorsque les structures ne sont pas identifiées : cas des remplaçants ou des professionnels venant de s’inscrire mais non encore installés;<br />
** hors de leurs lieux d’exercice, s’ils le souhaitent.<br />
Remarque système RPPS : La première occurrence correspond aux coordonnées de correspondance du RPPS.</td>
</tr>
<tr>
<td style="text-align: left;">telecommunication : [1..*] <a href="#classe-telecommunication">Telecommunication</a></td>
<td style="text-align: left;">Adresse(s) de télécommunication du professionnel (numéro de téléphone, adresse email, URL, etc.).</td>
</tr>
<tr>
<td style="text-align: left;">metadonnee : [1..1] Metadonnee</td>
<td style="text-align: left;">Informations relatives à la gestion des classes et des données.</td>
</tr>
</tbody>
</table>

<p style="text-align: center;">Attributs de la classe "Professionnel"</p>

##### Classe "Telecommunication"

Adresse de télécommunication à laquelle une personne ou une organisation peut être contactée (téléphone, fax, e-mail, URL, etc.).

| Nom | Description |
|:---|:---|
| canal : \[1..1\] [Code \<\<TRE_R200-CanalCommunication\>\>](http://mos.asipsante.fr/NOS/PDF/TRE_R200-CanalCommunication.tabs.pdf) | Code spécifiant le canal ou la manière dont s'établit la communication (téléphone, e-mail, URL, etc.). |
| adresseTelecom : \[1..1\] Texte | Valeur de l'adresse de télécommunication dans le format induit par le canal de communication, par exemple un numéro de téléphone, une adresse de courrier électronique, une adresse URL, etc. |
| utilisation : \[0..1\] Texte | Précise l'utilisation du canal de communication (par exemple à des fins professionnelles, privées, etc.). |
| metadonnee : \[1..1\] Metadonnee | Informations relatives à la gestion des classes et des données. |

<p style="text-align: center;">Attributs de la classe "Telecommunication"</p>
