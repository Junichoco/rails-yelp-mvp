class RestaurantsController < ApplicationController

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy!
    redirect_to restaurants_url, notice: "Restaurant was successfully destroyed.", status: :see_other
  end

  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  before_action :set_restaurant, only: %i[show edit update destroy chef]

  def chef
    @chef_name = @restaurant.chef_name
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :rating)
    end

end
