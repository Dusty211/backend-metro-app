
module StationConverter

  def to_station_name(station_code)

      names = {
        "A01"=>"Metro Center",
        "A02"=>"Farragut North",
        "A03"=>"Dupont Circle",
        "A04"=>"Woodley Park-Zoo/Adams Morgan",
        "A05"=>"Cleveland Park",
        "A06"=>"Van Ness-UDC",
        "A07"=>"Tenleytown-AU",
        "A08"=>"Friendship Heights",
        "A09"=>"Bethesda",
        "A10"=>"Medical Center",
        "A11"=>"Grosvenor-Strathmore",
        "A12"=>"White Flint",
        "A13"=>"Twinbrook",
        "A14"=>"Rockville",
        "A15"=>"Shady Grove",
        "B01"=>"Gallery Pl-Chinatown",
        "B02"=>"Judiciary Square",
        "B03"=>"Union Station",
        "B04"=>"Rhode Island Ave-Brentwood",
        "B05"=>"Brookland-CUA",
        "B06"=>"Fort Totten",
        "B07"=>"Takoma",
        "B08"=>"Silver Spring",
        "B09"=>"Forest Glen",
        "B10"=>"Wheaton",
        "B11"=>"Glenmont",
        "B35"=>"NoMa-Gallaudet U",
        "C01"=>"Metro Center",
        "C02"=>"McPherson Square",
        "C03"=>"Farragut West",
        "C04"=>"Foggy Bottom-GWU",
        "C05"=>"Rosslyn",
        "C06"=>"Arlington Cemetery",
        "C07"=>"Pentagon",
        "C08"=>"Pentagon City",
        "C09"=>"Crystal City",
        "C10"=>"Ronald Reagan Washington National Airport",
        "C12"=>"Braddock Road",
        "C13"=>"King St-Old Town",
        "C14"=>"Eisenhower Avenue",
        "C15"=>"Huntington",
        "D01"=>"Federal Triangle",
        "D02"=>"Smithsonian",
        "D03"=>"L'Enfant Plaza",
        "D04"=>"Federal Center SW",
        "D05"=>"Capitol South",
        "D06"=>"Eastern Market",
        "D07"=>"Potomac Ave",
        "D08"=>"Stadium-Armory",
        "D09"=>"Minnesota Ave",
        "D10"=>"Deanwood",
        "D11"=>"Cheverly",
        "D12"=>"Landover",
        "D13"=>"New Carrollton",
        "E01"=>"Mt Vernon Sq 7th St-Convention Center",
        "E02"=>"Shaw-Howard U",
        "E03"=>"U Street/African-Amer Civil War Memorial/Cardozo",
        "E04"=>"Columbia Heights",
        "E05"=>"Georgia Ave-Petworth",
        "E06"=>"Fort Totten",
        "E07"=>"West Hyattsville",
        "E08"=>"Prince George's Plaza",
        "E09"=>"College Park-U of Md",
        "E10"=>"Greenbelt",
        "F01"=>"Gallery Pl-Chinatown",
        "F02"=>"Archives-Navy Memorial-Penn Quarter",
        "F03"=>"L'Enfant Plaza",
        "F04"=>"Waterfront",
        "F05"=>"Navy Yard-Ballpark",
        "F06"=>"Anacostia",
        "F07"=>"Congress Heights",
        "F08"=>"Southern Avenue",
        "F09"=>"Naylor Road",
        "F10"=>"Suitland",
        "F11"=>"Branch Ave",
        "G01"=>"Benning Road",
        "G02"=>"Capitol Heights",
        "G03"=>"Addison Road-Seat Pleasant",
        "G04"=>"Morgan Boulevard",
        "G05"=>"Largo Town Center",
        "J02"=>"Van Dorn Street",
        "J03"=>"Franconia-Springfield",
        "K01"=>"Court House",
        "K02"=>"Clarendon",
        "K03"=>"Virginia Square-GMU",
        "K04"=>"Ballston-MU",
        "K05"=>"East Falls Church",
        "K06"=>"West Falls Church-VT/UVA",
        "K07"=>"Dunn Loring-Merrifield",
        "K08"=>"Vienna/Fairfax-GMU",
        "N01"=>"McLean",
        "N02"=>"Tysons Corner",
        "N03"=>"Greensboro",
        "N04"=>"Spring Hill",
        "N06"=>"Wiehle-Reston East"
      }

    return names[station_code]

  end

  # Not needed?
  #
  # def to_station_code(station_name)
  #
  #   codes = {"Metro Center"=>"C01", "Farragut North"=>"A02", "Dupont Circle"=>"A03", "Woodley Park-Zoo/Adams Morgan"=>"A04", "Cleveland Park"=>"A05", "Van Ness-UDC"=>"A06", "Tenleytown-AU"=>"A07", "Friendship Heights"=>"A08", "Bethesda"=>"A09", "Medical Center"=>"A10", "Grosvenor-Strathmore"=>"A11", "White Flint"=>"A12", "Twinbrook"=>"A13", "Rockville"=>"A14", "Shady Grove"=>"A15", "Gallery Pl-Chinatown"=>"F01", "Judiciary Square"=>"B02", "Union Station"=>"B03", "Rhode Island Ave-Brentwood"=>"B04", "Brookland-CUA"=>"B05", "Fort Totten"=>"E06", "Takoma"=>"B07", "Silver Spring"=>"B08", "Forest Glen"=>"B09", "Wheaton"=>"B10", "Glenmont"=>"B11", "NoMa-Gallaudet U"=>"B35", "McPherson Square"=>"C02", "Farragut West"=>"C03", "Foggy Bottom-GWU"=>"C04", "Rosslyn"=>"C05", "Arlington Cemetery"=>"C06", "Pentagon"=>"C07", "Pentagon City"=>"C08", "Crystal City"=>"C09", "Ronald Reagan Washington National Airport"=>"C10", "Braddock Road"=>"C12", "King St-Old Town"=>"C13", "Eisenhower Avenue"=>"C14", "Huntington"=>"C15", "Federal Triangle"=>"D01", "Smithsonian"=>"D02", "L'Enfant Plaza"=>"F03", "Federal Center SW"=>"D04", "Capitol South"=>"D05", "Eastern Market"=>"D06", "Potomac Ave"=>"D07", "Stadium-Armory"=>"D08", "Minnesota Ave"=>"D09", "Deanwood"=>"D10", "Cheverly"=>"D11", "Landover"=>"D12", "New Carrollton"=>"D13", "Mt Vernon Sq 7th St-Convention Center"=>"E01", "Shaw-Howard U"=>"E02", "U Street/African-Amer Civil War Memorial/Cardozo"=>"E03", "Columbia Heights"=>"E04", "Georgia Ave-Petworth"=>"E05", "West Hyattsville"=>"E07", "Prince George's Plaza"=>"E08", "College Park-U of Md"=>"E09", "Greenbelt"=>"E10", "Archives-Navy Memorial-Penn Quarter"=>"F02", "Waterfront"=>"F04", "Navy Yard-Ballpark"=>"F05", "Anacostia"=>"F06", "Congress Heights"=>"F07", "Southern Avenue"=>"F08", "Naylor Road"=>"F09", "Suitland"=>"F10", "Branch Ave"=>"F11", "Benning Road"=>"G01", "Capitol Heights"=>"G02", "Addison Road-Seat Pleasant"=>"G03", "Morgan Boulevard"=>"G04", "Largo Town Center"=>"G05", "Van Dorn Street"=>"J02", "Franconia-Springfield"=>"J03", "Court House"=>"K01", "Clarendon"=>"K02", "Virginia Square-GMU"=>"K03", "Ballston-MU"=>"K04", "East Falls Church"=>"K05", "West Falls Church-VT/UVA"=>"K06", "Dunn Loring-Merrifield"=>"K07", "Vienna/Fairfax-GMU"=>"K08", "McLean"=>"N01", "Tysons Corner"=>"N02", "Greensboro"=>"N03", "Spring Hill"=>"N04", "Wiehle-Reston East"=>"N06"}
  #
  #   return codes[station_name]
  #
  # end

end
