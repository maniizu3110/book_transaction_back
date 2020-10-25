class AddBoughtUserToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books,:bought_user,:integer
  end
end
