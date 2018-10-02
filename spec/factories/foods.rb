FactoryBot.define do
  factory :food do
    name { 'linguine' }
    calories { 290 }

    factory :food_2 do
      name { 'fettuccine' }
      calories { 450 }

      factory :food_3 do
        name { 'spaghett' }
        calories { 530 }

        factory :food_4 do
          name { 'tortellini' }
          calories { 470 }

        end
      end
    end
  end
end
