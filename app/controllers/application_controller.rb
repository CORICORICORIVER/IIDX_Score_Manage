class ApplicationController < ActionController::Base

  #サインイン後の遷移先を指定する方法
  def after_sign_in_path_for(resource)
    userpage_path(resource)
  end

  #以下はusernameカラムを許可するためのコード
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
