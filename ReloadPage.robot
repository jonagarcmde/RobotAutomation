*** Settings ***
Library  Selenium2Library
Library     String

*** Test Cases ***
Log in Accruent
   [Teardown]                  Close Browser
   Open Url In Chorme          http://exqa.accruentsystems.com:81/login/

*** Keywords ***
Open Url In Chorme
   [Arguments]                 ${url}
   :FOR  ${i}                    IN RANGE    100
  \ Open Browser                ${url}   Chrome
  \ Exit For Loop If             ${i} == 2
  \    Log    ${i}
       Log    Exited