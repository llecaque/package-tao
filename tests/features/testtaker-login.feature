#feature/testtaker-login.feature
Feature: TestTaker sessions
        In order to access the platform
    	As a user
    	I need to be able to log into the platform
	
    	Scenario: Login
    	        Given I am on "/tao/Main/login"
	            And I should see "Connect to the TAO platform"
	            When I fill in "login" with "s1"
	            And I fill in "password" with "1234"
	            And I press "connect"
	            Then I am on "/taoDelivery/DeliveryServer/index"
	            And I should see "My Tests"
	            And I should see "Available"
	            And I should see "Delivery of QTI Example Test"
	            And I should see "Logout"
	            When I follow "Start"
	            Then I am on "/taoDelivery/DeliveryServer/runDeliveryExecution"
	            And I should see "section"