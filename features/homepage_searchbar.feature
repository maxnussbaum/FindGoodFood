Feature: test functionality of the search bar on the homepage
 
    As a user
    so that I can find good food
    I want to be able to search for food

Background:

  Given I am on the FindGoodFood home page
  
Scenario: Search by Restaurant
  When I fill in "search_bar" with "Nirchi's"
  And I select "Restaurant" from "search_type"
  When I press "Submit"
  Then I should be on the restaurant results page
  Then I should see "Restaurant Results for 'Nirchi's'"
  
Scenario: Search by Food
  When I fill in "search_bar" with "pizza"
  And I select "Food" from "search_type"
  When I press "Submit"
  Then I should be on the food results page
  Then I should see "Food Results for 'pizza'"

Scenario: Search with an empty input
  When I fill in "search_bar" with ""
  When I press "Submit"
  Then I should be on the FindGoodFood home page
