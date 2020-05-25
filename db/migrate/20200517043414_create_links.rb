class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :url, null: false
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
