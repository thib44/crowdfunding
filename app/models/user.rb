class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook, :linkedin]

  has_many :projets, dependent: :destroy
  has_many :contributions, dependent: :destroy


  def self.find_for_facebook_oauth(auth)
    user = omniauth_strategie(auth)
    user.token_expiry = Time.at(auth.credentials.expires_at)
    user
  end

  def self.find_for_linkedin_oauth(auth)
    omniauth_strategie(auth)
    # user.token_expiry = Time.at(auth.credentials.expires_at)
  end

  def create_mp_user
    MangoPay::NaturalUser.create user_params
  end

  private

  def self.omniauth_strategie(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
    end
  end



  def user_params
    {
      Email: self.email,
      FirstName: self.first_name,
      LastName: self.last_name,
      Address: 'Here',
      Birthday: Date.parse('01-01-2000').to_time.to_i,
      CountryOfResidence: 'FR',
      Nationality: 'Fr',
    }
  end

end
