class Api::V1::FoodMealsController < ApiBaseController

  def index
    safe_search(404) do
      render json: meal, serializer: MealSerializer
    end
  end

  def create
    safe_search(404) do
      render json: { message: "Successfully added #{food.name} to #{meal.name}" }, status: 201
    end
  end

  def destroy
    if food_meal
      food_meal[:food_meal].destroy
      render json: { message: food_meal[:message] }
    else
      render json: { message: "Invalid, food or meal not found" }, status: 404
    end
  end

  private

  def food_meal_params
    params.permit(:id, :meal_id)
  end

  def meal
    @meal ||= Meal.find_by_id(params[:meal_id])
  end

  def food
    @food ||= Food.find_by_id(params[:id])
  end

  def food_meal
    @food_meal ||= food_meal = FoodMeal.determine_relation(food_meal_params[:id], food_meal_params[:meal_id])
  end
end
