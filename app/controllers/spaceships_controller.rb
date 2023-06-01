class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @spaceships = policy_scope(Spaceship)
    if params[:query].present?
      if params[:query] == params[:query].to_i.to_s
        @spaceships = @spaceships.where("superficy = ?", params[:query].to_i)
      else
        sql_subquery = "name @@ :query
                OR localisation @@ :query"
        @spaceships = @spaceships.where(sql_subquery, query: "%#{params[:query]}%")
      end
    end
    if params[:gravity].present?
      @spaceships = @spaceships.where(gravity: params[:gravity])
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
