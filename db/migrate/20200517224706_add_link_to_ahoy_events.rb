class AddLinkToAhoyEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :ahoy_events, :link, foreign_key: true
  end
end
