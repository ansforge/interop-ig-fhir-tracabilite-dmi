### Flux 23 - RechercheTraces

Ce flux est utilisé par le consommateur pour faire une recherche de traces auprès du gestionnaire de traçabilité.

Ce flux est construit selon les exigences de la transaction [IHE ITI-81](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) « Retrieve ATNA Audit Event » qui se base sur [l’interaction « search »](https://www.hl7.org/fhir/R4/http.html#search) de l’API REST de FHIR. Il s’agit d’une requête HTTP GET adressant la ressource auditEvent.

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

### Flux 24 - ReponseRechercheTraces

Ce flux véhicule le résultat de la recherche de traces.

Dans le contexte d’un échange basé sur le standard HL7 FHIR, ce flux est basé sur les ressources FHIR Bundle, AuditEvent et OperationOutcome (en cas d’erreur) telles qu’utilisées dans la transaction IHE ITI-81 « Retrieve ATNA Audit Event ».

Conformément au supplément RESTful ATNA du profil IHE ATNA, la réponse retournée par le Gestionnaire de trace au Consommateur de traces est composée d’un Bundle de ressources AuditEvent.

La ressource Bundle de type search set constituera alors le corps de la réponse HTTP 200 ok.

Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR.
