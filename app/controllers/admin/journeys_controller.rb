class Admin::JourneysController < ApplicationController

  def index
    @journeys = policy_scope([:admin, Journey])
  end

  def destroy
    @journey = Journey.find(params[:id])
    authorize [:admin, @journey]
    @journey.destroy
    redirect_to admin_journeys_path, status: :see_other
  end

end
