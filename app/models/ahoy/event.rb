class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :link, counter_cache: "ahoy_events_count"
  belongs_to :visit
  belongs_to :user, optional: true
end
