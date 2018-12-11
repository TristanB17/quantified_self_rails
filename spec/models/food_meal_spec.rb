require 'rails_helper'

describe FoodMeal, type: :model do
  context 'relationships' do
    it { should belong_to(:food) }
    it { should belong_to(:meal) }
  end
end
