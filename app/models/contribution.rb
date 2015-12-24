class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :projet

  validates :amount, :user, :projet, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :cannot_be_after_end_of_project

  def cannot_be_after_end_of_project
    if projet.end_date < Date.today
      errors.add(:amount, "Sorry the project is finish")
    end
  end
end
