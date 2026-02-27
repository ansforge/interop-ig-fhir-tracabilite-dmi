### Flux 25 - ConsultationTrace
Le Flux 25 « ConsultationTrace » permet au consommateur de demander la consultation d’une trace dont l’identifiant est connu au gestionnaire de traçabilité.

Ce flux utilise [l’interaction « read »](https://www.hl7.org/fhir/R4/http.html#read) de l’API REST de HL7 FHIR. Il s’agit d’une requête HTTP GET adressant la ressource auditEvent.

La première étape de construction de ce flux consiste à récupérer l’identifiant de la ressource AuditEvent représentant la trace à consulter.

Cet identifiant est utilisé dans la requête GET suivante :

<table style="width:100%;">
<colgroup>
<col style="width: 99%" />
</colgroup>
<thead>
<tr>
<th><p>GET [base]/AuditEvent/[id]</p>
<p>Où [base] est le point de contact défini par le gestionnaire de trace et [id] l’identifiant système de la ressource AuditEvent à consulter.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

### Flux 26 - ReponseConsulterTrace

Le Flux 26 « ReponseConsulterTrace » correspond à la réponse ducGestionnaire de traçabilité à la demande du Consommateur de consulter une trace dont il connaît l’identifiant système (Flux 25).

Le flux se compose d’un code HTTP 200 ok et d’un contenu. Le corps de la réponse HTTP est constituée de la ressource AuditEvent identifiée dans la demande.

Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR.
