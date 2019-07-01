# frozen_string_literal: true

require 'json'
file = File.read(Rails.root.join('lib', 'seeds', 'airports.json'))
parsed_json = JSON.parse(file)

airports = []
map_json = parsed_json.map { |t| t[1] }
airports = []
map_json.each do |row|
  row['lng'] = row.delete 'lon'
  airports << Airport.new(row)
end

Airport.import(airports)
