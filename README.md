[SimpleAFMetro.com (Front End)](https://github.com/Dusty211/frontend-metro-app)

## SimpleAFMetro.com (Back End)
This is the Rails API back end for [SimpleAFMetro.com](https://www.simpleafmetro.com) - a web app for the DC Metrorail system. This API provides the data that the front end single page application needs to run. It uses Active Record ORM on a PostgreSQL database. Most of the static data is seeded to the database manually from the WMATA API, and the live data is fetched from the WMATA API as needed, and written to the database. The live data is re-served from the database if it is fresh enough, and re-fetched from WMATA's API if not. This caching behavior provides fresh data for customers, while at the same time keeping WMATA API calls to a minimum should SimpleAFMetro.com experience heavy traffic.

## Features
- Data caching to limit external API calls to one per 20 seconds per station for arrivals and 60 seconds for incidents
- Time calculations for applicable fare rate are done server-side to ensure consistency and accuracy
- Static data is seeded programmatically to ensure consistency and ease of use
- Uses new built-in Rails credentials encryption to secure sensitive data

## Motivation for SimpleAFMetro.com
I wanted to create an API that used live data from an external API. At the same time, I wanted to create new model relationships and data structures from this external data and ensure efficient use of the external API while also maintaining quality of service. I thought doing a full project would be a great opportunity to experience firsthand the real and practical challenges of achieving these goals.

## Made with:

- [Ruby Rails](https://github.com/rails/rails)
- [PostgreSQL](https://github.com/postgres/postgres)
- [Rack-cors](https://github.com/cyu/rack-cors)
- [Rest-client](https://github.com/rest-client/rest-client)

## Code Examples:

Below is the block of code that is responsible for the caching behavior of the arrival data. The data relationship between stations and arrivals is one to many, respectively. That is to say that a station has many arrivals, and an arrival belongs to a station. The last arrival update is timestamped in DateTime format on the station's table. This is what the code below is checking for. If the timestamp does not exist, or if it is older than 20 seconds, arrival data is fetched from WMATA's API. If the timestamp is newer than 20 seconds, no new API call is made, and the existing data is used.

#### Fetch new Data?

```ruby
if !station.arrivals_updated
  update_arrivals(station)
  puts "/////////////////////////////////NEVER BEEN UPDATED"
  return station.arrivals
elsif DateTime.now.to_time - station.arrivals_updated.to_time > 20
  station.arrivals.destroy_all
  update_arrivals(station)
  puts "/////////////////////////////////OVER 20 SECONDS OLD"
  return station.arrivals
else
  puts "/////////////////////////////////FRESH ARRIVALS"
  return station.arrivals
end
```

#### update_arrivals:

```ruby
def update_arrivals(station)
  color = {
    "GR" => "green",
    "BL" => "blue",
    "SV" => "silver",
    "RD" => "red",
    "OR" => "orange",
    "YL" => "yellow"
  }
  UpdateDb.arrivals_data(station.code).each do |arrival|
    new_arrival = Arrival.create(
      cars: arrival["Car"],
      destination: arrival["DestinationName"],
      line: color[arrival["Line"]],
      minutes: arrival["Min"]
     )
     station.arrivals << new_arrival
  end
  station.update!(arrivals_updated: DateTime.now)
end
```

## Development Environment Installation

#### Prerequisites:
- Working Ruby installation with the ability to run the correct version
- Ruby on Rails gem
- PostgreSQL server configured and running

#### Fork and clone the repo.

#### Install all packages with bundle:
`$ cd <root dir of clone>`  
`$ bundle install`

#### Create, migrate, and seed the database:
`$ rails db:create && rails db:migrate && rails db:seed`

#### Start the local rails dev server:
`$ rails s`

## Contribute

If you would like to contribute, feel free to submit a pull request or reach me at [personincharge@simpleAFMetro.com](mailto:personincharge@simpleAFMetro.com).

## License
#### The code that is specific to SimpleAFMetro.com and any other elements that are specific to its design are the property of Kyle Houghton and may not be used in any way without his express consent.  
© Kyle Houghton
