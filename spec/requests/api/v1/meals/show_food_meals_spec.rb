require 'rails_helper'

describe 'a user visits meal foods index' do
  context 'get /api/v1/meals/:meal_id/foods' do
    it 'displays all foods associated with that meal' do
      food_1 = create(:food)
      food_2 = create(:food_2)
      food_3 = create(:food_3)
      meal_1 = Meal.create(name: 'Second Breakfast')
      meal_1.food_meals.create(food_id: 1)
      meal_1.food_meals.create(food_id: 2)
      meal_1.food_meals.create(food_id: 3)

      get "/api/v1/meals/#{meal_1.id}/foods"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      meal = JSON.parse(response.body, symbolize_names: true)

      expect(meal[:foods].length).to eq(3)
      expect(meal[:foods].first).to have_key(:name)
      expect(meal[:foods].first).to have_key(:calories)
      expect(meal[:foods].first[:name]).to eq('linguine')
      expect(meal[:foods].first[:calories]).to eq(290)
    end
    it 'returns an error if meal does not exist' do
      number = 90

      get "/api/v1/meals/#{number}/foods"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
