class PagesController < ApplicationController
  def home
    @projets = Projet.all.page params[:page]
  end
end
