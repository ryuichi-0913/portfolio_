class CreateNonfoods < ActiveRecord::Migration[5.2]
  def change
    create_table :nonfoods do |t|
      t.integer :user_id
      t.string :nonfood_image_id
      t.string :nonfood_name
      t.text :nonfood_introduction

      t.timestamps
    end
  end
end
