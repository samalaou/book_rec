class CreateRatings < ActiveRecord::Migration[8.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :rating, null: false, limit: 1

      t.timestamps
    end

    add_index :ratings, [ :user_id, :book_id ], unique: true
  end
end
