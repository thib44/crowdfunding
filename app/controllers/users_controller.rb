class UsersController < Users::ApplicationController
  def index
    @projets = Projet.all
  end
end
