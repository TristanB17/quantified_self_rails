class Api::V1::FoodsController < ApiBaseController

  def index
    render json: Food.all, each_serializer: FoodSerializer
  end

  def show
    safe_search(404) do
      food = Food.find(params[:id])
      render json: food, serializer: FoodSerializer
    end
  end

  def create
    safe_search(400) do
      food = Food.create!(name: food_attributes['name'], calories: food_attributes['calories'])
      render json: food, serializer: FoodSerializer
    end
  end

  def update
    safe_search(400) do
      id = params[:id]
      food = Food.find(id)
      food.update!(food_attributes)
      render json: food, serializer: FoodSerializer
    end
  end

  def destroy
    safe_search(404) do
      id = params[:id]
      Food.find(id).destroy
      render status: 204
    end
  end

  private
  def food_attributes
    params.require(:food).permit(:name, :calories)
  end
end
