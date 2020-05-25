class Link < ApplicationRecord
  attribute :is_duplicated_url, :boolean

  belongs_to :user
  has_many :ahoy_events, class_name: "Ahoy::Event", dependent: :destroy

  validates :user, presence: true
  validates :url, presence: true
  validates :url, url: {no_local: true}
  validates :slug, uniqueness: true
  validates :slug, slug: true

  after_validation :clear_slug_error, if: -> { is_duplicated_url }
  after_save :cache_slug
  after_destroy :clean_slug


  def generate_slug
    return if errors.count > 0

    self.slug = GenerateSlug.call

    if slug.blank?
      errors.add(:slug, "unique generation failed. Please try submitting again.")
    end
  end

  def cache_slug
    return unless saved_change_to_slug?

    before, after = saved_changes["slug"]

    Rails.cache.delete("slug-#{before}")
    Rails.cache.write("slug-#{after}", {id: id, url: url})
  end

  def clean_slug
    Rails.cache.delete("slug-#{slug}")
  end
end
