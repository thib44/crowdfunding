class ProjetsController < Users::ApplicationController
  before_action :find_projet, only: [:show]
  skip_before_action :authenticate_user!, only: :show
  def new
    @projet = current_user.projets.build
  end

  def create
    @projet = current_user.projets.build(projet_params)

    if @projet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @contributions = @projet.contributions
  end



  private
  def projet_params
    params.require(:projet).permit(:objectif, :nom, :description)
  end

  def find_projet
    @projet = Projet.find(params[:id])
  end
end
