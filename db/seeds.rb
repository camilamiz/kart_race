# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read('db/kartrace.csv')
csv_options = { col_sep: ' ', force_quotes: true, quote_char: '"', headers: true }

csv = CSV.parse(csv_text, csv_options)
csv.each do |row|
  csv_row = row[0].split(" ")
  joined_items = [csv_row[1], csv_row[2], csv_row[3]].join(" ")

  new_array = []
  new_array << csv_row[0]
  new_array << joined_items
  new_array << csv_row[4]
  new_array << csv_row[5]
  new_array << csv_row[6]
  p new_array
end


