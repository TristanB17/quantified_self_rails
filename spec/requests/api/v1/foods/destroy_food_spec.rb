require 'rails_helper'

describe 'a user deletes a food' do
  context 'delete /api/v1/foods/:id' do
    it 'destroys a food' do
      food_1 = create(:food)
      food_2 = create(:food_2)

      delete "/api/v1/foods/#{food_1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(Food.first).to eq(food_2)
    end
    it 'returns a 404 if food does not exist' do
      delete "/api/v1/foods/90"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
