# Quantified Self - Rails
[![Build Status](https://travis-ci.com/TristanB17/quantified_self_rails.svg?branch=master)](https://travis-ci.com/TristanB17/quantified_self_rails)
[![Coverage Status](https://coveralls.io/repos/github/TristanB17/quantified_self_rails/badge.svg?branch=master)](https://coveralls.io/github/TristanB17/quantified_self_rails?branch=master)

* Quantified Self a backend API able to track foods and their corresponding intake and conduct some minor analysis. 

* The Travis CI is used to ensure all unit tests pass prior to merging a branch to master.

* Link to Heroku: https://quantified-self-1804-tristan.herokuapp.com/api/v1/foods

* Instructions for Local Setup
  - run the following commands in the folder you wish to house the project in <br/>
```
git clone https://github.com/TristanB17/quantified_self_rails.git
```
  -  clones down the repository to your local machine<br/>
```
bundle
```
  - ensures full gem functionality
```
rake db:{create,migrate,seed}
```
  - fills database with seed data<br/>

* Testing 

  - all tests can be run by typing the command below, assuming the previous commands required for intitial setup have all been completed without error. <br/>
  ```
  rspec
  ```
  
* Travis CI 

* Primary Endpoints

  
  
