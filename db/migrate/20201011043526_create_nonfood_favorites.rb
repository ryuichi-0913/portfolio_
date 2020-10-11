class CreateNonfoodFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :nonfood_favorites do |t|
      t.integer :user_id
      t.integer :nonfood_id

      t.timestamps
    end
  end
end
