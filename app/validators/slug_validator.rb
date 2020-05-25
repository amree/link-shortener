class SlugValidator < ActiveModel::Validator
  SLUG_PATTERN = /^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$/

  def validate(record)
    return if record.slug.blank?

    unless record.slug.match? SLUG_PATTERN
      record.errors[:slug] << "is not in valid format"
    end

    if existing_application_path.include? record.slug
      record.errors[:slug] << "has already been taken"
    end
  end

  def existing_application_path
    Rails.application.routes.routes.map { |route|
      route.path.spec.to_s.split("/")&.second
    }.compact.uniq
  end
end
