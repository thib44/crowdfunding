class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :projet
  validates :amount, :user, :projet, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
