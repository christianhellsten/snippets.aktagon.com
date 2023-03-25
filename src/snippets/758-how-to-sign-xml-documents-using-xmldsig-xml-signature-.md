---
id: '758'
title: How to sign XML documents using XMLDSig (XML Signature)
languages:
- bash
- xml
tags:
- coffeescript
- safari
- web-inspector
---
## Install xmlsec1

```bash
sudo apt-get install xmlsec1
```

## Create document

```xml
<?xml version="1.0" encoding="UTF-8"?>
<document>
  <hello>All XML is doomed to fail.</hello>
  <!-- Signature contains the signature definition -->
  <Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
    <SignedInfo>
      <CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
      <SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
      <Reference>
        <Transforms>
          <Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
          <Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
        </Transforms>
        <DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
        <DigestValue />
      </Reference>
      </SignedInfo>
    <SignatureValue />
    <KeyInfo>
      <X509Data />
    </KeyInfo>
  </Signature>
</document>
```
    

## Sign document


```bash
xmlsec1 --sign --privkey-pem xxx.com.key,xxx.com.cer --output signed.xml tosign.xml
```
    

This example uses [test certificates issued by VRK](https://eevertti.vrk.fi/Default.aspx?id=369).

## Verify document


```bash
xmlsec1 --verify --trusted-pem vrkthsp.pem --trusted-pem vrktestc.pem signed.xml
```
    

Note that a concatenated PEM file, i.e. cat vrkthsp.pem vrktestc.pem > concat.pem, does not work with xmlsec1.

## How to specify which elements to sign with ds:Reference

Add one or more ds:Reference elements to specify which elements should be signed. Each element should have a unique ID in the URI attribute. The ID should be prefixed with a hash, e.g., *\#your-id*:


```xml
<ds:Reference URI="#secret-xml-sauce">
```
    

Make sure your document contains an element having the exact ID without the hash prefix:


```xml
<Dog ID="secret-xml-sauce" name="Christian" />
```
    

Next, use the "--id-attr" switch to specify the element and attribute name:


```bash
xmlsec1 --sign --privkey-pem signing.key,signing.pem --id-attr:ID Dog --id-attr:ID structuredBody --output signed.xml tosign.xml
```
    

Note that "id" is the default attribute name. You only need --id-attr switch if you have the ID in an attribute having a different name.

How to sign multiple elements
-----------------------------

Just add another "--id-attr:<attr_name> <element_name>" switch:


```bash
xmlsec1 --sign --privkey-pem signing.key,signing.pem --id-attr:ID signatureTimestamp --id-attr:ID structuredBody --output signed.xml tosign.xml
```
    

Then add another element having the given ID.

Troubleshooting
---------------

- This error means you don't have the correct [trusted pem]()


```bash
certificate issuer check failed:err=2;msg=unable to get issuer certificate;issuer=/C=FI/ST=Finland/O=Vaestorekisterikeskus TEST/OU=Certification Authority Services/OU=Varmennepalvelut/CN=VRK TEST Root CA
```
    

To fix the error, take a hard look at the Issuer and Subject of all certificates in the certificate chain. For example:


```bash
openssl x509 -inform DER -in vrktestc.crt -text | grep "Issuer\|Subject"
```
    

- xmlsec1 fails to find element containing ID


```bash
func=xmlSecXPathDataExecute:file=xpath.c:line=273:obj=unknown:subj=xmlXPtrEval:error=5:libxml2 library function failed:expr=xpointer(id('ID_OF_ELEMENT_TO_SIGN'))
```
    

Note that the XPATH queries are case sensitive. This means you might have to specify both the name of the element and the name of the ID attribute like this:


```bash
xmlsec1 sign --id-attr:ID elementThatYouWantToSign ...
```
    

For more solutions to issues, see sgros.blogspot.com: [http://sgros.blogspot.com/2013/01/signing-xml-document-using-xmlsec1.html](http://sgros.blogspot.fi/2013/01/signing-xml-document-using-xmlsec1.html)

