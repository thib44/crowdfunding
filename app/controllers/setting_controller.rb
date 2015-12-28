class SettingController < ApplicationController
  def change_language
    I18n.locale = params[:language]

    if projets_url == request.referer
      redirect_to new_projet_path
    else
      redirect_to :back
    end
  end
end
