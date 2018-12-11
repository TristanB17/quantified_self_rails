class FavoriteFoodSerializer < ActiveModel::Serializer
  attributes :name, :calories, :mealsWhenEaten

  def mealsWhenEaten
    object.meals.map(&:name)
  end
end
