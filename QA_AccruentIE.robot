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
   maximize browser window
   Wait Until Page Contains    Login


Input Test On Accruent
   Input Text                 id=username         devteam
 # Clear Element Text         id=username
   sleep                      1
   Input Text                 name=password       devteam123
   sleep                      1
   Click Button               //input[@id='image1']
   sleep                      1
   Wait Until Page Contains   Expesite
   sleep                      1

Access to the project
   sleep                                      10
   Select Frame                                id=bottom
   select from list by label                   id=criteriatype          Projects
   input text                                  id=project_keywords       Karen's Test Project
   sleep                                       2
   click element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='Search'])[1]/following::font[2]
   unselect frame

Reports
   Select Frame                                id=top
   click element                               link=My Reports
   click element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Offline Surveys'])[1]/following::a[2]
   Wait Until Page Contains                    My Reports

Validation Pay Apps
   sleep                             5
   Select Frame                      id=top
   click element                     link=Admin
   select window                     NEW
   sleep                             3
   click element                     link=Assume Another User's Identity
   sleep                             3
   input text                        name=LastNameBeginsWith             Hill
   click button                      name=GO
   sleep                             3
   click element                     link=Hill, Chad
   sleep                             5
   select window                     NEW
   sleep                             5
   Select Frame                      id=top
   click element                     link=My World
   click element                     link=My Inbox
   unselect frame
 #  Select Frame                      id=bottom
 #  click element                     xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Inbox'])[2]/following::u[1]
    sleep                              3
   wait until element is not visible  error

Cost Tracking Budget Creation
   sleep                                      5
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      8
   unselect frame
   Select Frame                               id=bottom
   click element                              xpath=(.//*[normalize-space(text()) and normalize-space(.)='Back'])[1]/following::u[1]
   unselect frame
   sleep                                      5
   Select Frame                               id=bottom
   select from list by label                  name=Standard                       Standard Construction Budget
   click element                              id=gui_Do_It_Now_middle_3
   unselect frame
   sleep                                      5
   Select Frame                               id=bottom
   input text                                 name=budgetname                      AutomatedBudgetEdge
   click element                              id=gui_Save_middle
   sleep                                      5
   wait until page contains                   AutomatedBudgetEdge
   click element                              link=AutomatedBudgetEdge
   sleep                                      3

Cost Tracking Bid Creation
   ${numbers}=                                evaluate                             random.randint(100, 10000)     random
   log to console                             ${numbers}
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      3
   unselect frame
   Select Frame                               id=bottom
   click element                              link=AutomationTest
   click element                              link=Bid Package
   select from list by label                  name=contracttype                     Standard
   input text                                 name=txtname                          ${numbers}
   input text                                 name=txtDue                           12/31/2019
   click element                              id=gui_Add_Line_Items_middle
   unselect frame
   select window                                NEW

 ##  ${handle} =                                Select Window                          NEW
 ##  log to console                             ${handle}
 ##  sleep                                      2
 ##click element                              xpath=//*[@id="tdCBALL"]/input
 ##click element                              id=gui_Save_middle


Cost Tracking Contract/Purchase Order Creation
   sleep                                      4
   ${numbers}=                                evaluate                             random.randint(100, 10000)     random
   log to console                             ${numbers}
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      3
   unselect frame
   Select Frame                               id=bottom
   click element                              link=AutomatedBudgetEdge
   sleep                                      4
   click element                              link=Contracts and Purchase Orders
   sleep                                      4
   click element                              id=gui_New_Contract/PO_middle
   sleep                                      4
   unselect frame
   select window                              NEW
   select from list by label                  id=contracttype_dd                    Standard
   input text                                 id=CommitmentName                     ${numbers}
   select from list by label                  id=statusDropDown                     Issued / Awarded
   select from list by label                  id=commitmenttype                     Contract
   click element                              id=gui_Next_middle
   sleep                                      3
   maximize browser window
   click element                              name=AllAll
   click element                              id=gui_Save_middle
   sleep                                      3
   maximize browser window
   click element                              id=gui_Save_middle
   maximize browser window
   sleep                                      4
   click element                              id=gui_Close_middle
   select window                              MAIN
   Select Frame                               id=bottom
   click element                              id=gui_New_Contract/PO_middle
   sleep                                      3
   unselect frame
   select window                              NEW
   select from list by label                  id=contracttype_dd                    Standard
   input text                                 id=CommitmentName                     ${numbers}
   select from list by label                  id=statusDropDown                     Issued / Awarded
   select from list by label                  id=commitmenttype                     Purchase Order
   click element                              id=gui_Next_middle
   sleep                                      4
   click element                              id=gui_Save_middle
   select window                              MAIN
   Select Frame                               id=bottom
   sleep                                      3
   select from list by label                  name=NavChange                         Plan - Line Items by Provider
   sleep                                      3
   select from list by label                  name=NavChange                         Plan - Contracts/Purchase Orders
   wait until page contains                   Issued
   wait until page contains                   Awarded

Cost Tracking Work Order/Change Order Creation
   ${numbers}=                                evaluate                             random.randint(100, 10000)     random
   log to console                             ${numbers}
   sleep                                      4
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      3
   unselect frame
   Select Frame                               id=bottom
   sleep                                      3
   click element                              link=AutomatedBudgetEdge
   sleep                                      3
   click element                              link=Work Orders and Change Orders
   sleep                                      3
   click element                              id=gui_Create_New_Work_Order_middle
   unselect frame
   sleep                                      3
   select window                              NEW
   select frame                               name=popmain
   sleep                                      5
   select from list by label                  name=senderID                           Expesite Support
   input text                                 id=subject                              AutomatedWorkOrder+${numbers}
   sleep                                      5
   click element                              id=gui_Save_middle
   sleep                                      10
   click element                              id=gui_Close_middle
   sleep                                      5
   select window                              MAIN
   Select Frame                               id=bottom
   click element                              id=gui_Create_New_Change_Order_middle
   unselect frame
   select window                              NEW
   sleep                                      4
   select frame                               name=popmain
   sleep                                      4
   select from list by label                  name=senderID                           Expesite Support
   input text                                 name=subject                            AutomatedChangeOrder+${numbers}
   click element                              id=gui_Continue_middle
   click element                              id=gui_Close_middle
   unselect frame
