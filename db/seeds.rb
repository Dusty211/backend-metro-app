
require 'update_db'

#hardcoded in UpdateDb - does not use WMATA API data
UpdateDb.seed_lines
puts "=> Seeded lines"

#depends on .seed_lines being done beforehand
UpdateDb.seed_platforms_addresses_associate_lines
puts "=> Seeded platforms, addresses, and associated lines"

#depends on .seed_platforms_addresses_associate_lines being done beforehand
UpdateDb.seed_itineraries
puts "=> Seeded itineraries"
