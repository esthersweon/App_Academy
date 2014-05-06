class Cat < ActiveRecord::Base
  validates :age, :color, :name, :sex, :presence => true

  validates :age, numericality: true
  validates :color, inclusion: { in: %w(black brown white orange blue) }
  validates :sex, inclusion: { in: %w(M, F) }

  has_many :cat_rental_requests, :dependent => :destroy


  def self.attributes
    [:age, :birth_date, :color, :name, :sex]
  end

end
