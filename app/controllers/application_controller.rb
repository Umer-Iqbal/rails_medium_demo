class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :password_confirmation, :description, :avatar])
  end

  # before_filter :configure_sanitized_params, if: :devise_controller?
  #
  # def configure_sanitized_params
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :username, :password, :password_confirmation, :avatar) }
  #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :username, :password, :password_confirmation, :avatar) }
  # end

end
