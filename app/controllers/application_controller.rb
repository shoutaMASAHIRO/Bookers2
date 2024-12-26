class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  def after_sign_in_path_for(resource)
    flash[:success] = "successfully"
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    flash[:success] = "successfully"
    root_path
  end

  protected

  def configure_permitted_parameters
    #ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end