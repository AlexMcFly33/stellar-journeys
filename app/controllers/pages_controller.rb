class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def index
    @spaceships = Spaceship.all
  end

  def home
  end
end
