require 'rails_helper'

describe 'a user visits foods index' do
  context 'get /api/v1/foods' do
    it 'displays all foods' do
      food_1 = create(:food)
      food_2 = create(:food_2)
      food_3 = create(:food_3)

      get '/api/v1/foods'

      expect(response).to be_successful
      expect(response.status).to eq(200)
      foods = JSON.parse(response.body, symbolize_names: true)

      expect(foods.length).to eq(3)
      expect(foods.first).to have_key(:name)
      expect(foods.first).to have_key(:calories)
      expect(foods.first[:name]).to eq('linguine')
      expect(foods.first[:calories]).to eq(290)
    end
  end
end
