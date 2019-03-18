require 'csv'

namespace :kart_race do
  filepath = 'db/kartrace.csv'
  csv_options = { col_sep: '\t', headers: :first_row }
  results = []

  CSV.foreach(filepath, csv_options) do |row|
    results_row = []
    row.to_s.split(' ').each do |csv_row|
      results_row << csv_row
    end 
   results << results_row
  end

  desc "create pilots"
  task pilots: :environment do
        results.each do |pilots_row|
      if Pilot.where(pilot_code: pilots_row[1]).last.nil?
        pilot = Pilot.create(pilot_code: pilots_row[1], pilot_name: pilots_row[3])
      end
    end
  end

  desc "create laps"
  task laps: :environment do
    results.each do |laps_row|
    laps_row[0][0] = ""
    laps_row[6][-1] = ""
    lap = Lap.create(lap_hour: Time.parse(laps_row[0]), 
                    lap_number: laps_row[4],
                    lap_average_speed: laps_row[6].gsub(",", ".").to_f.round(3),
                    pilot_id: Pilot.where(pilot_name: laps_row[3]).last.id,
                    lap_millisenconds: (laps_row[5][-3..-1].to_i + (laps_row[5][-6..-5].to_i*1000) + laps_row[5][0].to_i*60000))
    end
  end
end

