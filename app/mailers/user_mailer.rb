class UserMailer < ApplicationMailer
  default from: "notifications@micro-reddit.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Micro-Reddit")
  end
end
