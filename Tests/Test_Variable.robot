*** Settings ***
Library    SeleniumLibrary
Library    Collections
Test Teardown    Close Browser

*** Variables ***
${username}    Admin
${password}    admin123
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
&{visibleElement}    Forgot your password?=xpath://p[@class='oxd-text oxd-text--p orangehrm-login-forgot-header']
${dashboardText}    xpath://h6[text()='Dashboard']

*** Test Cases ***

Validate Elements in Login page
    open the browser with url
    Verify Element on login page

Validate Successful Login
    open the browser with url
    Fill the login form
    Verify dashboard page opens
    Verify item in dashboard page

*** Keywords ***
open the browser with url
    Open Browser    ${url}    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5

Verify Element on login page
    Element Should Be Visible    ${visibleElement}[Forgot your password?]

Fill the login form
    Input Text    css:input[name=username]    ${username}
    Input Password    css:input[name=password]    ${password}
    Click Button    css:.orangehrm-login-button

Verify dashboard page opens
    Element Text Should Be    ${dashboardText}    Dashboard

Verify item in dashboard page
    @{expect_list} =    Create List    Admin    PIM    Leave    Time    Recruitment    My Info    Performance    Dashboard    Directory    Maintenance    Claim    Buzz
    ${elements} =    Get WebElements    css:.oxd-main-menu-item--name
    @{actual_list} =    Create List
    FOR    ${element}    IN    @{elements}
        LOG    ${element.text}
        Append To List    ${actual_list}    ${element.text}
    END

    Lists Should Be Equal    ${expect_list}    ${actual_list}