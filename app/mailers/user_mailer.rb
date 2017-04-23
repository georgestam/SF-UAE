class UserMailer < ApplicationMailer

  def welcome(user)
  @user = user  # Instance variable => available in view

  mail(
    to:       @user.email,
    subject:  "Welcome to Respira #{@user.name.capitalize}!"
  )

  end

end
