ActiveAdmin.register User do

  index do
    selectable_column
    column :id
    column :email
    column :admin
    column :created_at
    actions
  end


end
