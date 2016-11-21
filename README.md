# mailgun-webhook
POC for mailgun webhook and other APIs 

# Runing tests

To test following interfaces 

- Send emails with a subject, text and campaign id to any email address
- Detect if an email address is listed in a suppressions (do not contact) list
- Get the list of previously sent emails to an email address

run `MAILGUN_API_KEY=<key> MAILGUN_DOMAIN=<domain> rake` on console from application home directory


# View Tracking History

#### Setup Mailgun Account
1. Setup mailgun account and verify your email address.
2. Copy the API keys and sandbox domain, which is to be used for this integration
3. Create a Rails application, create two separate controllers - Webhook event handling and Event listing
4. Download ngrok - This is needed to make the local URL s public so that mailgun can directly push the events. When we start ngrok using `ngrok http 3000`, it will give a dynamic URL.
5. Setup webhooks for “Open” and “Click” events in Mailgun account, Use the ngrok generated URLs. 
6. Opened event - This event needs an HTML email content, with image inside. Then only it would be able to track the event and ultimately webhook event will be fired to our Rails app.
7. Clicked event - Similar to above, This event requires a HTML email with link, when this link is clicked then the event will be tracked and fired.
8. We have only captured “Opened”/”Clicked” events in our controller, and stored in in the database table.
9. Created another controller to list out the stored events.


Please start the server and visit http://localhost:3000/events to view open and click events

