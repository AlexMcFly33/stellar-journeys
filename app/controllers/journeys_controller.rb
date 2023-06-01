class JourneysController < ApplicationController

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    authorize [:admin, @journey]
    @journey.spaceship = @spaceship
    if @journey.save
      redirect_to admin_journeys_path
    else
      render 'spaceships/show', status: :unprocessable_entity
    end
  end

  private

  def journey_params
    params.require(:journey).permit(
      :start_date,
      :end_date,
      :spaceship_id
      )
  end
end
