# Flux 26 - ReponseConsulterTrace - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Volume 2 - Détail des transactions**](specifications_techniques_introduction.md)
* **Flux 26 - ReponseConsulterTrace**

## Flux 26 - ReponseConsulterTrace

Le Flux 26 « ReponseConsulterTrace » correspond à la réponse du Gestionnaire de traçabilité à la demande du Consommateur de consulter une trace dont il connaît l’identifiant système (Flux 25).

Le flux se compose d’un code HTTP 200 ok et d’un contenu. Le corps de la réponse HTTP est constituée de la ressource AuditEvent identifiée dans la demande.

Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR.

