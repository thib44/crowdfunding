class ContributionsController < Users::ApplicationController
  before_action :find_projet
  def new
    @contribution = @projet.contributions.build
  end

  def create
    @contribution = @projet.contributions.build(contribution_params)
    @contribution.user = current_user
    if @contribution.save
      redirect_to projet_path(@projet)
    else
      render :new
    end
  end


  private
  def contribution_params
    params.require(:contribution).permit(:amount)
  end
  def find_projet
    @projet = Projet.find(params[:projet_id])
  end
end
