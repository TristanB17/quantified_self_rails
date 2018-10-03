require 'rails_helper'

describe 'a user deletes a food from a meal' do
  context 'delete /api/v1/meals/:meal_id/foods/:id' do
    it 'deletes that food associated from that meal' do
      food_1 = create(:food)
      food_2 = create(:food_2)
      food_3 = create(:food_3)
      meal_1 = Meal.create(name: 'Second Breakfast')
      meal_1.food_meals.create(food_id: 1)
      meal_1.food_meals.create(food_id: 2)
      meal_1.food_meals.create(food_id: 3)

      delete "/api/v1/meals/#{meal_1.id}/foods/#{food_2.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(meal_1.foods.length).to eq(2)

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:message]).to eq("Successfully removed #{food_2.name} from #{meal_1.name}")
    end
    it 'returns an error if meal or food does not exist' do
      number_1 = 90
      number_2 = 40

      delete "/api/v1/meals/#{number_1}/foods/#{number_2}"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
