# mailgun-webhook
POC for mailgun webhook and other APIs 

# Runing tests

To test following interfaces 

- Send emails with a subject, text and campaign id to any email address
- Detect if an email address is listed in a suppressions (do not contact) list
- Get the list of previously sent emails to an email address

run `MAILGUN_API_KEY=<key> MAILGUN_DOMAIN=<domain> rake` 


# View Tracking History

Please start the server and visit http://localhost:3000/events to view open and click events