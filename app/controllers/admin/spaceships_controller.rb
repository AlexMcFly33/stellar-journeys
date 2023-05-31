class Admin::SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  def index
    @spaceships = policy_scope(Spaceship)
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
