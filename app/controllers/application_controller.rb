class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :user_name, :address, :phone_number, :email, :password,
        :password_confirmation, :avatar
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit :user_name, :address, :phone_number, :email, :password, 
        :password_confirmation, :current_password, :avatar
    end
  end

  def after_sign_in_path_for resource
    case current_user.role.to_sym
    when :admin, :mod
      admin_shop_types_path
    when :shop_owner, :staff
      shop_owner_shops_path
    else
      root_path
    end
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = t "no_loggin_error"
      redirect_to new_user_session_path
    end
  end

  def check_shop_owner_permission
    unless current_user.shop_owner? || current_user.staff?
      flash[:danger] = t "no_permission_error"
      redirect_to root_url
    end
  end

  def check_admin_permission
    unless current_user.admin? || current_user.mod?
      flash[:danger] = t "no_permission_error"
      redirect_to root_url
    end
  end
end
