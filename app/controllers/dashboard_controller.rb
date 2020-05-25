class DashboardController < ApplicationController
  def index
    @links = current_user.links.order("created_at desc")
  end
end
