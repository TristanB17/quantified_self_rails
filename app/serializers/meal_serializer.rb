class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :foods

  def foods
    object.foods.map do |food|
      FoodSerializer.new(food).attributes
    end
  end
end
