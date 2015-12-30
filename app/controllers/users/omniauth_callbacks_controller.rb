class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])
    strategie(user, "Facebook")
  end

  def linkedin
    user = User.find_for_linkedin_oauth(request.env['omniauth.auth'])
    strategie(user, "Linkedin")
  end


  private

  def strategie(user, kind)
    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
    else
      session["devise.#{kind.downcase}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
