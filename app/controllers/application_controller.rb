class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
  if resource_name == :user
    user_path(current_user)
  else
  certs_path
end
end


end