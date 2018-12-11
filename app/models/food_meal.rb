class FoodMeal < ApplicationRecord
  belongs_to :food
  belongs_to :meal

  def self.determine_relation(food_id, meal_id)
    found_food = Food.find_by_id(food_id)
    found_meal = Meal.find_by_id(meal_id)
    return unless found_food && found_meal

    found_food_meal = FoodMeal.where(food_id: found_food.id, meal_id: found_meal.id).first
    { message: "Successfully removed #{found_food.name} from #{found_meal.name}", food_meal: found_food_meal }
  end
end
