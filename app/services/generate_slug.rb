class GenerateSlug
  SLUG_LENGTH = 5
  MAX_ATTEMPT = 10

  def self.call
    new.call
  end

  def call
    process
    slug
  end

  private

  attr_reader :slug

  def process
    attempt = 0

    while attempt < MAX_ATTEMPT
      attempt += 1

      generate_random_slug
      break if slug_unique?

      reset_slug
    end
  end

  def generate_random_slug
    @slug = SecureRandom.alphanumeric(SLUG_LENGTH).downcase
  end

  def slug_unique?
    !Link.exists?(slug: slug)
  end

  def reset_slug
    @slug = nil
  end
end
