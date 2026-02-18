
Ce flux est utilisé par le consommateur pour faire une recherche de traces auprès du gestionnaire de traçabilité.

Ce flux est construit selon les exigences de la transaction IHE ITI-81[^9] « Retrieve ATNA Audit Event » qui se base sur l’interaction « search »[^10] de l’API REST de FHIR. Il s’agit d’une requête HTTP GET adressant la ressource auditEvent.

La transaction \[ITI-81\] Retrieve ATNA Audit Event exige que la recherche de traces soit bornée dans le temps. C’est-à-dire que le paramètre de recherche « date » qui correspond à la date d’enregistrement de l’évènement est présent pour préciser une limite de temps (avant, après ou un intervalle).

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
<p>[start-time] et [stop-time] indique l’intervalle de temps dans lequel les traces sont recherchées (date se réfère à la date d’enregistrement de l’évènement).</p>
<p>&lt;query&gt; représente les autres paramètres, sous la forme param=valeur, permettant d’affiner la recherche (Cf <a
href="#_Flux_23_-">Tableau 13</a>).</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
