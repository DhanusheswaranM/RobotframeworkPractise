*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Test Cases ***
To verify the alert
    Open the browser with url
    Select the simple alert
    Select the confirmation alert
    Select the prompt alert

*** Keywords ***
Open the browser with url
    Open Browser    https://demo.automationtesting.in/Alerts.html    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5s


Select the simple alert
    Click Element    xpath=//div[@class='tabpane pullleft']/ul/li[1]/a
    Click Button    css:.btn.btn-danger
    Sleep    5s
    Alert Should Be Present    I am an alert box!    action=Accept
    
Select the confirmation alert
    Click Element    xpath=//div[@class='tabpane pullleft']/ul/li[2]/a
    Click Button    css:.btn.btn-primary
    Sleep    5s
    Alert Should Be Present    Press a Button !    action=DISMISS
    # Handle Alert    

Select the prompt alert
    Click Element    xpath=//div[@class='tabpane pullleft']/ul/li[3]/a
    Click Button    css:.btn.btn-info
    Sleep    5s
    # ${alert_text}=    Handle Alert
    # Log To Console    ${alert_text}
    # Alert Should Be Present    Please enter your name
    Input Text Into Alert    text= hi welcome
    Sleep    5s
    Page Should Contain    hi welcome