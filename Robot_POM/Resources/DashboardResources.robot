*** Settings ***
Library    SeleniumLibrary
Documentation    All the page objects and keywords of Dashboard page

*** Variables ***
${dashboard_title}    css:.oxd-topbar-header-breadcrumb-module

*** Keywords ***
Verify Dashboard page opens
    Element Text Should Be    ${dashboard_title}    Dashboard