class Api::V1::FoodMealsController < ApiBaseController

  def index
    safe_search_meal(404) do
      meal = Meal.find_by_id(params[:meal_id])
      render json: meal, serializer: MealSerializer
    end
  end

  def create
    safe_search_meal(404) do
      meal = Meal.find_by_id(params[:meal_id])
      food = Food.find_by_id(params[:id])
      render json: { message: "Successfully added #{food.name} to #{meal.name}" }, status: 201
    end
  end

  def destroy
    food_meal = FoodMeal.determine_relation(params[:id], params[:meal_id])
    if food_meal
      food_meal[:food_meal].destroy
      render json: { message: food_meal[:message] }
    else
      render json: { message: "Invalid, food or meal not found" }, status: 404
    end
  end
end
