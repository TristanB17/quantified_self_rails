class ApiBaseController < ActionController::API
  def check_food_id(id)
    begin
      food = Food.find(id)
      render json: food, serializer: FoodSerializer
    rescue
      render json: {error: 'Food not found'}, status: 400
    end
  end

  def create_food(food_params)
    begin
      food = Food.create!(name: food_params['name'], calories: food_params['calories'])
      render json: food, serializer: FoodSerializer
    rescue => error
      render json: {error: 'Invalid entry'}, status: 400
    end
  end

  def update_food(id, attributes)
    begin
      food = Food.find(id)
      food.update!(attributes)
      render json: food, serializer: FoodSerializer
    rescue => error
      render json: {message: 'Food unable to be updated'}, status: 400
    end
  end

  def destroy_food(id)
    begin
      Food.find(id).destroy
      render status: 204
    rescue => error
      render status: 404
    end
  end
end
