class FavoriteSerializer < ActiveModel::Serializer
  attributes :times_eaten, :food

  def times_eaten
    object[0]
  end

  def food
    object[1].map {|food| FavoriteFoodSerializer.new(food)}
  end
end
