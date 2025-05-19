*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${browser_name}    Chrome

*** Test Cases ***
Drag and drop test case
    Open the browser with url
    Verify element text before drag
    Drag the element and drop
    Verify element Text after drag


*** Keywords ***
Open the browser with url
    Create Webdriver    ${browser_name}

    Go To    https://demoqa.com/droppable
    Maximize Browser Window
    Set Browser Implicit Wait    5s

Verify element text before drag
    Element Text Should Be    id:droppable    Drop here    timeout=5

Drag the element and drop
    Drag And Drop    id:draggable    id:droppable

Verify element Text after drag
    Element Text Should Be    id:droppable    Dropped!    timeout=5