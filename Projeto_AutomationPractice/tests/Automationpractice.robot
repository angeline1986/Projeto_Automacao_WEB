*** Settings ***
Resource         ../resources/ResourceSearch.robot
Resource         ../resources/ResourceRegister.robot
Suite Teardown   Close Browser

*** Test Case ***
Scenario 01: Search Existing Product
    Given that I am in the home of the site
    When I search for the product "Blouse"
	  Then the product "Blouse" should be displayed in the search

Scenario 02: Search for Nonexistent Product
    Given that I am in the home of the site
    When I search for the product "impressora"
    Then the page should display the message "No results were found for your search "impressora""

Scenario 03: Register Customer
    Given that I want to get an email, access disposable email site
    When I have an email, I start registering at the online store
	  Then I fill in the registration form
    And I'm automatically redirected to my account




*** Keywords ***
# *** Cenario 01 e 02 ***
Given that I am in the home of the site
    Go to site home

When I search for the product "${PRODUTO}"
     Inform product "${PRODUTO}" in site search
     Trigger Search

Then the product "${PRODUTO}" should be displayed in the search
     Validate if "${PRODUTO}" was listed

Then the page should display the message "${MENSAGEM_ALERTA}"
     Validate Error Message "${MENSAGEM_ALERTA}"


# *** Cenario 03 ***
Given that I want to get an email, access disposable email site
    Access the disposable email site

When I have an email, I start registering at the online store
     Start registration

Then I fill in the registration form
     Fill in registration form

And I'm automatically redirected to my account
     Manage account data
     Check Success Message
