class AddInstitutionNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :institution_name, :string
  end
end
