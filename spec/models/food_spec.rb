require 'rails_helper'

describe Food, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:calories) }
  end
  context 'relationships' do
    it { should have_many(:food_meals) }
    it { should have_many(:meals).through(:food_meals) }
  end
  context 'class methods' do
    it 'can return the top three favorite foods by quantity' do
      create(:food)
      create(:food_2)
      create(:food_3)
      create(:food_4)
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

      favorites = Food.get_favorites

      expect(favorites.length).to eq(4)
      expect(favorites.first.name).to eq('fettuccine')
      expect(favorites[0].times_eaten).to eq(4)
    end
  end
end
