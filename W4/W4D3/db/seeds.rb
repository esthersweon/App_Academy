# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

barry = Cat.create!(name: "barry", sex: "F", age: "85", color: "brown", birth_date: Time.new(2012))

steve = Cat.create!(name: "bdafry", sex: "F", age: "5", color: "brown", birth_date: Time.new(2012))
george = Cat.create!(name: "badafsrry", sex: "F", age: "185", color: "orange", birth_date: Time.new(2012))
larry = Cat.create!(name: "badfasdry", sex: "F", age: "485", color: "brown", birth_date: Time.new(2012))
bob = Cat.create!(name: "abarrsdfdsy", sex: "F", age: "85", color: "brown", birth_date: Time.new(2012))

CatRentalRequest.create!(cat_id: barry.id, start_date: Time.new(2012), end_date: Time.new(2013) )


