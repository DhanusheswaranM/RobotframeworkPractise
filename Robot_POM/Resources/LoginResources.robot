*** Settings ***
Documentation    The Login Page elements are in this file
Library    SeleniumLibrary

*** Variables ***
${login_error_message}    css:.oxd-alert-content--error
${dashboard_title}    css:.oxd-topbar-header-breadcrumb-module
${missing_username_error_message}    xpath://form[@class='oxd-form']/div[1]/div/span
${missing_password_error_message}    xpath://form[@class='oxd-form']/div[2]/div/span
${err}    css:.oxd-alert-content-text
${forgot_password_link}    xpath://div[@class='orangehrm-login-forgot']/p

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name="username"]    ${username}
    Input Text    css:input[name="password"]    ${password}
    Click Button    css:button[type="submit"]

verify the error message is correct
    Element Text Should Be    ${login_error_message}    Invalid credentials

verify the error message is displayed for username
    Element Text Should Be    ${missing_username_error_message}    Required

verify the error message is displayed for password
    Element Text Should Be    ${missing_password_error_message}    Required

Go to forgot your password page
    Click Element    ${forgot_password_link}