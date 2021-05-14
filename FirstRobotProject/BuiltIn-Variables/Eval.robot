*** Variables ***
${STATUS}    PASS

*** Settings ***
Test Setup    Open Application    Test
Test Teardown   PRINTCLOSEMESSAGE   
*** Keywords ***
RUNIFKEYWORD
    [Documentation]    This is called from Keywords
    FOR    ${element}    IN RANGE    0    6
        Log To Console    The value of the element is ${element}    
    END
Open Application
    [Arguments]    ${TestParameter}
    Log To Console    How are you ${TestParameter}
RUN ELSE KEYWORD
    Log    This is called for ELSE BLOCK
PRINTCLOSEMESSAGE
    Log To Console    This is End of Each Test Case
*** Test Cases ***
Variable Test 1
    [Tags]    Variables
    Log To Console    Test Case to understand the Variables in Python
    Should Be True    "${STATUS}"!="PASS"
    Run Keyword If    "${STATUS}"=="PASS"    RUNIFKEYWORD
    Run Keyword If    1!=2    RUN ELSE KEYWORD    
      