class Api::V1::FoodsController < ApiBaseController

  def index
    render json: Food.all, each_serializer: FoodSerializer
  end

  def show
    check_food_id(params[:id])
  end

  def create
    create_food(food_attributes)
  end

  def update
    update_food(params[:id], food_attributes)
  end

  def destroy
    destroy_food(params[:id])
  end

  private
  def food_attributes
    params.require(:food).permit(:name, :calories)
  end
end
