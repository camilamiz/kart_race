class LapPresenter < SimpleDelegator
  def initialize(pilot_id)
    @pilot_id = pilot_id
  end

  def pilot_total_laps
    Lap.where(pilot_id: @pilot_id).pluck(:lap_number).max
  end

  def pilot_lap_duration
    total_duration = Lap.where(pilot_id: @pilot_id).pluck(:lap_millisenconds).inject(0, &:+)
    formated_duration(total_duration)
  end


  def pilot_average_speed
    pilot_speeds =  Lap.where(pilot_id: @pilot_id).pluck(:lap_average_speed)
    average = pilot_speeds.inject(0, &:+)/pilot_speeds.size
    return average.round(3)
  end

  def pilot_best_lap
    best_lap = Lap.where(pilot_id: @pilot_id).pluck(:lap_millisenconds).sort.first
    formated_duration(best_lap)
  end 

   private

  def formated_duration(duration)
    minutes = duration / 60000
    seconds = (duration - 60000 * minutes)/1000
    milliseconds = duration - (60000 * minutes) - (1000 * seconds)
    return "#{minutes}:#{seconds}.#{milliseconds}"
  end

end
