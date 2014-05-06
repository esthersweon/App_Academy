class Gym < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :fighters, {
    :primary_key => :id,
    :foreign_key => :gym_id,
    class_name: 'Fighter'
  }
  has_many :fighters_tattoos,
    :through => :fighters,
    :source => :tattoos

  def tattoos_per_fighter
    fers = self.fighters.eager_load(:tattoos)

    tats = Hash.new(0)
    fers.each do |fighter|
      tats[fighter.name] = fighter.tattoos.length
    end
    tats
  end
end
