# Flux 25 - ConsulterTrace - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Volume 2 - Détail des transactions**](specifications_techniques_introduction.md)
* **Flux 25 - ConsulterTrace**

## Flux 25 - ConsulterTrace

Le Flux 25 « ConsultationTrace » permet au consommateur de demander la consultation d’une trace dont l’identifiant est connu au gestionnaire de traçabilité.

Ce flux utilise [l’interaction « read »](https://www.hl7.org/fhir/http.html#read) de l’API REST de HL7 FHIR. Il s’agit d’une requête HTTP GET adressant la ressource auditEvent.

La première étape de construction de ce flux consiste à récupérer l’identifiant de la ressource AuditEvent représentant la trace à consulter.

Cet identifiant est utilisé dans la requête GET suivante :

|
|

