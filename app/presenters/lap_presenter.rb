class LapPresenter < SimpleDelegator
  def initialize(pilot_id)
    @pilot_id = pilot_id
  end

  def pilot_total_laps
    Lap.where(pilot_id: @pilot_id).pluck(:lap_number).max
  end

  def pilot_lap_duration
    Lap.where(pilot_id: @pilot_id).pluck(:lap_millisenconds).inject(0, &:+)
  end

  def formated_pilot_lap_duration
    minutes = pilot_lap_duration / (100 * 60) % 60
    seconds = (pilot_lap_duration - 60000 * minutes)/1000
    milliseconds = pilot_lap_duration - (60000 * minutes) - (1000 * seconds)
    return "#{minutes}:#{seconds}.#{milliseconds}"
 end
end
