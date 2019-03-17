class LapPresenter < SimpleDelegator
  def initialize(pilot_id)
    @pilot_id = pilot_id
  end

  def total_laps
    Lap.where(pilot_id: @pilot_id).pluck(:lap_number).max
  end

  def lap_duration
    duration = Lap.where(pilot_id: @pilot_id).pluck(:lap_millisenconds).inject(0, &:+)
    hours = duration / (1000 * 60 * 60)
    minutes = duration / (100 * 60) % 60
    milliseconds = duration - hours - minutes
    return "#{hours}:#{minutes}.#{milliseconds}"
  end
end
