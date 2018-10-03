require 'rails_helper'

describe 'a user adds a food to a meal' do
  context 'post /api/v1/meals/:meal_id/foods/:id' do
    it 'creates a food associated with that meal' do
      food_1 = create(:food)
      meal_1 = Meal.create(name: 'Second Breakfast')
      meal_1.food_meals.create(food_id: 1)
      food_4 = create(:food_4)

      post "/api/v1/meals/#{meal_1.id}/foods/#{food_4.id}"

      expect(response).to be_successful
      expect(response.status).to eq(201)
      meal = JSON.parse(response.body, symbolize_names: true)

      expect(meal[:message]).to eq("Successfully added #{food_4.name} to #{meal_1.name}")
    end
    it 'rejects request if meal or food does not exist' do
      food_1 = create(:food)
      number = 4

      post "/api/v1/meals/#{number}/foods/#{food_1.id}"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
