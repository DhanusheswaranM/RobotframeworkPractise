*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument=--start-maximized
...           add_argument=--disable-infobars
...           add_argument=--lang=en-In
...           add_argument=--disable-biink-features=AutomationControlled
...           exclude
*** Test Cases ***
Searching on the google for robotframework
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --user-data-dir\="C:\\Users\\Dhanusheswaran M\\AppData\\Local\\Google\\Chrome\\User Data"
    Call Method    ${chrome_options}    add_argument    --profile-directory\=Default
    Open Browser    https://www.google.co.in/    chrome    options=${chrome_options}
    Maximize Browser Window
    Sleep    2s
    Input Text    APjFqb    robotframework
    Sleep    2s
    Press Key    btnK    \\13    
    Wait Until Page Contains    robotframework.org
    Page Should Contain    robotframework.org
    Close Browser