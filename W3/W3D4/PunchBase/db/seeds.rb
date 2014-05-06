Gym.create!(name: "Rocky's")
sweat = Gym.create!(name: "Sweat Haus")
dyelb = Gym.create!(name: "Do you even lift, bro?")
Gym.create!(name: "Jackson's MMA")
Gym.create!(name: "Jim's Gym")
Gym.create!(name: "Tim's Gym")

hottie = Fighter.create!(name: "Michelle Karate Hottie Waterson", weight: 115, gym_id: sweat.id)
ronda = Fighter.create!(name: "Rowdy Ronda Rousey", weight: 135, gym_id: sweat.id)

liz = Fighter.create!(name: "Liz Girlrilla Carmouche", weight: 135, gym_id: sweat.id)

cupcake = Fighter.create!(name: "Meisha Cupcake Tate", weight: 135, gym_id: dyelb.id)

Tattoo.create!(
  fighter_id: cupcake.id,
  name: 'Petunia',
  description: "a freakin' petunia, what are you an idiot?")

Tattoo.create!(
  fighter_id: hottie.id,
  name: "ATP",
  description: "A an energy molecule"
)

Tattoo.create!(
  fighter_id: liz.id,
  name: "Condelezza",
  description: "Former Secretary of State, floating in a bowl of rice"
)

Tattoo.create!(
  fighter_id: ronda.id,
  name: "stealthy salty selfie, onthe shelfie, wealthy and healthy",
  description: "her own face"
)
