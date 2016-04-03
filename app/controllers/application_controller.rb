class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  %w(Student Teacher).each do |user_type|
    define_method "current_#{user_type.underscore}" do
        current_account if current_account.is_a?(user_type.constantize)
    end

    define_method "authenticate_#{user_type.underscore}!" do
      |opts={}| send("current_#{user_type.underscore}") || not_authorized
    end
  end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :avatar]
    end

end
