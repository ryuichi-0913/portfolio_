class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :user_id
      t.string :food_image_id
      t.string :food_name
      t.text :food_introduction

      t.timestamps
    end
  end
end
