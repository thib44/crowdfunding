class Projet < ActiveRecord::Base
  belongs_to :user
  validates :objectif, :nom, :description, :user, :picture, :end_date,  presence: true
  has_many :contributions, dependent: :destroy
  validates :objectif, numericality: { greater_than: 0 }
  validate :end_date_cannot_be_in_the_past

  mount_uploader :picture, PictureUploader


  def end_date_cannot_be_in_the_past
    unless contributable?
      errors.add(:end_date, "can't be in the past")
    end
  end

  def contributable?
    end_date > Date.today rescue false
  end

  def amount_contributed
    contributions.sum :amount
  end

  def percent
    wallet = amount_contributed
    target = objectif
    if wallet > 0
      percent = (wallet / target.to_f)*100
    else
      percent = 0
    end

    "#{percent.round(2)}"
  end

  def to_param
    "#{id.to_s}-#{nom.parameterize}"
  end

  def done
    wallet = amount_contributed
    target = objectif

    wallet >= target
  end

  def days_left
   [0, (end_date - Date.today).to_i].max
  end
end
