class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    password = SecureRandom.hex(10)
    params.require(:user).permit(:name, :email, :password, :password_confirmation).merge(locale: I18n.locale, password: password, password_confirmation: password)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
