*** Settings ***
Library  Selenium2Library

*** Test Cases ***
Log in Accruent
   [Teardown]                  Close Browser
   Open Url In Chorme          http://exregression.accruentsystems.com:81/login/
   Input Test On Accruent
   Access to the project
   ##  Validation Pay Apps
   ## Reports
   ## Cost Tracking Budget Creation
   ## Cost Tracking Bid Creation
   ## Cost Tracking Contract/Purchase Order Creation
   Cost Tracking Work Order/Change Order Creation

*** Keywords ***

#Random
#    ${numbers}=                                 evaluate                             random.randint(1, 10000)     random
#    log to console                              ${numbers}
#    set global variable                         ${numbers}

Open Url In Chorme
   [Arguments]                 ${url}
   Open Browser                ${url}   Edge
   Maximize Browser Window
   Wait Until Page Contains    Login


Input Test On Accruent
   Input Text                 id=username         devteam
 # Clear Element Text         id=username
   Sleep                      1
   Input Text                 name=password       devteam123
   Sleep                      1
   Click Button               //input[@id='image1']
   Sleep                      1
   Wait Until Page Contains   Expesite
   Sleep                      1

Access to the project
   Sleep                                      10
   Select Frame                                id=bottom
   Select From List By Label                   id=criteriatype          Projects
   Input Text                                  id=project_keywords       Karen's Test Project
   Sleep                                       2
   Click Element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='Search'])[1]/following::font[2]
   Unselect Frame

Reports
   Select Frame                                id=top
   Click Element                               link=My Reports
   Click Element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Offline Surveys'])[1]/following::a[2]
   Wait Until Page Contains                    My Reports

Validation Pay Apps
   Sleep                             5
   Select Frame                      id=top
   Click Element                     link=Admin
   Select Window                     NEW
   Sleep                             3
   Click Element                     link=Assume Another User's Identity
   Sleep                             3
   Input Text                        name=LastNameBeginsWith             Hill
   click button                      name=GO
   Sleep                             3
   Click Element                     link=Hill, Chad
   Sleep                             5
   Select Window                     NEW
   Sleep                             5
   Select Frame                      id=top
   Click Element                     link=My World
   Click Element                     link=My Inbox
   Unselect Frame
 #  Select Frame                      id=bottom
 #  Click Element                     xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Inbox'])[2]/following::u[1]
    Sleep                              3
   wait until element is not visible  error

Cost Tracking Budget Creation
   Sleep                                      5
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      8
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              xpath=(.//*[normalize-space(text()) and normalize-space(.)='Back'])[1]/following::u[1]
   Unselect Frame
   Sleep                                      5
   Select Frame                               id=bottom
   Select From List By Label                  name=Standard                       Standard Construction Budget
   Click Element                              id=gui_Do_It_Now_middle_3
   Unselect Frame
   Sleep                                      5
   Select Frame                               id=bottom
   Input Text                                 name=budgetname                      AutomatedBudgetEdge
   Click Element                              id=gui_Save_middle
   Sleep                                      5
   Wait Until Page Contains                   AutomatedBudgetEdge
   Click Element                              link=AutomatedBudgetEdge
   Sleep                                      3

Cost Tracking Bid Creation
   ${numbers}=                                evaluate                             random.randint(100, 10000)     random
   log to console                             ${numbers}
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              link=AutomationTest
   Click Element                              link=Bid Package
   Select From List By Label                  name=contracttype                     Standard
   Input Text                                 name=txtname                          ${numbers}
   Input Text                                 name=txtDue                           12/31/2019
   Click Element                              id=gui_Add_Line_Items_middle
   Unselect Frame
   Select Window                                NEW

 ##  ${handle} =                                Select Window                          NEW
 ##  log to console                             ${handle}
 ##  Sleep                                      2
 ##Click Element                              xpath=//*[@id="tdCBALL"]/input
 ##Click Element                              id=gui_Save_middle


Cost Tracking Contract/Purchase Order Creation
   Sleep                                      4
   ${numbers}=                                evaluate                             random.randint(100, 10000)     random
   log to console                             ${numbers}
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              link=AutomatedBudgetEdge
   Sleep                                      4
   Click Element                              link=Contracts and Purchase Orders
   Sleep                                      4
   Click Element                              id=gui_New_Contract/PO_middle
   Sleep                                      4
   Unselect Frame
   Select Window                              NEW
   Select From List By Label                  id=contracttype_dd                    Standard
   Input Text                                 id=CommitmentName                     ${numbers}
   Select From List By Label                  id=statusDropDown                     Issued / Awarded
   Select From List By Label                  id=commitmenttype                     Contract
   Click Element                              id=gui_Next_middle
   Sleep                                      3
   Maximize Browser Window
   Click Element                              name=AllAll
   Click Element                              id=gui_Save_middle
   Sleep                                      3
   Maximize Browser Window
   Click Element                              id=gui_Save_middle
   Maximize Browser Window
   Sleep                                      4
   Click Element                              id=gui_Close_middle
   Select Window                              MAIN
   Select Frame                               id=bottom
   Click Element                              id=gui_New_Contract/PO_middle
   Sleep                                      3
   Unselect Frame
   Select Window                              NEW
   Select From List By Label                  id=contracttype_dd                    Standard
   Input Text                                 id=CommitmentName                     ${numbers}
   Select From List By Label                  id=statusDropDown                     Issued / Awarded
   Select From List By Label                  id=commitmenttype                     Purchase Order
   Click Element                              id=gui_Next_middle
   Sleep                                      4
   Click Element                              id=gui_Save_middle
   Select Window                              MAIN
   Select Frame                               id=bottom
   Sleep                                      3
   Select From List By Label                  name=NavChange                         Plan - Line Items by Provider
   Sleep                                      3
   Select From List By Label                  name=NavChange                         Plan - Contracts/Purchase Orders
   Wait Until Page Contains                   Issued
   Wait Until Page Contains                   Awarded

Cost Tracking Work Order/Change Order Creation
   ${numbers}=                                evaluate                             random.randint(100, 10000)     random
   log to console                             ${numbers}
   Sleep                                      4
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Sleep                                      3
   Click Element                              link=AutomatedBudgetEdge
   Sleep                                      3
   Click Element                              link=Work Orders and Change Orders
   Sleep                                      3
   Click Element                              id=gui_Create_New_Work_Order_middle
   Unselect Frame
   Sleep                                      3
   Select Window                              NEW
   Select Frame                               name=popmain
   Sleep                                      5
   Select From List By Label                  name=senderID                           Expesite Support
   Input Text                                 id=subject                              AutomatedWorkOrder+${numbers}
   Sleep                                      5
   Click Element                              id=gui_Save_middle
   Sleep                                      10
   Click Element                              id=gui_Close_middle
   Sleep                                      5
   Select Window                              MAIN
   Select Frame                               id=bottom
   Click Element                              id=gui_Create_New_Change_Order_middle
   Unselect Frame
   Select Window                              NEW
   Sleep                                      4
   Select Frame                               name=popmain
   Sleep                                      4
   Select From List By Label                  name=senderID                           Expesite Support
   Input Text                                 name=subject                            AutomatedChangeOrder+${numbers}
   Click Element                              id=gui_Continue_middle
   Click Element                              id=gui_Close_middle
   Unselect Frame
