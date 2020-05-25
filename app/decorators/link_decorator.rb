module LinkDecorator
  def current_title
    title.blank? ? url : title
  end

  def slug_with_url
    "#{current_host}#{slug}"
  end

  private

  def current_host
    scheme = request.scheme
    host = request.host
    port = [80, 443].include?(request.port) ? "" : ":#{request.port}"

    "#{scheme}://#{host}#{port}/"
  end
end
