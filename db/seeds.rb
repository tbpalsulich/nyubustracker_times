# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
response = Unirest.get "https://transloc-api-1-2.p.mashape.com/stops.json?agencies=72", 
            headers:{"X-Mashape-Key" => "8jO50wcZsTmshJaRMDJTevcv1KQgp1tkqemjsnifZRJ4AXZhjt"}
stops = response.body["data"]
stops.each do |stop|
    stop_id = stop["stop_id"]
    stop_name = stop["name"]
    times_response = Unirest.get "https://s3.amazonaws.com/nyubustimes/1.0/#{stop_id}.json"
    times_response = times_response.raw_body
    times_response = "{\"stop\":\"#{stop_name}\", \"stop_id\":\"#{stop_id}\", \"routes\":{}}" if times_response.include? "AccessDenied"         
    Stop.create(:stop_id => stop_id, :stop_name => stop_name, :times => JSON(times_response))
end