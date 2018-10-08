class Food < ApplicationRecord
  validates_presence_of :name, :calories

  has_many :food_meals
  has_many :meals, through: :food_meals

  def self.sort_favorites
    Food.group_favorites.sort_by { |food| food }.reverse.take(3)
  end

  def self.group_favorites
    Food.get_favorites.group_by { |food| food.times_eaten }.except!(1)
  end

  def self.get_favorites
    select('foods.*, count(food_meals.food_id) AS times_eaten')
    .joins(:food_meals)
    .group('id', 'food_meals.food_id')
    .order('times_eaten DESC')
  end
end
