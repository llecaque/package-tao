#feature/login.feature
Feature: Backoffice sessions
        In order to access the platform
    	As a user
    	I need to be able to log into the platform
    	
    	Scenario: LoginBadPassword
    	  		Given I am on "/tao/Main/login"
	            And I should see "Connect to the TAO platform"
	            When I fill in "login" with "admin"
	            And I fill in "password" with "badpassword"
	            And I press "connect"
	            Then I am on "tao/Main/index"
	            And I should see "Access denied. Please renew your authentication!"
	
    	Scenario: Login
    	        Given I am on "/tao/Main/login"
	            And I should see "Connect to the TAO platform"
	            When I fill in "login" with "admin"
	            And I fill in "password" with "admin"
	            And I press "connect"
	            Then I am on "tao/Main/index"
				And I should see "Items"
				And I should see "Tests"
				And I should see "Test-takers"
				And I should see "Groups"
				And I should see "Deliveries"
				And I should see "Results"
				And I should see "Settings"
				And I should see "Users"
				And I should see "admin"
		
		Scenario: Items
				Given I am on "/tao/Main/login"
					And I am logged in backoffice as "admin" with password "admin" 
				When I follow "Create and design items and exercises."
				And I should see "New class"
				And I should see "Delete"
				And I should see "Import"
				And I should see "Export"
				And I should see "Lists"
				And I should see "Duplicate"
				And I should see "New item"
				And I should see "Properties"

		Scenario: Tests
				Given I am on "/tao/Main/login"
					And I am logged in backoffice as "admin" with password "admin" 
				When I follow "Combine a selection of items into tests."
				And I should see "New class"
				And I should see "Delete"
				And I should see "Import"
				And I should see "Export"
				And I should see "Lists"
				And I should see "Duplicate"
				And I should see "New test"
				And I should see "Properties"
				
		Scenario: TestTaker
				Given I am on "/tao/Main/login"
					And I am logged in backoffice as "admin" with password "admin" 
				When I follow "Record and manage test-takers."
				And I should see "New class"
				And I should see "Delete"
				And I should see "Import"
				And I should see "Export"
				And I should see "Lists"
				And I should see "New test-taker"
				And I should see "Properties"
				
		Scenario: Groups
				Given I am on "/tao/Main/login"
					And I am logged in backoffice as "admin" with password "admin" 
				When I follow "Group test takers according to global features and classifications."
				And I should see "New class"
				And I should see "Delete"
				And I should see "Import"
				And I should see "Export"
				And I should see "Lists"
				And I should see "New Group"
				And I should see "Properties"
				
		Scenario: Deliveries
				Given I am on "/tao/Main/login"
					And I am logged in backoffice as "admin" with password "admin" 
				When I follow "Prepare, publish deliveries sessions."
				And I should see "New class"
				And I should see "Delete"
				And I should see "New Delivery"
				And I should see "Properties"

		Scenario: Results
				Given I am on "/tao/Main/login"
					And I am logged in backoffice as "admin" with password "admin" 
				When I follow "View and format the collected results."
				And I should see "Export Table"

		Scenario: Users
		  		Given I am on "/tao/Main/login"
					And I am logged in backoffice as "admin" with password "admin" 
				When I follow "Users"
				And I should see "Manage users"
				And I should see "Edit a user"
				And I should see "Manage roles"
				And I should see "Manage Access Rights"
				 
