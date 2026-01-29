# Flux 24 - RéponseRechercheTraces - ANS IG Example v0.1.0

* [**Table of Contents**](toc.md)
* [**Volume 2 - Détail des transactions**](specifications_techniques_introduction.md)
* **Flux 24 - RéponseRechercheTraces**

## Flux 24 - RéponseRechercheTraces

Ce flux véhicule le résultat de la recherche de traces.

Dans le contexte d’un échange basé sur le standard HL7 FHIR, ce flux est basé sur les ressources FHIR Bundle, AuditEvent et OperationOutcome (en cas d’erreur) telles qu’utilisées dans la transaction IHE ITI-81 « Retrieve ATNA Audit Event ».

Conformément au supplément RESTful ATNA du profil IHE ATNA, la réponse retournée par le Gestionnaire de trace au Consommateur de traces est composée d’un Bundle de ressources AuditEvent.

La ressource Bundle de type search set constituera alors le corps de la réponse HTTP 200 ok. Un exemple est donné en annexe :

Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR.

