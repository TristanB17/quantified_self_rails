require 'rails_helper'

describe 'a user visits their favorite foods' do
  context 'post /api/v1/favorite_foods' do
    it 'sees top three eaten foods' do
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

      get "/api/v1/favorite_foods"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      new_food = JSON.parse(response.body, symbolize_names: true)
      first_food = new_food.first[:food].first
    
      expect(first_food[:name]).to eq('fettuccine')
      expect(first_food[:calories]).to eq(450)
      expect(first_food[:mealsWhenEaten].count).to eq(4)
      expect(first_food[:mealsWhenEaten].first).to eq('Second Breakfast')
    end
  end
end
