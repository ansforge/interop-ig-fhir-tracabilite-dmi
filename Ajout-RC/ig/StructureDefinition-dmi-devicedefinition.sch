<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile DeviceDefinition
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:DeviceDefinition</sch:title>
    <sch:rule context="f:DeviceDefinition">
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-classe-risque']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-classe-risque': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-code-emdn']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-code-emdn': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-distributeur']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-reference-distributeur': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:DeviceDefinition/f:physicalCharacteristics</sch:title>
    <sch:rule context="f:DeviceDefinition/f:physicalCharacteristics">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-internal-diameter']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/tdmi/StructureDefinition/dmi-internal-diameter': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:height) &lt;= 1">height: maximum cardinality of 'height' is 1</sch:assert>
      <sch:assert test="count(f:width) &lt;= 1">width: maximum cardinality of 'width' is 1</sch:assert>
      <sch:assert test="count(f:depth) &lt;= 1">depth: maximum cardinality of 'depth' is 1</sch:assert>
      <sch:assert test="count(f:weight) &lt;= 1">weight: maximum cardinality of 'weight' is 1</sch:assert>
      <sch:assert test="count(f:nominalVolume) &lt;= 1">nominalVolume: maximum cardinality of 'nominalVolume' is 1</sch:assert>
      <sch:assert test="count(f:externalDiameter) &lt;= 1">externalDiameter: maximum cardinality of 'externalDiameter' is 1</sch:assert>
      <sch:assert test="count(f:shape) &lt;= 1">shape: maximum cardinality of 'shape' is 1</sch:assert>
      <sch:assert test="count(f:scoring) &lt;= 1">scoring: maximum cardinality of 'scoring' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
