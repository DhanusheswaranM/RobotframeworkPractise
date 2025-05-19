*** Settings ***
Documentation    Tests to login to login page
Library    SeleniumLibrary
Resource    resources.robot

*** Variables ***
${login_error_message}    css:.oxd-alert-content--error
${Dashboard_Text}    css:.oxd-topbar-header-breadcrumb-module

*** Test Cases ***

Validate Unsuccessful login
    [Tags]    Smoke    Regression
    Open the Browser with url
    Fill the login form    ${invalid_username}    ${invalid_password}
    verify error message is correct
    Close Browser Session

Validate successful login
    [Tags]    UIT
    Open the Browser with url
    Fill the login form    ${valid_username}    ${valid_password}
    Verify Dashboard page opens
    Close Browser Session

*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name=username]    ${username}
    Input Password    css:input[name=password]    ${password}
    Click Button    css:.orangehrm-login-button

verify error message is correct
    Element Text Should Be    ${login_error_message}    Invalid credentials

Verify Dashboard page opens
    Element Text Should Be    ${Dashboard_Text}    Dashboard