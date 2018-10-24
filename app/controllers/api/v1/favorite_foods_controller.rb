class Api::V1::FavoriteFoodsController < ApiBaseController
  def index
    render json: Food.sort_favorites, each_serializer: FavoriteSerializer
  end
end
