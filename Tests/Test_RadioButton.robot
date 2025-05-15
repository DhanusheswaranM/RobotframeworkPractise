*** Settings ***
Library    SeleniumLibrary
Documentation    This is to verify the radio button

*** Test Cases ***
Entering into the page
    open with the browser url
    Sleep    3s
    Select impressive option from 3 radio buttons
    Sleep    3s
    Verify that the radio button is selected
    Sleep    3s
    Select the check box for cricket, Hockey and Movies
    Sleep    3s
    unselect the hockey check box
    Sleep    3s
    verify the hockey checkbox is not selected 

*** Keywords ***
open with the browser url
    Open Browser    https://demo.automationtesting.in/Register.html    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5

Select impressive option from 3 radio buttons
    Page Should Contain Radio Button    name:radiooptions
    Page Should Not Contain Radio Button    id:checkbox1
    Select Radio Button    radiooptions    Male

Verify that the radio button is selected
    Radio Button Should Be Set To    radiooptions    Male

Select the check box for cricket, Hockey and Movies
    Click Element    id=checkbox1
    Click Element    id=checkbox2
    Click Element    id=checkbox3

unselect the hockey check box
    Unselect Checkbox    id=checkbox3

verify the hockey checkbox is not selected 
    Checkbox Should Not Be Selected    id=checkbox3