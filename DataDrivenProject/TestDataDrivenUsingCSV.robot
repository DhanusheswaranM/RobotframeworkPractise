*** Settings ***
Documentation    Test Template 
Library    SeleniumLibrary
Library    DataDriver    file=../DataDrivenProject/Resources/LoginData.csv    encoding=utf_8    dialect=unix
Test Template    Validate UnSuccessful Login

*** Variables ***
${login_error_message}    css:.oxd-alert-content--error
${Username}    abc
${Password}    123

*** Test Cases ***                
Login to from using    ${username}    ${password}

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]    ${username}    ${password}
    Open the Browser with url
    Fill the login form    ${username}    ${password}
    Verify the error message is correct
    Close Browser Session

Open the Browser with url
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    browser=Chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name="username"]    ${username}
    Input Text    css:input[name="password"]    ${password}
    Click Button    css:button[type="submit"]

Verify the error message is correct
    Element Text Should Be    ${login_error_message}    Invalid credentials

Close Browser Session
    Close All Browsers