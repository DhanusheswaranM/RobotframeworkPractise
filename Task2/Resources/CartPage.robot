*** Settings ***
Documentation    This resources has the cart page elements
Library    SeleniumLibrary



*** Variables ***
${checkout_btn}    xpath://button[@id='checkout']
${fname_field}    css:input[id='first-name']
${lname_field}    css:input[id='last-name']
${pincode_field}    css:input[id='postal-code']
${continue_btn}    css:input[id='continue']
${finish_btn}    css:button[id='finish']
${confirm_order_text}    css://h2[@class='complete-header']
${bach_to_home}    css://button[@id='back-to-products']

*** Keywords ***
Click the Checkout button
    Click Button    ${checkout_btn}

Providing the checkout details
    [Arguments]    ${first_name}    ${last_name}    ${pincode}
    Input Text    ${fname_field}    ${first_name}
    Input Text    ${lname_field}    ${last_name}
    Input Text    ${pincode_field}    ${pincode}
    Click Element    ${continue_btn}
    Page Should Contain    Sauce Labs Bolt T-Shirt
    Click Button    ${finish_btn}


Check the order is confirmed
    ${text}=    Get Text    ${confirm_order_text}
    Log To Console    order infromation : ${text}
    # Page Should Contain    ${confirm_order_text}    Thank you for your order!
    Should Be Equal    ${text}    Thank you for your order!

Click Back to Home button and Verify
    Click Button    @{bach_to_home}
    Page Should Contain    Products