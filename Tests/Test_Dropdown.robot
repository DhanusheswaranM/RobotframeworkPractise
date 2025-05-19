*** Settings ***
Library    SeleniumLibrary
Documentation    This is to verify the Dropdown

*** Test Cases ***
Select options in dropdown
    open with the browser url
    Select the dropdown option APIs by value
    Select the dropdown option Microsoft by index
    Select the dropdown option CSS by label
    Dropdown length

*** Keywords ***
open with the browser url
    Open Browser    https://demo.automationtesting.in/Register.html    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5

Select the dropdown option APIs by value
    Select From List By Value    id=Skills    APIs

Select the dropdown option Microsoft by index
    Select From List By Index    id=Skills    43
    
Select the dropdown option CSS by label
    Select From List By Label    id=Skills    CSS

Dropdown length
     ${length}=    Get Length    id=Skills
    Log To Console    Dropdown options count: ${length}