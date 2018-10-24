class Api::V1::FoodsController < ApiBaseController
  def index
    render json: Food.all, each_serializer: FoodSerializer
  end

  def show
    safe_search(404) do
      render json: food, serializer: FoodSerializer
    end
  end

  def create
    safe_search(400) do
      render json: create_food, serializer: FoodSerializer
    end
  end

  def update
    safe_search(400) do
      food.update(food_attributes)
      render json: food, serializer: FoodSerializer
    end
  end

  def destroy
    safe_search(404) do
      food.destroy
      render status: 204
    end
  end

  private

  def food_attributes
    params.require(:food).permit(:name, :calories)
  end

  def id
    @id ||= params[:id]
  end

  def food
    @food ||= Food.find(id)
  end

  def create_food
    @new_food ||= Food.create!(name: food_attributes['name'], calories: food_attributes['calories'])
  end
end
