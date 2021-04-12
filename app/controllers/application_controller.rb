class ApplicationController < ActionController::Base
  #sign_up（新規登録の処理）に対して、nameというキーのパラメーターを新たに許可します。
  before_action :configure_permitted_parameters, if: :devise_controller?

  #また、before_actionを使い各アクションの事前処理として設定します。
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:profile, :occupation, :position])
  end
end