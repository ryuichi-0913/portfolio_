class CreateNonfoodComments < ActiveRecord::Migration[5.2]
  def change
    create_table :nonfood_comments do |t|
      t.integer :user_id
      t.integer :nonfood_id
      t.text :nonfood_comment

      t.timestamps
    end
  end
end
