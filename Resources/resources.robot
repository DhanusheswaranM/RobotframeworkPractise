*** Settings ***
Documentation    A resource file with reusable keywords and variables...
Library    SeleniumLibrary


*** Variables ***
${valid_username}    Admin
${valid_password}    admin123
${invalid_username}    123244
${invalid_password}    123454
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***

Open the Browser with url
    Create Webdriver    Chrome
    Go To    ${url}
    Maximize Browser Window
    Set Browser Implicit Wait    5s

Close Browser Session
    Close Browser