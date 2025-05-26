*** Settings ***
Documentation    This test file is to checkout the product
Library    SeleniumLibrary
Library    DataDriver    file=../Task2/Utilities/CheckOutDetails.xlsx    sheet_name=Sheet1
Test Setup    Open the url with the browser
Test Teardown    Close Browser Sessions
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/DashboardPage.robot
Resource    ../Resources/CartPage.robot
Test Template    Provide the checkout details

*** Variables ***
${first_name}    
${last_name}
${pincode}

*** Test Cases ***
checkout the product    
    ${first_name}    ${last_name}    ${pincode}

*** Keywords ***
Provide the checkout details
    [Tags]    Regression    Smoke
    [Arguments]    ${first_name}    ${last_name}    ${pincode}
    GenericResource.Login with login credentials
    DashboardPage.Verify the logged in or not
    DashboardPage.Add product to the cart
    DashboardPage.Click the Cart button
    CartPage.Click the Checkout button
    CartPage.Providing the checkout details    ${first_name}    ${last_name}    ${pincode}
    
Verify the order is confirmed or not
    CartPage.Check the order is confirmed
    CartPage.Click Back to Home button and Verify
