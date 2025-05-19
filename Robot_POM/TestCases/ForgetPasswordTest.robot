*** Settings ***
Documentation    Test to validate Forgot Your Password Page functionality
Library    SeleniumLibrary
Test Setup    Open the Browser with url
Test Teardown    Close Browser Session
Resource    ../Resources/ForgetPasswordResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/GenericResources.robot

*** Test Cases ***
Validate Reset Password Functionality
    [Tags]    Smoke    UAT
    LoginResources.Go to forgot your password page
    ForgetPasswordResources.Verify Forgot Your Password Page Opens
    ForgetPasswordResources.Fill the Forgot Password Page
    ForgetPasswordResources.Verify the message

Validate Cancel functionality
    [Tags]    UAT
    LoginResources.Go to forgot your password page
    ForgetPasswordResources.Verify Forgot Your Password Page Opens
    ForgetPasswordResources.Cancel the Reset Password
    ForgetPasswordResources.Verify that Login Page is displayed