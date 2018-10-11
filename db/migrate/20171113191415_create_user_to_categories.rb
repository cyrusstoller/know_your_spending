class CreateUserToCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_to_categories do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end

    add_index :user_to_categories, :user_id
    add_index :user_to_categories, :category_id
  end
end
