*** Settings ***
Documentation    Test Template 
Library    SeleniumLibrary
Library    DataDriver    file=D:\\RobotframeworkPractise\\DataDrivenProject\\Resources\LoginData_Excel.xlsx    sheet_name=Sheet1    
Test Template    Validate UnSuccessful Login

*** Variables ***
${login_error_message}    css:.oxd-alert-content--error
${Username}    
${Password}    

*** Test Cases ***                
Login to from using    ${Username}    ${Password}

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]    ${Username}    ${Password}
    Open the Browser with url
    Fill the login form    ${Username}    ${Password}
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