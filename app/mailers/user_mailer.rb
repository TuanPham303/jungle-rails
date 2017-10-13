class UserMailer < ApplicationMailer
  default from: 'noreply@jungle.com'

  def order_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Thanks for ordering')
  end
end
