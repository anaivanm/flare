class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @transparent = true
    # cookies[:hello]='hi!'
    # if cookies[:hello]
    #   flash[:notice] = cookies[:hello]
    # end
  end
end
