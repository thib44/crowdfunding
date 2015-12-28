class UsersController < Users::ApplicationController
  def index
    @projets = Projet.all.page params[:page]
  end
end
