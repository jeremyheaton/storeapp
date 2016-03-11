class UserNotifier < ActionMailer::Base
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_message(customer,item)
    @item = item
    mail(:from => "Admin@shielded-headland-62801.herokuapp.com",
    :to => customer,
    :subject => 'Order Confirmation',
    :body => "Confirming you bought a #{@item.product} for #{@item.price} dollars" )
  end
end
