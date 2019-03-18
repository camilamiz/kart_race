class PilotsController < ApplicationController
  def index
    @pilots = define_winning_pilot
  end

  private

  def define_winning_pilot
    duration_per_pilot = Lap.group(:pilot_id).sum(:lap_millisenconds).sort_by { |_key,value| value }
    max_laps = Lap.maximum(:lap_number)
        
    final_results = []
    duration_per_pilot.each do |pilot|
      final_results << Pilot.find(pilot[0])
    end

    return final_results
  end
end
