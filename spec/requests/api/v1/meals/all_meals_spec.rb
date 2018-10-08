require 'rails_helper'

describe 'a user sees all meals' do
  context 'get /api/v1/meals' do
    it 'creates a food associated with that meal' do
      food_1 = create(:food)
      food_2 = create(:food_2)
      food_3 = create(:food_3)
      food_4 = create(:food_4)
      meal_1 = Meal.create(name: 'Second Breakfast')
      meal_2 = Meal.create(name: 'Linner')
      meal_3 = Meal.create(name: 'Brunch')
      meal_4 = Meal.create(name: 'Midnight Snack')
      meal_1.food_meals.create(food_id: 1)
      meal_2.food_meals.create(food_id: 1)
      meal_1.food_meals.create(food_id: 2)
      meal_2.food_meals.create(food_id: 2)
      meal_3.food_meals.create(food_id: 2)
      meal_4.food_meals.create(food_id: 2)
      meal_3.food_meals.create(food_id: 3)
      meal_4.food_meals.create(food_id: 3)
      meal_4.food_meals.create(food_id: 4)

      get "/api/v1/meals"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      meals = JSON.parse(response.body, symbolize_names: true)

      expect(meals.length).to eq(4)
    end
  end
end
