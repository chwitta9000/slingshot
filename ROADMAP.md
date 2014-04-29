# Slingshot - Selling tix made easy

## v0.0

* User accounts / authentication (DONE)
* Ability to drag and drop file and confirm you want to upload
* Store uploads on AWS (DONE)
* Can-can (DONE)
* Have tickets belong to user (DONE)

* Generates short link
* Integrate with Stripe so that if the link is clicked, it triggers a Stripe transaction
* If there is a successful transaction, have the link destroy (or at least show "SOLD")



Uploader:
http://blueimp.github.io/jQuery-File-Upload/index.html
https://github.com/blueimp/jQuery-File-Upload/wiki
SEE THIS => http://railscasts.com/episodes/381-jquery-file-upload

Stripe integration:
https://www.bloc.io/resources/stripe-integration
https://stripe.com/docs/checkout/guides/rails

-> User buys ticket and stripes money to your account

-> Chron job, to periodically pay sellers
https://github.com/javan/whenever
http://railscasts.com/episodes/164-cron-in-ruby


-> Give tickets sold and paid booleans to indicate their status
Short link generator:
https://github.com/philnash/bitly

Styling:
http://www.blacktie.co/

Facebook & Google signin