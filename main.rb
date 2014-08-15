require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"

require_relative "./models/review.rb" 
require_relative "./models/trail.rb"
require_relative "./models/user.rb"

require 'forecast_io'

ForecastIO.api_key = 'bc799f9c215bbe4bd9f3fc497bfde58b'

@forecast = ForecastIO.forecast(41.2586100, -95.9377900) #omaha coordinates 

#not sure about how I give the running.db tables I made all the info for the 4 different trails, their info, reviews, etc

#first user, trail, and review
$u1 = User.create({name: "Adam"})

$t1 = Trail.create({trail_name: "Zorinsky Park", lat: 41.218889, long: -96.167222})

$r1 = Review.create({content: "Flat, around a lake", user_id: 1, trail_id: 1})

#second user, trail, and review
$u2 = User.create({name: "Mark"})

$t2 = Trail.create({trail_name: "Chalco Hills Trails", lat: 41.218889, long: -96.167222})

$r2 = Review.create({content: "Paved trails; dog friendly", user_id: 2, trail_id: 2})

#third user, trail, and review
$u3 = User.create({name: "Ted"})

$t3 = Trail.create({trail_name: "Big Papio Trail", lat: 41.218889, long: -96.167222})

$r3 = Review.create({content: "Multipe exits along the trail, hilly", user_id: 3, trail_id: 3})

#fourth trail and review, done by the first user
$t4 = Trail.create({trail_name: "Tranquility Trail", lat: 41.218889, long: -96.167222})

$r4 = Review.create({content: "Wooded trails, lots of bikers", user_id: 1, trail_id: 4}) #user 1 did 2 reviews


get "/" do 
  @forecast = ForecastIO.forecast(41.2586100, -95.9377900)
  @users = User.all
  @trails = Trail.all
  @reviews = Review.all
  erb :home
end


get "./models/review" do
  @reviews = Review.all
  erb :review
end

binding.pry