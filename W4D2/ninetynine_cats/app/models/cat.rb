class Cat < ApplicationRecord
  validates :sex, inclusion: { in: %w(M F) }
  validates :color, inclusion: { in: %w(green red white black) }
  validates :birth_date, :color, :sex, :description, presence: true

  # COLORS = %i(green red white black).freeze

  def age
    cats = Cat.all
    ages = []

    cats.each do |cat|
      ages << Time.now.year - cat.birth_date.year
    end
    ages
  end

  has_many :cat_rental_requests,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy


end
