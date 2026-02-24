# Flux 23 - Flux 24 - Traçabilité des Dispositifs Médicaux Implantables v3.0.0

* [**Table of Contents**](toc.md)
* [**Volume 2 - Détail des transactions**](specifications_techniques_introduction.md)
* **Flux 23 - Flux 24**

## Flux 23 - Flux 24

### Flux 23 - RechercheTraces

Ce flux est utilisé par le consommateur pour faire une recherche de traces auprès du gestionnaire de traçabilité.

Ce flux est construit selon les exigences de la transaction [IHE ITI-81](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) « Retrieve ATNA Audit Event » qui se base sur [l’interaction « search »](https://www.hl7.org/fhir/http.html#search) de l’API REST de FHIR. Il s’agit d’une requête HTTP GET adressant la ressource auditEvent.

La transaction [ITI-81] Retrieve ATNA Audit Event exige que la recherche de traces soit bornée dans le temps. C’est-à-dire que le paramètre de recherche « date » qui correspond à la date d’enregistrement de l’évènement est présent pour préciser une limite de temps (avant, après ou un intervalle).

La recherche est transmise de la façon suivante :

|
|

### Flux 24 - ReponseRechercheTraces

Ce flux véhicule le résultat de la recherche de traces.

Dans le contexte d’un échange basé sur le standard HL7 FHIR, ce flux est basé sur les ressources FHIR Bundle, AuditEvent et OperationOutcome (en cas d’erreur) telles qu’utilisées dans la transaction IHE ITI-81 « Retrieve ATNA Audit Event ».

Conformément au supplément RESTful ATNA du profil IHE ATNA, la réponse retournée par le Gestionnaire de trace au Consommateur de traces est composée d’un Bundle de ressources AuditEvent.

La ressource Bundle de type search set constituera alors le corps de la réponse HTTP 200 ok.

Pour des informations sur les autres codes HTTP (HTTP status code) retournés en cas d’échec, consultez la documentation relative à l’interaction « read » de l’API REST FHIR.

