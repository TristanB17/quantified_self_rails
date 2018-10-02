class ApiBaseController < ActionController::API

  def check_food_id(id)
    begin
      food = Food.find(id)
      render json: food, serializer: FoodSerializer
    rescue
      render json: {error: 'Food not found'}, status: 404
    end
  end

  def create_food(food_params)
    begin
      food = Food.create(name: food_params['name'], calories: food_params['calories'].to_i)
      render json: food, serializer: FoodSerializer
    rescue => $!
      render json: {error: 'Invalid entry'}, status: 400
    end
  end
end
