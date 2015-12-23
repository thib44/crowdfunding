class AddPictureToProjet < ActiveRecord::Migration
  def change
    add_column :projets, :picture, :string
  end
end
