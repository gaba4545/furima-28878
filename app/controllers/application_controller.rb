class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:surname_zenkaku,:name_zenkaku,:surname_katakana,:name_katakana,:birthday])
  end
end
