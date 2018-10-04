class FavoriteFoodSerializer < ActiveModel::Serializer
  attributes :name, :calories, :mealsWhenEaten

  def mealsWhenEaten
    object.meals.map { |meal| meal.name }
  end
end
