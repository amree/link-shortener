class Ahoy::Store < Ahoy::DatabaseStore
  def track_event(data)
    set_link(data)

    super(data)
  end

  private

  def set_link(data)
    slug = request.url.split("/").last
    link = Link.find_by(slug: slug)

    return if link.nil?

    data[:link_id] = link.id
  end
end

# set to true for JavaScript tracking
Ahoy.api = false
Ahoy.job_queue = :low
