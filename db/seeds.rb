
require 'update_db'

UpdateDb.seed_lines

UpdateDb.seed_platforms_addresses_relate_lines("source")

UpdateDb.seed_platforms_addresses_relate_lines("destination")
