class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username,:email,:password,:password_confirmation,:permission_level)}
  end

  # Method Authenticate Permission User
  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end
  
  def authenticate_vendor!
    redirect_to root_path unless user_signed_in? && current_user.is_vendor?
  end

  def authenticate_terminal!
    redirect_to root_path unless user_signed_in? && current_user.is_terminal?
  end

  def authenticate_vendor_terminal!
    redirect_to root_path unless user_signed_in? && current_user.is_vendor_terminal?
  end

  # Method Vendor, Terminal Active
  def set_in_vendor_active
    if @in_vendor.is_active
      $in_vendor_active = @in_vendor
    end
  end

  def set_in_terminal_active
    if @in_terminal.is_active
      $in_terminal_active = @in_terminal
    end
  end

end