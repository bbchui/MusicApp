# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# b1 = Band.create(name: "Brandon's Cool Band")
# b2 = Band.create(name: "Korean Rage")

a1 = Album.create(name: "Songs About Ranelle", band_id: 1)
a2 = Album.create(name: "Murica", band_id: 2)

5.times do |x|
  Track.create(name: "Murica#{x}", album_id: a1.id)
end

5.times do |x|
  Track.create(name: "Ranelle#{x}", album_id: a2.id)
end
