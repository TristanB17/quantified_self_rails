require 'rails_helper'

describe 'a user creates a food' do
  context 'post /api/v1/foods' do
    it 'creates a food' do
      food = { 'food': { 'name': 'rigatoni', 'calories': '700' } }

      post "/api/v1/foods", params: food

      expect(response).to be_successful
      expect(response.status).to eq(200)
      new_food = JSON.parse(response.body, symbolize_names: true)

      expect(new_food[:name]).to eq('rigatoni')
      expect(new_food[:calories]).to eq(700)
    end
    it 'returns a 404 if food not found in the database' do
      get "/api/v1/foods/16"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
