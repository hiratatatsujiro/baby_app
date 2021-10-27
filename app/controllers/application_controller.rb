class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameter, if: :devise_controller?

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name, :prefectures_id, :city, :house_number])
  end
end
