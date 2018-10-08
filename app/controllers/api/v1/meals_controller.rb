class Api::V1::MealsController < ApiBaseController
  def index
    render json: Meal.all, each_serializer: MealSerializer
  end
end
