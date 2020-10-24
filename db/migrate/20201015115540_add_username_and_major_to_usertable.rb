class AddUsernameAndMajorToUsertable < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:username,:string
    add_column :users,:major,:string
  end
end
