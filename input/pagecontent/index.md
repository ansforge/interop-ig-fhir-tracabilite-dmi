<p style="padding: 5px; border-radius: 5px; border: 2px solid maroon; background: #ffffe6; width: 65%">
<b>Brief description of this Implementation Guide</b><br>
This Implementation Guide defines the functional and technical framework for implementing traceability of Implantable Medical Devices (IMDs) within French healthcare institutions, in compliance with the CI SIS interoperability framework. It specifies how traceability events related to the IMD lifecycle including ordering, reception, stock management, implantation, and invoicing are created, transmitted, searched, and consulted using HL7 FHIR R4 resources and profiles, based on the generic Event Traceability framework (IHE ATNA / RESTful ATNA).
</p>

{% if site.data.info.releaselabel == 'ci-build' %}
<div style="width: 65%">
    <blockquote class="stu-note">
    <p>Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue soumise à des changements fréquents uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : http://interop.esante.gouv.fr/ig/fhir/[code - ig]</p>
    </blockquote>
</div>
{% endif %}


{% if site.data.info.releaselabel == 'public-comment' %}
<div style="width: 65%">
<blockquote class="stu-note">
<p>
  <b>Attention !</b>
  <br>
 Cet Implementation Guide est actuellement en concertation. La version courante est accessible à l'adresse : http://interop.esante.gouv.fr/ig/fhir/[code - ig]
</p>
</blockquote>
</div>
{% endif %}


<div class="figure">
    <img src="ci-sis-logo.png" alt="CI-SIS" title="Logo du CI-SIS" style="width:100%;">
</div>

### Introduction

Ce guide d’implémentation (IG) décrit les mécanismes d’interopérabilité permettant d’assurer la traçabilité des dispositifs médicaux implantables (DMI) au sein d’un établissement de santé.

La traçabilité couvre l’ensemble du cycle de vie du DMI dans l’établissement, depuis sa réception jusqu’à sa pose chez le patient, ainsi que les évènements associés à sa gestion logistique, sanitaire et financière.

Elle vise à répondre aux exigences réglementaires nationales et européennes relatives à la traçabilité des dispositifs médicaux implantables, notamment en matière de matériovigilance et d’enregistrement de l’Identifiant Unique du Dispositif (IUD).

Sur le plan technique, cet IG s’inscrit dans le cadre du Cadre d’Interopérabilité des Systèmes d’Information de Santé (CI-SIS) et constitue une instanciation du volet générique « Traçabilité d’évènements ».  
Il repose sur le profil IHE ATNA et son supplément RESTful ATNA, ainsi que sur l’utilisation de la ressource HL7 FHIR R4 AuditEvent et des ressources métier associées.

Ce guide formalise les règles nécessaires à :

- la création et la transmission des traces d’évènements liés aux DMI,
- la recherche de traces selon des critères métier,
- la consultation détaillée d’une trace.

### Périmètre du projet

Cet IG définit le périmètre fonctionnel et technique de la mise en œuvre de la traçabilité des dispositifs médicaux implantables dans le cadre du CI-SIS.

Il couvre les évènements de traçabilité relatifs aux principales étapes du circuit du DMI en établissement de santé, notamment :

- la demande et la commande,
- la réception et le contrôle,
- l’entrée et la sortie de stock,
- la délivrance au service utilisateur,
- le transport interne,
- la réception par le service utilisateur,
- la pose chez le patient,
- le refus ou l’échec de pose,
- le réassort,
- la facturation.

L’IG spécifie :

- les acteurs impliqués (source de traçabilité, gestionnaire de traçabilité, consommateur),
- les flux d’échange associés,
- les ressources FHIR profilées utilisées,
- les règles d’interopérabilité applicables.

Ne sont pas couverts par cet IG :

- l’organisation interne des processus métiers au sein des établissements,
- les modalités de gestion locale des stocks,
- les aspects fonctionnels du dossier patient hors données strictement nécessaires à la traçabilité.

Le périmètre se limite aux mécanismes d’échange interopérables nécessaires à la gestion des traces, conformément au cadre CI-SIS.

### Standards utilisés

Les données véhiculées dans ce volet ainsi que les interactions entre les systèmes reposent sur le standard HL7 FHIR Release 4.

Les interactions font référence à un certain nombre de ressources du standard ainsi qu’aux spécifications de l’API REST FHIR, basées sur le protocole HTTP dans sa version sécurisée HTTPS. Les syntaxes retenues sont la syntaxe XML et JSON.

#### Ressources FHIR profilées

Les ressources profilées dans le cadre de ce guide d'implémentation sont les suivantes : 

{% sql { 
  "query" : " 
    SELECT json_extract(Json, '$.baseDefinition') as Parent, Name, Description, Web 
    FROM Resources 
    WHERE Type = 'StructureDefinition' 
      AND Id LIKE 'TDE%' 
      AND json_extract(Json, '$.kind') = 'resource' 
    ORDER BY Name 
  ", 
  "class" : "lines", 
  "columns" : [ 
    { "title" : "Profil parent", "source" : "Parent" }, 
    { "title" : "Profil", "type" : "link", "source" : "Name", "target" : "Web" }, 
    { "title" : "Description", "type" : "markdown", "source" : "Description" } 
  ] 
} %}

### Dépendances

{% include dependency-table.xhtml %}

### Propriété intellectuelle

{% include ip-statements.xhtml %}
