class AddMangoPayColmunToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :birthday, :date
    add_column :users, :nationality, :string
    add_column :users, :country_of_residence, :string
    add_column :users, :mango_id, :string
  end
end
