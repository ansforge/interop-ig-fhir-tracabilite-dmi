### Modèle de fichier FICHCOMP DMI

Ci-dessous, un modèle de fichier FICHCOMP DMI au format 2009 à 2016 :

<table>
<colgroup>
<col style="width: 45%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr>
<th colspan="5">DMI (extension de fichier .dmip)</th>
</tr>
</thead>
<tbody>
<tr>
<td>VARIABLES</td>
<td><strong>Taille</strong></td>
<td><strong>Début</strong></td>
<td><strong>Fin</strong></td>
<td><strong>Remarques</strong></td>
</tr>
<tr>
<td>N° FINESS</td>
<td style="text-align: center;">9</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">9</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td>Type de prestation</td>
<td style="text-align: center;">2</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">11</td>
<td style="text-align: center;">02</td>
</tr>
<tr>
<td>Année période</td>
<td style="text-align: center;">4</td>
<td style="text-align: center;">12</td>
<td style="text-align: center;">15</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td>N° période (mois)</td>
<td style="text-align: center;">2</td>
<td style="text-align: center;">16</td>
<td style="text-align: center;">17</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td>N° d'index du RSA</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">18</td>
<td style="text-align: center;">27</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td>Code LPP</td>
<td style="text-align: center;">9</td>
<td style="text-align: center;">28</td>
<td style="text-align: center;">36</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td>Nombre posé</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">37</td>
<td style="text-align: center;">46</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td>Prix d'achat multiplié par le nombre posé</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">47</td>
<td style="text-align: center;">56</td>
<td style="text-align: center;">7+3</td>
</tr>
<tr>
<td>Mois de la date de pose (si renseignée)</td>
<td style="text-align: center;">2</td>
<td style="text-align: center;">57</td>
<td style="text-align: center;">58</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td>Année de la date de pose</td>
<td style="text-align: center;">4</td>
<td style="text-align: center;">59</td>
<td style="text-align: center;">62</td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>

<p style="text-align: center;">Modèle de fichier FICHCOMP </p>

Ce fichier a connu un nombre d’évolutions à partir de 2016 et notamment
une nouvelle définition des variables :

- **N° FINESS :** Numéro identifiant de l’établissement 
- **Type de prestation :** 02 « Dispositifs médicaux implantables »
- **Année période :** AAAA (Année de traitement du fichier)
- **N° période (mois) :** 01 à 12. Correspond à la période du 1<sup>er</sup> janvier à la fin du
mois considéré. La saisie est cumulative.
- **N° d'index du RSA :** lié au RSA du même séjour par un numéro d’index
- **Code LPP :** La L.P.P est la liste des produits et prestations remboursables par l’assurance maladie. Ces derniers sont identifiés par code de référence LPP est à 7 caractères numériques. Le 1<sup>er</sup> et 2<sup>nd</sup> caractères de code de référence LPP correspond respectivement au titre et chapitre de la nomenclature. Les 4 caractères suivants sont aléatoires. Le
7<sup>ème</sup> caractère correspond à la clé (modulo 11).
- **Nombre posé :** 10+0
- **Prix d'achat multiplié par le nombre posé :** 7+3 (Partie entière sur 7 caractères numériques et partie décimale sur 3)
- **Mois de la date de pose :** 01 à 12 (sachant que « 01 » correspond au mois de janvier de l’année considérée et « 12 » au mois de décembre)
- **Année de la date de pose :** AAAA


### Modèle de fichier RSF

Le format RSF de l’ATIH est accessible ici :
<https://www.atih.sante.fr/nouveau-format-du-rsf>
