class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :cc_last_name, :cc_first_name, :kk_last_name, :kk_first_name, :birthday])
  end
end
