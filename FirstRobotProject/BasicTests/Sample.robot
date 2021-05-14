*** Settings ***
Documentation    This is to test my Robot Framework
Library    SeleniumLibrary
Library    OperatingSystem

*** Test Cases ***
My First Test
    [Documentation]    This is for first Test Case
    [Tags]    Smoke
    Open Browser    https://www.google.com    chrome
    Maximize Browser Window
    Sleep    5s
    Close Browser    