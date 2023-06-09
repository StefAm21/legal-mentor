class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name lawyer])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name last_name lawyer])
  end

  def after_sign_in_path_for(resource_or_scope)  # rubocop:disable Lint/UnusedMethodArgument
    "https://www.legalmentor.me"
    if current_user.lawyer
      answers_path
    else
      questions_path
    end
  end
end
