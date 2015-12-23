class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.references :user, index: true
      t.references :projet, index: true
      t.integer :amount
      t.timestamps null: false
    end
  end
end
