class ModifyUsersForSorcery < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :password, :string  
    add_column :users, :crypted_password, :string  
    add_column :users, :salt, :string  
  end
end
