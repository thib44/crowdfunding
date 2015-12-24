class Projet < ActiveRecord::Base
  belongs_to :user
  validates :objectif, :nom, :description, :user, :picture, :end_date,  presence: true
  has_many :contributions, dependent: :destroy
  validates :objectif, numericality: { greater_than: 0 }
  validate :end_date_cannot_be_in_the_past

  mount_uploader :picture, PictureUploader

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  def business(projet)
    wallet = 0
    projet.contributions.each do |c|
      wallet += c.amount
    end
    wallet
  end

  def percent(projet)
    wallet = business(projet)
    target = projet.objectif
    if wallet > 0
      percent = (wallet / target.to_f)*100
    else
      percent = 0
    end

    "#{percent.round(2)}"
  end

  def done(projet)
    wallet = business(projet)
    target = projet.objectif

    wallet >= target
  end

  def time_to_end(projet)
    now = Date.today
    finish = projet.end_date.to_date
    rest = finish.mjd - now.mjd
    if rest >= 0
      "J-#{rest}"
    else
      "Time over"
    end
  end

end
