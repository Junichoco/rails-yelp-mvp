class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :content, null: false
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
