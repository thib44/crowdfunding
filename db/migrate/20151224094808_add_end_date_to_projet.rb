class AddEndDateToProjet < ActiveRecord::Migration
  def change
    add_column :projets, :end_date, :datetime
  end
end
