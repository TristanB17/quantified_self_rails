class Api::V1::FoodsController < ApiBaseController

  def index
    render json: Food.all, each_serializer: FoodSerializer
  end

  def show
    check_food_id(params[:id])
  end

  def create
    create_food(params['food'])
  end
end
