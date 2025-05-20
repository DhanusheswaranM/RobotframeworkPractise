*** Settings ***
Documentation    This is to verify the filter options 
Library    SeleniumLibrary
Test Setup    Open the url with the browser
Test Teardown    Close Browser Sessions
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/DashboardPage.robot
Test Template    Check the filters options

*** Test Cases ***                    options
All Items                             All Items
About                                 About
Logout                                Logout
Reset the App                         Reset App State

*** Keywords ***
Check the filters options
    [Arguments]    ${options}
    GenericResource.Login with login credentials
    DashboardPage.Verify the logged in or not
    DashboardPage.Menu options functionality    ${options}
