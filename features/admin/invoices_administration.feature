@invoices @$_admin
Feature: Invoices administration

Scenario: I can create new invoice for user

Scenario: I can see list of invoices pending creation

Scenario: I can create new invoice from suggestion on invoices pending creation listing

Scenario: I can see invoice details

Scenario: I can edit invoice’s customer information - name, address, vat no

Scenario: I can edit invoice’s seller information - name, address, vat no

Scenario: Invoice created has its number automatically generated

Scenario: I can edit following additional information-  need example of norwegian invoice with comments

Scenario: I can add custom invoice line to invoice

Scenario: I can remove invoice line from invoice

Scenario: I can edit invoice line within invoice

Scenario: Invoice line’s netto/brutto fields are automatically updated on edit

Scenario: I can mark an invoice as paid by filling in amount and date fields

Scenario: I can list all invoices an see following columns -  number, customer, total, payment status

Scenario: I can sort invoices listing by following columns -  number, customer, total

Scenario: I can filter invoices list by following parameters - creation range, payment status, customer   

Scenario: I can download invoice as PDF file

Scenario: I can send invoice to given email address (as an attachment)

Scenario: I can print out invoice (bypassing PDF)

Scenario: I can credit an invoice ...