class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [ :photo, :photo_cache ])
  end

  def after_sign_in_path_for(resource)
      helpee = resource
      @chat = Chat.create(helpee: current_user)
      chat_path(@chat)
    # if resource.helpee_chats # if the helpee has chats
      # redirect_to chat_path cookies[:chat_id]
      # @user_chat = Chat.find(resource.latest_chat_id)
      # @user_chat.update(helpee: resource)
      #redirect_to chat_path resource.helpee_chats.last # then redirect him to the latest
    # end
    # initial method
    # request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

end
