*** Settings ***
Documentation    To login into the website
Library    SeleniumLibrary
Test Setup    Open the url with the browser
Test Teardown    Close Browser Sessions
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/DashboardPage.robot


*** Test Cases ***
add the product
    [Tags]    Regression    UAT
    Add the product to the cart

*** Keywords ***

Add the product to the cart

    GenericResource.Login with login credentials
    DashboardPage.Verify the logged in or not
    Page Should Contain    Products
    DashboardPage.Add product to the cart