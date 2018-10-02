require 'rails_helper'

describe 'a user creates a food' do
  context 'post /api/v1/foods' do
    it 'creates a food' do
      food_1 = create(:food)
      food_2 = create(:food_2)

      food = { 'food': { 'name': 'rigatoni', 'calories': '700' } }

      post "/api/v1/foods", params: food

      expect(response).to be_successful
      expect(response.status).to eq(200)
      new_food = JSON.parse(response.body, symbolize_names: true)

      expect(new_food[:name]).to eq('rigatoni')
      expect(new_food[:calories]).to eq(700)
    end
    it 'returns a 400 if food creation invalid' do
      no_good_food = { 'food': { 'name': 'spaghett' } }

      post '/api/v1/foods', params: no_good_food

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.message).to eq('Bad Request')
    end
  end
end
