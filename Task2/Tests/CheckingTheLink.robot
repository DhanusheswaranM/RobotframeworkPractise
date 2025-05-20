*** Settings ***
Documentation    This is to check the links are broken or not
Library    SeleniumLibrary
Test Setup    Open the url with the browser
Test Teardown    Close Browser Sessions
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/DashboardPage.robot

*** Test Cases ***
Verify the link by the status code
    [Tags]    Regression
    Check the links

*** Keywords ***
Check the links
    GenericResource.Login with login credentials
    DashboardPage.Verify the logged in or not
    DashboardPage.Checking the links
