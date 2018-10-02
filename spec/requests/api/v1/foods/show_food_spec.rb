require 'rails_helper'

describe 'a user visits food show page' do
  context 'get /api/v1/foods/:id' do
    it 'displays a food' do
      food_1 = create(:food)

      get "/api/v1/foods/#{food_1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      food = JSON.parse(response.body, symbolize_names: true)

      expect(food).to have_key(:name)
      expect(food).to have_key(:calories)
      expect(food[:name]).to eq('linguine')
      expect(food[:calories]).to eq(290)
    end
    it 'returns a 404 if food not found in the database' do
      get "/api/v1/foods/16"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
