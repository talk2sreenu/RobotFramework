*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Suite Teardown    Run Keyword And Continue On Failure    ShutDown

*** Keywords ***
ShutDown
    Close All Browsers
PRINT
    Log     My IF Condition is passed
*** Test Cases ***
MyFirstTest
    Log    Hello World...

FirstBrowserTest
    Log    This is my Second TestCase
    Open Browser    https://www.google.com    Chrome
    Maximize Browser Window
    Close Browser

My Rediff Search Test Case
    Log    This is to validate Rediff Test Case
    Open Browser    https://www.rediff.com/    Chrome
    Set Browser Implicit Wait    5
    Maximize Browser Window
    Click Link    class=mailicon
    Sleep    2
    Page Should Contain Textfield    id=login1      UserName field displayed
    Page Should Contain Textfield    id=password    Password Field Displayed
    Page Should Contain Button    name=proceed      Sign In Button Displayed
    Checkbox Should Be Selected    id=remember
    Capture Page Screenshot        filename=selenium-screenshot-1.png
    Click Link    xpath=//span[@class='forgotlink']/a
    Sleep    2
    Capture Page Screenshot        filename=Forgot-Password.png
    ${response}    Get Text    xpath=//*[.='Forgot your password?']
    Should Be Equal As Strings    ${response}    Forgot your password?    
    Run Keyword If    "${response}"=="Forgot your password?"    PRINT    
    Close Browser
    Log    My Test Case Ended    