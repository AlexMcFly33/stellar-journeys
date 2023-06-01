class Admin::JourneysController < ApplicationController

  def index
    @journeys = policy_scope([:admin, Journey])
  end

end
