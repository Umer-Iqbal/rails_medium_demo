class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_article

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :password_confirmation, :description, :avatar])
  end

  def search_article
    @q = Article.ransack(params[:q])
    @pagy, @articles = pagy(@q.result, items: 4)
  end

end
