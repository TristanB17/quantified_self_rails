class Api::V1::FavoriteFoodsController < ApiBaseController
  def index
    foods = Food.sort_favorites
    render json: foods, each_serializer: FavoriteSerializer
  end
end
