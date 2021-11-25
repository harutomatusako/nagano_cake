
class Public::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :telephone_number])
  end
end