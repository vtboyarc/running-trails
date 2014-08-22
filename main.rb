require 'rubygems'
require 'bundler'
Bundler.require

require_relative "./models/user.rb"
require_relative "./models/review.rb" 
require_relative "./models/trail.rb"
require_relative "./routes/reviews.rb"
require_relative "./routes/trails.rb"
require_relative "./routes/users.rb"

ForecastIO.api_key = 'bc799f9c215bbe4bd9f3fc497bfde58b'

@forecast = ForecastIO.forecast(41.2586100, -95.9377900) #omaha coordinates

#not sure about how I give the running.db tables I made all the info for the 4 different trails, their info, reviews, etc

# deleted the other 3 entries from here, leaving this as example for how to add more entries into pry if needed
# #$u1 = User.create({name: "Adam"})
#
# $t1 = Trail.create({trail_name: "Zorinsky Park", lat: 41.218889, long: -96.167222})
#
# $r1 = Review.create({content: "Around a lake; mainly flat with some hills; gets busy on weekends.", user_id: 1, trail_id: 1})

