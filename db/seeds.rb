meal_1 = Meal.create(name: 'Second Breakfast')
meal_2 = Meal.create(name: 'Linner')
meal_3 = Meal.create(name: 'Midnight Snack')
meal_4 = Meal.create(name: 'Preworkout')
meal_5 = Meal.create(name: 'Cookie Party')

food_1  = Food.create(name: 'Pancakes', calories: 670)
food_2  = Food.create(name: 'Waffels', calories: 4)
food_3  = Food.create(name: 'French Toast', calories: 650)
food_4  = Food.create(name: 'Oatmeal', calories: 230)
food_5  = Food.create(name: 'Special K Red Berry with Almond Milk', calories: 130)
food_6  = Food.create(name: 'A Granola Bar I found', calories: 20)
food_8  = Food.create(name: 'Croissant', calories: 540)
food_7  = Food.create(name: 'Braised Leeks with Mozzarella and a Fried Egg', calories: 340)
food_8  = Food.create(name: 'Smoked Pork Jowl with Pickles', calories: 400)
food_9  = Food.create(name: 'Eggs on Toast', calories: 490)
food_10 = Food.create(name: "Francis Ford Coppola's 'Apocalypse Now'", calories: 30)
food_11 = Food.create(name: "Pho", calories: 580)
food_12 = Food.create(name: 'Vanilla Frozen Yogurt with Rasberries', calories: 670)
food_13 = Food.create(name: 'Chicken Noodle Soup', calories: 230)
food_14 = Food.create(name: 'A Soda on the Side', calories: 190)
food_15 = Food.create(name: 'Chocolate Chip Cookie', calories: 180)
food_16 = Food.create(name: 'Sugar Cookie', calories: 180)
food_17 = Food.create(name: 'Snickerdoodle Cookie', calories: 180)
food_18 = Food.create(name: 'Oatmeal Raisin Cookie', calories: 180)
food_19 = Food.create(name: 'Digestive Biscuit', calories: 180)
food_20 = Food.create(name: 'Biscotti', calories: 180)

FoodMeal.create(meal_id: meal_1.id, food_id: food_1.id)
FoodMeal.create(meal_id: meal_1.id, food_id: food_2.id)
FoodMeal.create(meal_id: meal_1.id, food_id: food_3.id)
FoodMeal.create(meal_id: meal_1.id, food_id: food_4.id)
FoodMeal.create(meal_id: meal_1.id, food_id: food_5.id)
FoodMeal.create(meal_id: meal_1.id, food_id: food_6.id)
FoodMeal.create(meal_id: meal_1.id, food_id: food_7.id)
FoodMeal.create(meal_id: meal_1.id, food_id: food_20.id)
FoodMeal.create(meal_id: meal_1.id, food_id: food_11.id)

FoodMeal.create(meal_id: meal_2.id, food_id: food_4.id)
FoodMeal.create(meal_id: meal_2.id, food_id: food_5.id)
FoodMeal.create(meal_id: meal_2.id, food_id: food_6.id)
FoodMeal.create(meal_id: meal_2.id, food_id: food_7.id)
FoodMeal.create(meal_id: meal_2.id, food_id: food_8.id)
FoodMeal.create(meal_id: meal_2.id, food_id: food_20.id)
FoodMeal.create(meal_id: meal_2.id, food_id: food_1.id)

FoodMeal.create(meal_id: meal_3.id, food_id: food_8.id)
FoodMeal.create(meal_id: meal_3.id, food_id: food_10.id)
FoodMeal.create(meal_id: meal_3.id, food_id: food_11.id)
FoodMeal.create(meal_id: meal_3.id, food_id: food_12.id)
FoodMeal.create(meal_id: meal_3.id, food_id: food_20.id)

FoodMeal.create(meal_id: meal_4.id, food_id: food_12.id)
FoodMeal.create(meal_id: meal_4.id, food_id: food_13.id)
FoodMeal.create(meal_id: meal_4.id, food_id: food_14.id)
FoodMeal.create(meal_id: meal_4.id, food_id: food_6.id)

FoodMeal.create(meal_id: meal_5.id, food_id: food_15.id)
FoodMeal.create(meal_id: meal_5.id, food_id: food_16.id)
FoodMeal.create(meal_id: meal_5.id, food_id: food_17.id)
FoodMeal.create(meal_id: meal_5.id, food_id: food_18.id)
FoodMeal.create(meal_id: meal_5.id, food_id: food_19.id)
FoodMeal.create(meal_id: meal_5.id, food_id: food_20.id)
FoodMeal.create(meal_id: meal_5.id, food_id: food_6.id)
FoodMeal.create(meal_id: meal_5.id, food_id: food_1.id)
