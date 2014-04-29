class ChargesController < ApplicationController
  def create

    @amount = 9000
    # params[:amount]
    # p params

    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: @amount,
      description: "BigMoney Membership - #{current_user.display_name}",
      currency: 'usd'
    )

    # flash[:succ= ss] = "Thanks for all the money, #{current_user.display_name}! Feel free to pay me again."
    redirect_to new_charge_path , notice: "Thanks for all the money, #{current_user.display_name}! Feel free to pay me again."

  # Stripe will send back CardErrors, with friendly messages
  # when something goes wrong.
  # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def new
    # Because large hashes in haml are no fun
    @stripe_btn_hash = {
      src: "https://checkout.stripe.com/checkout.js", 
      class: 'stripe-button',
      data: {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "BigMoney Membership - #{current_user.display_name}",
        amount: 9_000 
        # We're like the Snapchat for Wikipedia. But really, 
        # change this amount. Stripe won't charge $9 billion.
      }
    }
  end


end