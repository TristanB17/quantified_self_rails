# Quantified Self - Rails
[![Build Status](https://travis-ci.com/TristanB17/quantified_self_rails.svg?branch=master)](https://travis-ci.com/TristanB17/quantified_self_rails)
[![Coverage Status](https://coveralls.io/repos/github/TristanB17/quantified_self_rails/badge.svg?branch=master)](https://coveralls.io/github/TristanB17/quantified_self_rails?branch=master)

* Quantified Self a backend API able to track foods and their corresponding intake and conduct some minor analysis. 

* The Travis CI is used to ensure all unit tests pass prior to merging a branch to master.

* Link to Heroku: https://quantified-self-1804-tristan.herokuapp.com/api/v1/foods

## Instructions for Local Setup
  * Find the folder you wish to house the repo in, and clone it down <br/>
```
git clone https://github.com/TristanB17/quantified_self_rails.git
```
  * Then install all gems 
```
bundle
```
  * Seed the database with the following command<br/>
```
rake db:{create,migrate,seed}
```
  * You can now check your localhost to ensure app funtionality by entering 
 ```
rails server
```

## Testing 

  - all tests can be run by typing the command below, assuming the previous commands required for intitial setup have all been completed without error. <br/>
  ```
  bundle exec rspec
  ```

## Important Endpoints

#### Foods

* GET /api/v1/foods
  * Returns all foods currently in the database
```
 {
 "id": 1,
 "name": "Banana",
 "calories": 150
 },
```
 </br>
* GET /api/v1/foods/:id 
  * Returns the food object with the specific :id you’ve passed in or 404 if the food is not found
 </br>
* POST /api/v1/foods 
  * Allows creating a new food with the parameters: 
 ```
 { "food": { "name": "Name of food here", "calories": "Calories here"} }
 ```
  * If food is successfully created, the food item will be returned. If the food is not successfully created, a 400 status code will be returned. Both name and calories are required fields. 
 </br>
* PATCH /api/v1/foods/:id
  * Allows one to update an existing food with the parameters:
```
{ "food": { "name": "Mint", "calories": "14"} }
```
  * If food is successfully updated (name and calories are required fields), the food item will be returned. If the food is not successfully updated, a 400 status code will be returned.
</br>
* DELETE /api/v1/foods/:id
  * Will delete the food with the id passed in and return a 204 status code. If the food can’t be found, a 404 will be returned.
</br>

#### Meals

* GET /api/v1/meals
  * Returns all the meals in the database along with their associated foods
  * If successful, this request will return a response in the following format:
```
[
    {
        "id": 1,
        "name": "Breakfast",
        "foods": [
            {
                "id": 1,
                "name": "Banana",
                "calories": 150
            }
        ]
    },
    {
        "id": 2,
        "name": "Snack",
        "foods": [
            {
                "id": 1,
                "name": "Banana",
                "calories": 150
            },
            {
                "id": 9,
                "name": "Gum",
                "calories": 50
            }
        ]
    },
    {
        "id": 3,
        "name": "Lunch",
        "foods": [
            {
                "id": 2,
                "name": "Bagel Bites - Four Cheese",
                "calories": 650
            },
            {
                "id": 3,
                "name": "Chicken Burrito",
                "calories": 800
            },
            {
                "id": 12,
                "name": "Apple",
                "calories": 220
            }
        ]
    },
    {
        "id": 4,
        "name": "Dinner",
        "foods": [
            {
                "id": 1,
                "name": "Banana",
                "calories": 150
            }
        ]
    }
]
```
</br> 
* GET /api/v1/meals/:meal_id/foods
  * Returns all the foods associated with the meal with an id specified by :meal_id or a 404 if the meal is not found
  * If successful, this request will return a response in the following format:
```
{
    "id": 1,
    "name": "Breakfast",
    "foods": [
        {
            "id": 1,
            "name": "Banana",
            "calories": 150
        },
        {
            "id": 6,
            "name": "Yogurt",
            "calories": 550
        },
        {
            "id": 12,
            "name": "Apple",
            "calories": 220
        }
    ]
}
```
</br>
* POST /api/v1/meals/:meal_id/foods/:id
  * Adds the food with :id to the meal with :meal_id
  * This creates a new record in the MealFoods table to establish the relationship between this food and meal. 
  * If the meal/food cannot be found, a 404 will be returned.
  * If successful, this request will return a status code of 201 with the following body:
```
{
    "message": "Successfully added FOODNAME to MEALNAME"
}
```
</br>
* DELETE /api/v1/meals/:meal_id/foods/:id
  * Removes the food with :id from the meal with :meal_id
  * This deletes the existing record in the MealFoods table that creates the relationship between this food and meal.
  * If the meal/food cannot be found, a 404 will be returned.
  * If successful, this request will return:
```
{
    "message": "Successfully removed FOODNAME to MEALNAME"
}
```
</br>
#### Favorite Foods
* GET /api/v1/favorite_foods
  * Retrieves data on the foods which were eaten most frequently. 
  * If successful, this request will return the following:
```
[
  {
    "timesEaten": 4,
    "foods":
      [
        {
          "name": "Banana",
          "calories": 200,
          "mealsWhenEaten": ["Breakfast", "Dinner"]
        },
  },
  "timesEaten": 3,
  "foods":
    [
      {
        "name": "Strawberries",
        "calories": 200,
        "mealsWhenEaten": ["Breakfast", "Lunch", "Dinner"]
      },
      {
        "name": "Almonds"
        "calories": 800,
        "mealsWhenEaten": ["Snacks"]
      }
    ]
    ]
  }
]
```
