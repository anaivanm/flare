class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [ :photo, :photo_cache ])
  end

  def after_sign_in_path_for(resource)
      if resource.is_helper
        helper = resource
        my_dashboard_path
      else
        helpee = resource
        @chat = Chat.create(helpee: current_user)
        chat_path(@chat)
      end
  end

def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
end
end
