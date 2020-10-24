class AddColumnToBooksTable < ActiveRecord::Migration[5.2]
  def change
    add_column :books,:title,:string
    add_column :books,:major,:string
    add_column :books,:price,:integer
    add_column :books,:condition,:string
    add_column :books,:complete,:boolean,default: false,null: false
  end
end
