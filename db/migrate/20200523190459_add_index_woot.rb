class AddIndexWoot < ActiveRecord::Migration[6.0]
  def change
    add_index :links, [:user_id, :created_at]
  end
end
