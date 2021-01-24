class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?
  #devise操作の前にconfigure_permitted_parametersが実行される

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
    #サインインした後にマイページに遷移するよう設定
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :email])
    #ユーザー登録の際に、ユーザー名のデータ操作を許可した
  end

end
