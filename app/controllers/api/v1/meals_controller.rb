class Api::V1::MealsController < ApiBaseController
  def index
    render json: Meal.includes(:foods).all, each_serializer: MealSerializer
  end
end
