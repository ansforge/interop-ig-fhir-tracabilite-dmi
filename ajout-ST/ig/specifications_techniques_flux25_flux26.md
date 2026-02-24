# Flux 25 - Flux 26 - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Volume 2 - Détail des transactions**](specifications_techniques_introduction.md)
* **Flux 25 - Flux 26**

## Flux 25 - Flux 26

### Flux 25 - ConsultationTrace

Le Flux 25 « ConsultationTrace » permet au consommateur de demander la consultation d’une trace dont l’identifiant est connu au gestionnaire de traçabilité.

Ce flux utilise [l’interaction « read »](https://www.hl7.org/fhir/http.html#read) de l’API REST de HL7 FHIR. Il s’agit d’une requête HTTP GET adressant la ressource auditEvent.

La première étape de construction de ce flux consiste à récupérer l’identifiant de la ressource AuditEvent représentant la trace à consulter.

Cet identifiant est utilisé dans la requête GET suivante :

|
|

### Flux 26 - ReponseConsulterTrace

Le Flux 26 « ReponseConsulterTrace » correspond à la réponse ducGestionnaire de traçabilité à la demande du Consommateur de consulter une trace dont il connaît l’identifiant système (Flux 25).

Le flux se compose d’un code HTTP 200 ok et d’un contenu. Le corps de la réponse HTTP est constituée de la ressource AuditEvent identifiée dans la demande.

Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR.

