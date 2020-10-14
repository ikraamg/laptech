class TechesController < ApplicationController
  before_action :set_tech, only: %i[show update destroy favourited_count]

  # GET /teches
  def index
    @teches = Tech.all

    render json: @teches
  end

  # GET /teches/1
  def show
    render json: @tech
  end

  def favourited_count
    @count = @tech.favourites.size

    render json: {count: @count}
  end

  # POST /teches
  def create
    return unless @user.admin

    @tech = Tech.new(tech_params)

    if @tech.save
      render json: @tech, status: :created, location: @tech
    else
      render json: @tech.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teches/1
  def update
    return unless @user.admin

    if @tech.update(tech_params)
      render json: @tech
    else
      render json: @tech.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teches/1
  def destroy
    return unless @user.admin

    if @tech.destroy
      render json: @tech
    else
      render json: 'failed to delete'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tech
    @tech = Tech.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tech_params
    params.require(:tech).permit(:title, :description, :category, :price, :cost, :user_id, images: [])
  end
end
