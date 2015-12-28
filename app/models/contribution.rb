class Contribution < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :projet, required: true

  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  # validate :cannot_be_after_end_of_project

  def cannot_be_after_end_of_project
    if projet.end_date < Date.today
      errors.add(:amount, "Sorry the project is finish")
    end
  end
end
