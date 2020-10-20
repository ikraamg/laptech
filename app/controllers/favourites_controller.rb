class FavouritesController < ApplicationController

  def user_favourites
    @user_favourites = @user.favourite_teches

    render json: @user_favourites
  end

  # POST /favourites
  def create
    @favourite = @user.favourites.build(favourite_params)

    if @favourite.save
      render json: @favourite, status: :created, location: @favourite
    else
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favourites/1
  def destroy

    @favourite = Tech.find(params[:id]).favourites.where(user_id: @user.id).first
    if @user != @favourite.user_id
      render json: { error: 'Favourite is not owned by user'}, status: :forbidden
      return 
    end

    if @favourite.destroy
      render json: { status: 'deleted!', tech: @favourite }
    else
      render json: { error: 'failed to delete' }, status: :bad_request
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a trusted parameter "white list" through.
  def favourite_params
    params.require(:favourite).permit(:tech_id)
  end
end
