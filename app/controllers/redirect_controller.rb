class RedirectController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    link = find_url

    raise ActionController::RoutingError, "Not Found" if link.blank?

    ahoy.track "Open slug", link_id: link[:id]

    redirect_to link[:url]
  end

  private

  def find_url
    Rails.cache.read("slug-#{slug}")
  end

  def slug
    params[:path]
  end
end
