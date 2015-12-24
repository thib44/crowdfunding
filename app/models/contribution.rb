class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :projet
  # if time_to_end(projet) != "Time over"
    validates :amount, :user, :projet, presence: true
    validates :amount, numericality: { greater_than: 0 }
  # end
end
