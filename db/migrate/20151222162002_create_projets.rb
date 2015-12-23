class CreateProjets < ActiveRecord::Migration
  def change
    create_table :projets do |t|

      t.timestamps null: false
      t.integer :objectif
      t.string :nom
      t.string :description
      t.references :user, index: true
    end
  end
end
