# Slingshot - Selling tix made easy

## v0.0

* User accounts / authentication 
* Ability to drag and drop file and confirm you want to upload
* Store uploads on AWS
* Generates short link
* Integrate with Stripe so that if the link is clicked, it triggers a Stripe transaction
* If there is a successful transaction, have the link destroy (or at least show "SOLD")


Models:
User has_many tickets
Tickets has_many attachments

Ticket
  id
  title
  user_id
  price
  description

Attachment
  id
  ticket_id
  pages


Stripe integration:
https://stripe.com/docs/checkout/guides/rails

Short link generator:
https://github.com/philnash/bitly

Styling:
http://www.blacktie.co/