class CreateFoodFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :food_favorites do |t|
      t.integer :user_id
      t.integer :food_id

      t.timestamps
    end
  end
end
