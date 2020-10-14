class TechesController < ApplicationController
  before_action :set_tech, only: %i[show update destroy]
  before_action :admin?, only: %i[create update destroy]

  # GET /teches
  def index
    @teches = Tech.all

    render json: @teches
  end

  # GET /teches/1
  def show
    @count = @tech.favourites.size
    render json: { favourited_count: @count, tech: @tech }
  end

  # POST /teches
  def create
    # @tech = Tech.new(tech_params)
    @tech = @user.teches.build(tech_params)

    if @tech.save
      render json: @tech, status: :created, location: @tech
    else
      render json: @tech.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teches/1
  def update
    if @tech.update(tech_params)
      render json: @tech
    else
      render json: @tech.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teches/1
  def destroy
    if @tech.destroy
      render json: { status: 'Delete success!', tech: @tech }
    else
      render json: 'failed to delete'
    end
  end

  private

  def admin?
    unless @user.admin
      render json: { error: 'Admin Permissions Required' }, status: 403
      nil
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_tech
    @tech = Tech.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tech_params
    params.require(:tech).permit(:title, :description, :category, :price, :cost, :user_id, images: [])
  end
end
