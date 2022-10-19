class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :allow_admin_only, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    work_orders_path
  end

  def allow_admin_only
    if !current_user.admin
      redirect_to root_path, notice: 'Você não tem permissão de acesso.'
      return false
    end
  end
end
