class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @spaceships = policy_scope(Spaceship)
    if params[:query].present?
      @spaceships = @spaceships.where("name ILIKE ?", "%#{params[:query]}%")
    end

    if params[:superficy].present?
      @spaceships = @spaceships.where(superficy: params[:superficy])
    end

    if params[:localisation].present?
      @spaceships = @spaceships.where(localisation: params[:localisation])
    end
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
    authorize @spaceship
    if @spaceship.save
      redirect_to admin_spaceships_path
    else
      render :new, status: :unprocessable_entity
    end
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
