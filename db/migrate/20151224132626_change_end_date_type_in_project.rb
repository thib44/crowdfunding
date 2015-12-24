class ChangeEndDateTypeInProject < ActiveRecord::Migration
  def change
    change_column :projets, :end_date, :date
  end
end
