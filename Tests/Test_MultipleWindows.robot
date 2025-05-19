*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Handling multiple windows
    open the browser with url
    Select the button to switch to child window
    verify the child window is opened
    verify teh user is switched to parent window
    verify the user is switched back to child window


*** Keywords ***
open the browser with url
    Open Browser    https://demo.automationtesting.in/Windows.html    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Sleep    5s

Select the button to switch to child window
    ${ParentWindow} =    Get Window Handles
    Click Element    xpath=//div[@class='tabpane pullleft']/ul/li[2]/a
    Click Button    css:.btn-primary
    ${Windows} =    Get Window Handles
    FOR    ${window}    IN    ${Windows}
        Switch Window
        Log To Console    ${window}
        
    END
    
    ${count} =    Get Length   ${Windows}
    Log To Console    ${count}

verify the child window is opened
    Switch Window    NEW
    Page Should Contain    Selenium automates browsers
    Sleep    5s

verify teh user is switched to parent window
    Switch Window    MAIN
    # Element Text Should Be    ${mainPageText}    AutomationDemo Site
    Sleep    5s

verify the user is switched back to child window
    Switch Window    title=Selenium
    Sleep    5s
    Close Browser