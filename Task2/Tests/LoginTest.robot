*** Settings ***
Documentation    To login into the website
Library    SeleniumLibrary
Library    DataDriver    file=../Task2/Utilities/LoginDetails.csv    encoding=utf_8    dialect=unix
Test Setup    Open the url with the browser
Test Teardown    Close Browser Sessions
Resource    ../Resources/GenericResource.robot
# Resource    ../Resources/LoginPage.robot
Resource    ../Resources/DashboardPage.robot
Test Template    Validate the login funcionality

*** Variables ***
${username}    
${password}

*** Test Cases ***
login using csv data
    ${username}    ${password}

*** Keywords ***
Validate the login funcionality 
    [Tags]    Regression    UAT
    [Arguments]    ${username}    ${password}
    LoginPage.Login to the website with login credentials    ${username}    ${password}
    IF    '${username}' in ['locked_out_user']
        Element Text Should Be    ${error}    Epic sadface: Sorry, this user has been locked out.
    ELSE
        DashboardPage.Verify the logged in or not
    END