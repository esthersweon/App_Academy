class Fighter < ActiveRecord::Base
  validates :name, :weight, :presence => true
  validates :name, :uniqueness => true

  scope :bantamweights, -> { where :weight => 135 }

  belongs_to :gym,
    :foreign_key =>:gym_id,
    :primary_key => :id,
    :class_name => "Gym"

  has_many :tattoos

  def self.straw_weights
    self.where(:weight => 100..200)
  end
end
