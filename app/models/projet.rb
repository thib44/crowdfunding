class Projet < ActiveRecord::Base
  belongs_to :user
  validates :objectif, :nom, :description, :user, presence: true
  has_many :contributions, dependent: :destroy
end
