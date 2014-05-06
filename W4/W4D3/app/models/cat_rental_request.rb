class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validates :overlapping_approved_requests

  belongs_to :cat


  def overlapping_requests
    where_cond = (<<-SQL)
    :start_date BETWEEN cat_rental_requests.start_date AND cat_rental_requests.end_date
    OR :end_date BETWEEN cat_rental_requests.start_date AND cat_rental_requests.end_date
    AND :cat_id = cat_rental_requests.cat_id
    SQL
    self.class.where(where_cond,
    {start_date: self.start_date, end_date: self.end_date, cat_id: self.cat_id} )
  end

  def overlapping_approved_requests
    multiple_approved = []

    overlapping_requests do |request|
      multiple_approved << request if request.status == "APPROVED"
    end

    multiple_approved.count > 1
  end

end
