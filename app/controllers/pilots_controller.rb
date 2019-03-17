class PilotsController < ApplicationController
  def index
    @pilots = Pilot.all
  end
end
