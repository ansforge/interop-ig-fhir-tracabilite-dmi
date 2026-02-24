Profile: DMIInvoice
Parent: Invoice
Id: dmi-invoice
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains DMIFacture named Facture 0..1
* identifier 1..
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains
    refFacture 1..1 and
    refCommande 1..1
* identifier[refFacture].type 1..
* identifier[refFacture].type = DMIDiscriminator#refFacture
* identifier[refFacture].value 1..
* identifier[refCommande].type 1..
* identifier[refCommande].type = DMIDiscriminator#refCommande 
* identifier[refCommande].value 1..