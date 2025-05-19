*** Settings ***
Documentation    To verify the login functionality for sauce demo website
Library     SeleniumLibrary
# Library    DataDriver    file=D:\\RobotframeworkPractise\\Task1\\Resources\\LoginDatas.csv    encoding=utf_8    dialect=unix
Library    DataDriver    file=D:\\RobotframeworkPractise\\Task1\\Resources\\LoginDataUsingExcel.xlsx    sheet_name=Sheet1
Test Template    To Validate Successful Login

*** Variables ***
${username}
${password}
${product_text}    xpath://div[@class='product_label']
${error_msg}    xpath://div[@class='login-box']/form/h3

*** Test Cases ***
Login to the website    ${username}    ${password}

*** Keywords ***
To Validate Successful Login
    [Arguments]    ${username}    ${password}
    Open The Browser with url
    Fill the Login Credentials    ${username}    ${password}
    Verify the login successful
    Close Browser Session


Open The Browser with url
    Open Browser    https://www.saucedemo.com/v1/index.html    browser=Firefox
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

Fill the Login Credentials
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name="user-name"]    ${username}
    Input Password    css:input[id="password"]    ${password}
    Click Element    css:input[type="submit"]

Verify the login successful
    IF    '${username}' in ['standard_user', 'problem_user', 'performance_glitch_user']
        Element Text Should Be    ${product_text}    Products
    IF    '${username}' in ['locked_out_user']
        Element Text Should Be    ${error_msg}    Epic sadface: Sorry, this user has been locked out.
    END
      
    END

 Close Browser Session
     Close All Browsers 