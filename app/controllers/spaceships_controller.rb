class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show, :edit, :update, :destroy]

  def index
    @spaceships = policy_scope(Spaceship)
  end

  def show
    @journey = Journey.new
  end

  def new
    @spaceship = Spaceship.new
    authorize @spaceship
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to spaceships_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  def destroy
    @spaceship.destroy
    redirect_to spaceships_path, status: :see_other
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
    authorize @spaceship
  end

  def spaceship_params
    params.require(:spaceship).permit(
      :name,
      :superficy,
      :gravity,
      :localisation,
      :number_of_guest,
      :price,
      :photo
    )
  end
end
