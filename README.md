Use Case:

2 kafka topics:

- op_events: UUID - (type, timestamp, store, till, metadata)
  - open/close till
  - log in/out, 
  - open cash drawer
- txn_events: UUID - (type, timestamp, store, till, txn ID, metadata)
  - add/remove product to/from basket
  - apply discount
  - pay by cash/card
  - complete txn

Fraud detection by pattern matching
 - OK: pay by cash -> complete txn -> open cash drawer OR pay by cash -> open cash drawer -> complete txn
 - NOT OK: open drawer but no transaction