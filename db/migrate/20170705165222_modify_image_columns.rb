class ModifyImageColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :avatar
    remove_column :images, :avatar
  end
end
