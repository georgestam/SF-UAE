class UserMailer < ApplicationMailer

  def welcome(user)
  @user = user  # Instance variable => available in view
  welcome = t '.welcome_to_starfish'
  mail(
    to:       @user.email,
    subject:  "#{welcome} #{@user.name.capitalize}!"
  )

  end

end
