*** Settings ***
Documentation    Example using the space separated format.
Library          OperatingSystem    

*** Variables ***
${MESSAGE}    Hello, World!

*** Test Cases ***
My Test
    [Documentation]    Example Test.
    Log    ${MESSAGE}
    My Keyword    ${CURDIR}    ${MESSAGE}

Another Test
    [Documentation]    Validation Test.
    [Tags]             Smoke
    Should Be Equal    ${MESSAGE}    Hello, World!    
*** Keywords ***
My Keyword
    [Arguments]    ${path}    ${secondARG}
    Log To Console    ${secondARG}
    Directory Should Exist    ${path}    
    