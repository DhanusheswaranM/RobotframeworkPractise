*** Settings ***
Documentation    Tests to login to login page
Library    SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    Close Browser Session
Resource    ../Resources/DashboardResources.robot
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot

*** Test Cases ***
Validate Unsuccessful Login using invalid credentials
    [Tags]    Smoke    Regression    UAT
    LoginResources.Fill the login form    ${valid_username}    ${invalid_password}
    LoginResources.verify the error message is correct

Validate Unsuccessful Login for blank username
    [Tags]    Regression
    LoginResources.Fill the login form    ${blank_username}    ${valid_password}
    LoginResources.verify the error message is displayed for username

Validate Unsuccessful Login for blank password
    [Tags]    Smoke    UAT
    LoginResources.Fill the login form    ${valid_username}    ${blank_password}
    LoginResources.verify the error message is displayed for password

Validate Successful Login for valid credentials
    [Tags]    Smoke    UAT
    LoginResources.Fill the login form    ${valid_username}    ${valid_password}
    DashboardResources.Verify Dashboard page opens