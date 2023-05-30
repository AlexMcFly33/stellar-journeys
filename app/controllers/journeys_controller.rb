class JourneysController < ApplicationController

  def index
    @journeys = Journey.all
  end

  def new
    @journey = Journey.new
  end

  def show
    @journey = Journey.find(params[:id])
  end
end
