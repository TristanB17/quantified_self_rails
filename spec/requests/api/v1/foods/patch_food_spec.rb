require 'rails_helper'

describe 'a user edits a food' do
  context 'patch /api/v1/foods/:id' do
    it 'updates a food' do
      food_1 = create(:food)
      new_food_attribute = { 'food': { 'name': 'minestrone' } }

      patch "/api/v1/foods/#{food_1.id}", params: new_food_attribute

      expect(response).to be_successful
      expect(response.status).to eq(200)
      updated_food = JSON.parse(response.body, symbolize_names: true)

      expect(updated_food[:name]).to eq('minestrone')
      expect(updated_food[:calories]).to eq(290)
    end
    it 'returns a 400 if food update is invalid' do
      no_good_food = { 'food': { 'name': 'spaghett', 'calories': '9001' } }

      patch "/api/v1/foods/90", params: no_good_food

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.message).to eq('Bad Request')
    end
  end
end
