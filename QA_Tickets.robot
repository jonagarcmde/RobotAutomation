*** Settings ***
Library  Selenium2Library

*** Variables ***
#Login
${Url}                        http://exqa.accruentsystems.com:81/login/
${User}                       devteam
${Password}                   devteam123

#Access to the project
${ProjectName}                 Karen's Test Project

#Validation Pay Apps
${LastNameBeginsWith}          Hill

###########################################################################################################################

*** Test Cases ***
Log in Accruent
   [Teardown]                  Close Browser
   Open Url In Chorme          ${Url}
   Input Test On Accruent
   Development Plan Validaton


###########################################################################################################################
*** Keywords ***

Open Url In Chorme
   [Arguments]                 ${Url}
   Open Browser                ${Url}   Chrome
   Maximize Browser Window
   Wait Until Page Contains    Login

###########################################################################################################################

Input Test On Accruent
   Input Text                 id=username         ${User}
 # Clear Element Text         id=username
   Sleep                      1
   Input Text                 name=password       ${Password}
   Sleep                      1
   Click Button               //input[@id='image1']
   Sleep                      1
   Wait Until Page Contains   Expesite
   Sleep                      1

###########################################################################################################################

Development Plan Validaton
   Select Frame                                id=top
   Click Element                               link=My Reports
   Click Element                               link=Development Plan
   Unselect Frame
   Select Frame                                id=bottom
   Click Element                               link=AT&T - Dealer Program Expansion
   Wait Until Page Contains                    Please wait while your Sites are loaded...
   Click Element                               id=gui_Development_Plan_with_Potential_Sites_middle
   Wait Until Page Contains                    No trade areas found for this fiscal year.
   Click Element                               id=gui_Sort/Filter_Trade_Areas_middle
   Unselect Frame
   Select Window                               NEW
   Select Frame                                name=AttributeListFrame
   Select From List By Label                   name=ChooseDescriptor                         Region

