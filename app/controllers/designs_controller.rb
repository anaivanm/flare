class DesignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @transparent = true
  end
end
