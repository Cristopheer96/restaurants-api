class Api::V1::RestaurantsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]# la autenticacion se hara con esta gemay se especifica en que vista se debe usar
  before_action :set_restaurant, only: [ :show, :update, :destroy ]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show

  end

  def update
    if @restaurant.update(restaurant_params)
      render :show
    else
      render_error
    end
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    authorize @restaurant
      if @restaurant.save
      render :show
    else
      render_error
    end
  end
  def destroy
    @restaurant.destroy
    head :ok
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant # Para pundit
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
  def render_error
    render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
  end
end
