class UsersController < Users::ApplicationController
  def index
    @projets = Projet.all.page params[:page]
  end

  def edit_profil
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end
end
