# Quantified Self - Rails

* The goal of this project was to build a backend API able to reach various endpoints and conduct some minor analysis. 

* The Travis CI is used to ensure all unit tests pass prior to merging a branch to master.

* Link to Heroku: https://quantified-self-1804-tristan.herokuapp.com/api/v1/foods

* Instructions for Local Setup
  - run the following commands in the folder you wish to house the project in <br/>
```git clone https://github.com/TristanB17/quantified_self_rails.git```<br/>
  -  clones down the repository to your local machine<br/>
```bundle```<br/>
  - ensures full gem functionality<br/>
```rake db:{create,migrate,seed}```<br/>
  - fills database with seed data<br/>

* Testing 

  - all tests can be run by typing the command below, assuming the previous commands required for intitial setup have all been completed without error. <br/>
  ```rspec```<br/>
  
* Travis CI 
[![Build Status](https://travis-ci.com/TristanB17/quantified_self_rails.svg?branch=master)](https://travis-ci.com/TristanB17/quantified_self_rails)

* Primary Endpoints

  
  
