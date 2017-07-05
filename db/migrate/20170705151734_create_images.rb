class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.column :title, :string
      t.column :avatar, :string
      t.column :description, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
