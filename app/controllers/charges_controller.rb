class ChargesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    Stripe.api_key = @item.store.access_token
    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
    )
    logger.debug @item.inspect
    charge = Stripe::Charge.create({
      :customer    => customer.id,
      :amount      => (@item.price*100),
      :description => 'Rails Stripe customer',
      :currency    => 'usd',
      :application_fee => (@item.price*10)
    },
    {:stripe_account => @item.store.stripeid}
    )
    UserNotifier.send_message(params[:stripeEmail],@item).deliver
    end
end
