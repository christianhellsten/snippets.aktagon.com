---
id: '833'
title: How to parse OBX segments from an ORU-01 HL7 message using Java and HAPI
languages:
- java
- xml
tags:
---
Tested with HAPI 2.3:

```java
import ca.uhn.hl7v2.model.v23.message.ORU_R01;
import ca.uhn.hl7v2.model.v23.group.*;
import ca.uhn.hl7v2.model.v23.segment.OBX;
import ca.uhn.hl7v2.model.v23.segment.OBR;
import ca.uhn.hl7v2.model.Varies;
import org.junit.BeforeClass;
import ca.uhn.hl7v2.HL7Exception;
import ca.uhn.hl7v2.model.Message;
import ca.uhn.hl7v2.parser.PipeParser;
import ca.uhn.hl7v2.util.Terser;

/*
 * An HL7 message has the following components:
 *
 * MSH - Message Header Segment
 * RESPONSE (repeating)
 *   PATIENT
 *     PID - Patient Identification Segment
 *     PV1 – Patient Visit Segment
 *   ORDER OBSERVATION (repeating)
 *     OBR - Observation Request Segment
 *       ORC - Common Order Segment
 *       OBR - Observation Request Segment
 *       OBX – Observation Segment (repeating)
 *
 */

PipeParser pipeParser = new PipeParser();
pipeParser.setValidationContext(new ca.uhn.hl7v2.validation.impl.NoValidation());
Message message = pipeParser.parse(m);
ORU_R01 oru = (ORU_R01) message;
MSH msh = oru.getMSH();
String sendingApp = msh.getSendingApplication().encode();
String sendingFacility = msh.getSendingFacility().encode();
//
// ORU_R01_RESPONSE group structure (a Group object)
//
// 1: ORU_R01_PATIENT (a Group object) optional
// 2: ORU_R01_ORDER_OBSERVATION (a Group object) repeating
//
// See https://hapifhir.github.io/hapi-hl7v2/v23/apidocs/src-html/ca/uhn/hl7v2/model/v23/group/ORU_R01_RESPONSE.html
//
for (ORU_R01_RESPONSE response : oru.getRESPONSEAll()) {
  //
  // ORU_R01_ORDER_OBSERVATION group structure (a Group object)
  //
  // 1: ORC (Common order segment) optional
  // 2: OBR (Observation request segment)
  // 3: NTE (Notes and comments segment) optional repeating
  // 4: ORU_R01_OBSERVATION (a Group object) repeating
  // 5: CTI (Clinical Trial Identification) optional repeating
  //
  // See https://hapifhir.github.io/hapi-hl7v2/v23/apidocs/src-html/ca/uhn/hl7v2/model/v23/group/ORU_R01_ORDER_OBSERVATION.html
  //
  for (ORU_R01_ORDER_OBSERVATION orderObservation : response.getORDER_OBSERVATIONAll()) {
    OBR obr = orderObservation.getOBR();
    String fillerOrderNumber = obr.getObr3_FillerOrderNumber().encode();
    //
    // ORU_R01_OBSERVATION group structure (a Group object)
    //
    // 1: OBX (Observation segment) optional
    // 2: NTE (Notes and comments segment) optional repeating
    //
    // See https://hapifhir.github.io/hapi-hl7v2/v23/apidocs/src-html/ca/uhn/hl7v2/model/v23/group/ORU_R01_OBSERVATION.html
    //
    for (ORU_R01_OBSERVATION observation : orderObservation.getOBSERVATIONAll()) {
      //
      // HL7 OBX message segment (Observation segment)
      //
      // https://hapifhir.github.io/hapi-hl7v2/v23/apidocs/src-html/ca/uhn/hl7v2/model/v23/segment/OBX.html
      //
      OBX obx = observation.getOBX();
      String type = obx.getObx3_ObservationIdentifier().getCe2_Text().getValue();
      String status = obx.getObservResultStatus().getValue();
      for (Varies varies : obx.getObx5_ObservationValue()) {
        String value = varies.encode();
        log.info("value {} type {} status {}", value, type, status);
      }
    }
  }
}
```


```xml
    <dependency>
      <groupId>ca.uhn.hapi</groupId>
      <artifactId>hapi-base</artifactId>
      <version>${hapi.version.stable}</version>
    </dependency>
    <dependency>
      <groupId>ca.uhn.hapi</groupId>
      <artifactId>hapi-structures-v23</artifactId>
      <version>${hapi.version.stable}</version>
    </dependency>
```

Use the HAPI test panel to inspect and find the names of elements, e.g. PID-3-4:
https://hapifhir.github.io/hapi-hl7v2/hapi-testpanel/install.html
