class ApplicationController < ActionController::Base

  #サインイン後の遷移先を指定する方法
  def after_sign_in_path_for(resource)
    userpage_path
  end

end
