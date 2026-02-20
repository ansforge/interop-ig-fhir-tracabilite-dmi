# Informations connexes - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Autres Ressources**](autres_ressources.md)
* **Informations connexes**

## Informations connexes

### Modèle de fichier FICHCOMP DMI

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

Modèle de fichier FICHCOMP 

Ce fichier a connu un nombre d’évolutions à partir de 2016 et notamment une nouvelle définition des variables :

* **N° FINESS :** Numéro identifiant de l’établissement
* **Type de prestation :** 02 « Dispositifs médicaux implantables »
* **Année période :** AAAA (Année de traitement du fichier)
* **N° période (mois) :** 01 à 12. Correspond à la période du 1er janvier à la fin du mois considéré. La saisie est cumulative.
* **N° d'index du RSA :** lié au RSA du même séjour par un numéro d’index
* **Code LPP :** La L.P.P est la liste des produits et prestations remboursables par l’assurance maladie. Ces derniers sont identifiés par code de référence LPP est à 7 caractères numériques. Le 1er et 2nd caractères de code de référence LPP correspond respectivement au titre et chapitre de la nomenclature. Les 4 caractères suivants sont aléatoires. Le 7ème caractère correspond à la clé (modulo 11).
* **Nombre posé :** 10+0
* **Prix d'achat multiplié par le nombre posé :** 7+3 (Partie entière sur 7 caractères numériques et partie décimale sur 3)
* **Mois de la date de pose :** 01 à 12 (sachant que « 01 » correspond au mois de janvier de l’année considérée et « 12 » au mois de décembre)
* **Année de la date de pose :** AAAA

### Modèle de fichier RSF

Le format RSF de l’ATIH est accessible ici : [https://www.atih.sante.fr/nouveau-format-du-rsf](https://www.atih.sante.fr/nouveau-format-du-rsf)

