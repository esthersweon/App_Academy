require 'addressable/uri'
require 'json'
require 'rest-client'
require 'nokogiri'

def ask_current_location
  puts "Please input your current location:"
  location = gets.chomp
end

def current_location(address)
  current_location_url = Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "maps/api/geocode/json",
    :query_values => {
      :address => address,
      :sensor => "false"}
  ).to_s

  results = JSON.parse(RestClient.get(current_location_url))
  results["results"][0]["geometry"]["location"] #first result's location
  #returns a hash with "lat" and "lng" as keys, numbers as values.
end

def ask_keyword
  puts "Please input your search keyword:"
  keyword = gets.chomp
end

def nearby_locations(lat, lng, keyword)
  nearby_url = Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "maps/api/place/nearbysearch/json",
    :query_values => {
      :key => "AIzaSyDSPEHKkyruYPzbSnAB4Bc7WOPMLljHnfY",
      :location => "#{lat}, #{lng}",
      :radius => "5000",
      :sensor => "false",
      :keyword => keyword,
      :rank_by => "distance"}
  ).to_s

  results = JSON.parse(RestClient.get(nearby_url))
  name = results["results"][0]["name"] # name of top result
  lat_lng = results["results"][0]["geometry"]["location"]
  # hash with "lat" and "lng" as keys, numbers as values.

  [name, lat_lng["lat"], lat_lng["lng"]]
end

def directions(origin, destination)
  directions_url = Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "maps/api/directions/json",
    :query_values => {
      :origin => "#{origin["lat"]}, #{origin["lng"]}",
      :destination => "#{destination[1]}, #{destination[2]}",
      :sensor => "false",
      :mode => "walking"}
  ).to_s

  results = JSON.parse(RestClient.get(directions_url))
end


def print_directions(results, name)
  puts "Directions to #{name}"
  puts "Start Address: #{results["routes"][0]["legs"][0]["start_address"]}"
  puts
  steps = results["routes"][0]["legs"][0]["steps"]
  # an array of hashes, each with a step
  steps.each do |hash|
    parsed_html = Nokogiri::HTML(hash["html_instructions"])
    puts parsed_html.text
    parsed_html2 = Nokogiri::HTML(hash["distance"]["text"])
    puts "for " + parsed_html2.text
    puts
  end
  puts
  puts "End Address: #{results["routes"][0]["legs"][0]["end_address"]}"
end


input_address = ask_current_location

cl = current_location(input_address)
#returns a hash with "lat" and "lng" as keys, numbers as values.

keyword = ask_keyword

dst = nearby_locations(cl["lat"], cl["lng"], keyword) 
# returns [name, lat of destination, lng of destination]

dir = directions(cl, dst)
# returns parsed directions

print_directions(dir, dst[0])
