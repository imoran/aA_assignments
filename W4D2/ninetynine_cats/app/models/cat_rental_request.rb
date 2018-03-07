class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING) }

  belongs_to :cat,
  foreign_key: :cat_id,
  class_name: :Cat

  def overlapping_requests
    puts cat.cat_rental_requests
  end

end
