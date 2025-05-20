*** Settings ***
Documentation    This resources contains dashboard elements
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${Product_text}    xpath://span[@class='title']
${list_product}    xpath://div[@class='inventory_list']/div/div[2]/div[1]/a/div
${cart_btn}    xpath://div[@id='shopping_cart_container']/a
${text} =   Set Variable    Sauce Labs Bolt T-Shirt
${menu_btn}    css:button[id='react-burger-menu-btn']
${list_of_menu}    xpath://nav[@class='bm-item-list']/a


*** Keywords ***


Verify the logged in or not
    Element Text Should Be    ${Product_text}    Products

Add product to the cart
    # @{list_of_product} =    Create List
    ${elements} =    Get WebElements    ${list_product}
    ${i}=    Set Variable    1
    FOR    ${product}    IN    @{elements}
            
            Log To Console    ${product.text}
            IF    '${product.text}'=='Sauce Labs Bolt T-Shirt'
                Click Element    xpath:(//div[@class='inventory_list']/div/div[2]/div[2]/button)[${i}]
                BREAK
            END
            ${i}=    Evaluate    ${i}+1
    END
    
Click the Cart button
    Wait Until Element Is Visible    ${cart_btn}
    Click Element    ${cart_btn}    
    
Checking the links
    Create Session    link_session    https://
    @{links} =    Get WebElements    xpath://footer[@class='footer']/ul/li/a
    FOR    ${link}    IN    @{links}
        ${href} =    Get Element Attribute    ${link}    href
        Log To Console    Checking the link : ${href}           
        ${response} =    Get On Session    link_session    ${href}
        ${status_code} =    Convert To Integer    ${response.status_code}
        IF    ${status_code}==200
            Log To Console    Link is valid : ${href} [${status_code}]
        ELSE
            Log To Console    Broken link : ${href} [${status_code}]    
        END
        
    END
    
Menu options functionality
    [Arguments]    ${options}
    Click Button    ${menu_btn}
    @{menu_options} =    Get WebElements    ${list_of_menu}

    FOR    ${menu}    IN    @{menu_options}
        ${menu_text} =    Get Text    ${menu}
        Log To Console    Checking menu: ${menu_text}

        Run Keyword If    '${menu_text}' == '${options}'    Click Menu And Validate    ${menu_text}    ${menu}
    END

Click Menu And Validate
    [Arguments]    ${option_text}    ${element}
    Click Element    ${element}

    Run Keyword If    '${option_text}' == 'All Items'          Page Should Contain    Products
    Run Keyword If    '${option_text}' == 'About'              Handle About Page
    Run Keyword If    '${option_text}' == 'Logout'             Page Should Contain    Swag Labs
    Run Keyword If    '${option_text}' == 'Reset App State'    Page Should Contain    Products

Handle About Page
    # Switch Window    index=1
    Wait Until Page Contains    Products    timeout=10s
    # Close Browser


# Menu options functionality
#     [Arguments]    ${options}
#     Click Button    ${menu_btn}
#     @{menu_options} =    Get WebElements    ${list_of_menu}
#     ${i} =    Set Variable    1
#     FOR    ${menu}    IN    ${menu_options}
#         # ${menu_text} =    Get Text    ${menu}
#         # IF    '${menu_text}' == '${options}'
#         Log To Console    ${i}
#             IF    '${options}' == 'All Items'
#                 # Click Element    ${menu_text} 
#                 Click Element    xpath:(//nav[@class='bm-item-list']/a)[${i}]
#                 Page Should Contain    Products
#             BREAK
#             END
#             IF    '${options}' == 'About'
#                 # Click Element    ${menu.text}
#                 Click Element    xpath:(//nav[@class='bm-item-list']/a)[${i}]
#                 Switch Window
#                 Page Should Contain    Build apps users love with AI-driven insights
#                 BREAK
#             END
#             IF    '${options}' == 'Logout'
#                 # Click Element    ${menu.text}
#                 Click Element    xpath:(//nav[@class='bm-item-list']/a)[${i}]
#                 Page Should Contain    Accepted usernames are:
#                 BREAK
#             END
#             IF    '${options}' == 'Reset App State'
#                 # Click Element    ${menu.text}
#                 Click Element    xpath:(//nav[@class='bm-item-list']/a)[${i}]
#                 Page Should Contain    Products
#                 BREAK
#             END
#             ${i} =    Evaluate    ${i}+1
#         # END
#     END

    
#     # ${menu_option} =    Get WebElements    xpath://nav[@class='bm-item-list']/a
#     # FOR    ${menu}    IN    ${menu_option}
#     #     ${menu_text}=    Get Text    ${menu}
#     #     IF    '${menu_text}' == 'All Items'
#     #         Click Element    ${menu.text}
#     #         Page Should Contain    Products
#     #         BREAK
#     #     END
#     #     IF    '${menu_text}' == 'About'
#     #         Click Element    ${menu.text}
#     #         Page Should Contain    Build apps users love with AI-driven insights
#     #         BREAK
#     #     END
#     #     IF    '${menu_text}' == 'Logout'
#     #         Click Element    ${menu.text}
#     #         Page Should Contain    Accepted usernames are:
#     #         BREAK
#     #     END
#     #     IF    '${menu_text}' == 'Reset App State'
#     #         Click Element    ${menu.text}
#     #         Page Should Contain    Products
#     #         BREAK
#     #     END
#     # END