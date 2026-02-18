Profile: DMIInvoice
Parent: Invoice
Id: dmi-invoice
* meta 1..
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains DMIFacture named Facture 0..1
* extension[Facture] ^isModifier = false
* identifier 1..
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.text"
* identifier ^slicing.rules = #open
* identifier contains
    refFacture 1..1 and
    refCommande 1..1
* identifier[refFacture].type.text 1..
* identifier[refFacture].type.text = "refFacture" (exactly)
* identifier[refFacture].value 1..
* identifier[refCommande].type.coding 1..1
* identifier[refCommande].type.text = "refCommande" (exactly)
* identifier[refCommande].value 1..