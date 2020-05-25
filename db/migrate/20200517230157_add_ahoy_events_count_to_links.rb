class AddAhoyEventsCountToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :ahoy_events_count, :integer
  end
end
