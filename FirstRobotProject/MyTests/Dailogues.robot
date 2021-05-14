*** Settings ***
Library    BuiltIn
Library    Dialogs    

*** Keywords ***
My Daialogue Test
    [Documentation]    A Simple example for Dialog library
    Pause Execution    Test Execution paused. Press OK to continue.
    Log To Console    OK Button selected    
    
*** Test Cases ***
My First Dialogue Test Case
    Log To Console    I am learning Dialogue Library
    My Daialogue Test