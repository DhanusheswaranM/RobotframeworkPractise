*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Test Cases ***
To check the broken link
    open the url
    Number of broken links

*** Keywords ***
open the url
    Open Browser    https://www.selenium.dev/    browser=chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5

Number of broken links
    ${links} =    Get WebElements    xpath=//div[@class='col-lg-3 col-md-6 mb-4 mb-lg-0 align-self-center px-5 py-3']
    FOR    ${link}    IN    ${links}
        Log To Console    ${link}
        
    END
    
