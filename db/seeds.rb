# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
d1 = Dress.create!(name: "Floral Print Dress")
d2 = Dress.create!(name: "Orange Crepe Gown")
d3 = Dress.create!(name: "Draped Rose Gown")
d4 = Dress.create!(name: "Rose Lace Dress")
d5 = Dress.create!(name: "Blue Silk Dress")

ds1 	= d1.dress_sizes.build(size: 1).save
ds2 	= d1.dress_sizes.build(size: 2).save
ds3 	= d2.dress_sizes.build(size: 1).save
ds4 	= d2.dress_sizes.build(size: 3).save
ds5 	= d3.dress_sizes.build(size: 1).save
ds6 	= d4.dress_sizes.build(size: 1).save
ds7 	= d4.dress_sizes.build(size: 2).save
ds8	 	= d4.dress_sizes.build(size: 3).save
ds9 	= d5.dress_sizes.build(size: 2).save
ds10 	= d5.dress_sizes.build(size: 4).save
ds11 	= d5.dress_sizes.build(size: 5).save