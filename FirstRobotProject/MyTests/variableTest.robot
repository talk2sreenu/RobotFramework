*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String    
Suite Teardown    Run Keyword If Any Tests Failed    CloseSession    
*** Variables ***
${UserName}       talk2sreenu@gmail.com
${Application}    https://www.rediff.com/
${Browser}        Chrome
@{MyArray}        1    2    3    4    5    6
*** Keywords ***
PRINT
    Log    Hello World
LaunchSession
    Open Browser    ${Application}    ${Browser}
    Set Browser Implicit Wait    5
    Maximize Browser Window
CloseSession
    Close Browser

*** Test Cases ***
Variable Test
    Log    Variable Test for User Name :  ${UserName}
    LaunchSession
    Page Should Contain Element    xpath=//*[contains(@class,'hmsprite logo')]     Rediff Home Page Logo
 
    ${lableText}    Get Text    class=signin    
    Run Keyword If    "${lableText}" == "Sign in"    PRINT
    Close Browser
    Log    My Variable Test Completed

ArrayTest
    Log    Validating Arrays
    #Log    Size of my Array is    Get Length    @{MyArray}
    ${count}=   Get Length    MyArray  
    Log To Console    List Size is ${count}
    FOR    ${element}    IN    @{MyArray}
        Log To Console   ${element}
        Exit For Loop If    ${element} > 5
    END

    LaunchSession   
    
    @{ElementsList}    Get WebElements    xpath=//div[@class='cell topicons']/a
    ${listLength}  Get Length    ElementsList
    Log To Console    ${listLength}
    
    FOR    ${element}    IN RANGE    1    ${listLength}
        #${temp}=    Evaluate    int(${element})+1
        Log To Console    Working on Iteration : ${element}
        #Log To Console    Working on Item : ${temp}  
        Set Focus To Element    xpath=//div[@class='cell topicons']/a[${element}]
        Click Element    xpath=//div[@class='cell topicons']/a[${element}]
        Sleep    5
        Go Back
        Wait For Condition    return document.readyState=="complete"    
        Sleep    3
        
        Exit For Loop If    ${element} == 5
    END
    
    Close Browser

For Test
    ${listLength}  Get Length    MyArray
    ${temp}=    Set Variable    0    #{}
    FOR    ${i}    IN RANGE    1    ${listLength}
        Log To Console    ${i}
        ${temp}=    Evaluate   int(${temp}) + 1
        Log To Console    Temporary Value is : ${temp}    
    END
      
