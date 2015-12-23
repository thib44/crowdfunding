class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :projet
  validates :amount, :user, :projet, presence: true
end
