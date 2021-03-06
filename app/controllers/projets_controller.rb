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
      flash[:notice] = "Project #{@projet.nom} has been created with success"
    else
      render :new
      flash[:alert] = "Sorry something went wrong and we can't create your project"
    end
  end

  def show
    @contributions = @projet.contributions
  end



  private
  def projet_params
    params.require(:projet).permit(:objectif, :nom, :description, :picture, :end_date)
  end

  def find_projet
    @projet = Projet.find(params[:id])
  end
end
