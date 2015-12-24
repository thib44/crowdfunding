class Projet < ActiveRecord::Base
  belongs_to :user
  validates :objectif, :nom, :description, :user, :picture, :end_date,  presence: true
  has_many :contributions, dependent: :destroy
  validates :objectif, numericality: { greater_than: 0 }

  mount_uploader :picture, PictureUploader

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

end
