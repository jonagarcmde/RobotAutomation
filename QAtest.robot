*** Settings ***
Library  Selenium2Library

*** Variables ***
#Login
${User}                        ####
${Password}                    ####

#Access to the project
${ProjectName}                 Karen's Test Project

#Validation Pay Apps
${LastNameBeginsWith}          Hill


#Cost Tracking Budget Creation
${BudgetType}                  Standard Construction Budget
${BudgetName}                  SmokeStage19.02E

#Cost Tracking Contract/Purchase Order Creation

${ruta}                        C:\Users\SmokeTestImage.jpg



*** Test Cases ***
Log in Accruent
   [Teardown]                  Close Browser
   Open Url In Chorme          https://stage.expesite.com/altlogin/default.asp
   Input Test On Accruent
   Access to the project
   #Validation Pay Apps
   #Reports
   #Cost Tracking Budget Creation
   #Cost Tracking Bid Creation
   Cost Tracking Contract/Purchase Order Creation
   #Cost Tracking Work Order/Change Order Creation
   #Documents

*** Keywords ***

#Random
#    ${numbers}=                                 evaluate                             random.randint(1, 10000)     random
#    log to console                              ${numbers}
#    set global variable                         ${numbers}

Open Url In Chorme
   [Arguments]                 ${url}
   Open Browser                ${url}   Internet Explorer
   maximize browser window
   Wait Until Page Contains    Login


Input Test On Accruent
   Input Text                 id=username         ${User}
 # Clear Element Text         id=username
   sleep                      1
   Input Text                 name=password       ${Password}
   sleep                      1
   Click Button               //input[@id='image1']
   sleep                      1
   Wait Until Page Contains   Expesite
   sleep                      1

Access to the project
   Sleep                                       4
   Select Frame                                id=bottom
   Sleep                                       4
   select from list by label                   id=criteriatype          Projects
   Sleep                                       4
   input text                                  id=project_keywords      ${ProjectName}
   sleep                                       2
   Sleep                                       4
   click element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='Search'])[1]/following::font[2]
   unselect frame

Reports
   Select Frame                                id=top
   click element                               link=My Reports
   click element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Offline Surveys'])[1]/following::a[2]
   Wait Until Page Contains                    My Reports

Validation Pay Apps
   Select Frame                           id=top
   click element                          link=Admin
   select window                          NEW
   Sleep                                  4
   click element                          link=Assume Another User's Identity
   sleep                                  5
   input text                             name=LastNameBeginsWith             ${LastNameBeginsWith}
   click button                           name=GO
   Sleep                                  4
   click element                          link=Hill, Chad
   sleep                                  5
   select window                          NEW
   sleep                                  5
   Select Frame                           id=top
   click element                          link=My World
   click element                          link=My Inbox
   unselect frame
 #  Select Frame                          id=bottom
 #  click element                         xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Inbox'])[2]/following::u[1]
    sleep                                 10
    wait until element is not visible      error

Cost Tracking Budget Creation
   Select Frame                               id=top
   sleep                                      4
   click element                              link=Budget
   sleep                                      8
   unselect frame
   Select Frame                               id=bottom
   click element                              xpath=(.//*[normalize-space(text()) and normalize-space(.)='Back'])[1]/following::u[1]
   unselect frame
   Select Frame                               id=bottom
   sleep                                      4
   select from list by label                  name=Standard                       Standard Construction Budget
   click element                              id=gui_Do_It_Now_middle_3
   unselect frame
   Select Frame                               id=bottom
   sleep                                      4
   input text                                 name=budgetname                      ${BudgetName}
   click element                              id=gui_Save_middle
   wait until page contains                   ${BudgetName}
   sleep                                      4
   click element                              link=${BudgetName}
   sleep                                      3



###########################################################################################################################

Cost Tracking Bid Creation
   ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      3
   unselect frame
   Select Frame                               id=bottom
   click element                              link=${BudgetName}
   click element                              link=Bid Package
   select from list by label                  name=contracttype                     Standard
   input text                                 name=txtname                          ${Numbers}
   input text                                 name=txtDue                           12/31/2019
   click element                              id=gui_Add_Bidders_middle
   unselect frame
   select window                               NEW
   sleep                                       3
   Select Frame                                name=SearchBidder
   Input Text                                  name=name                              Expesite Support
   Click Element                               id=gui_Search_For_Bidder_middle
   Wait Until Page Does Not Contain            id=searching
   Unselect Frame
   Select Frame                                name=FindBidder
   Click Element                               link=Expesite Support
   Unselect Frame
   Select Frame                                name=NewBiddersList
   Click Element                               id=gui_Add_middle
   Sleep                                       3
   Unselect Frame
   Select Window                               MAIN
   Select Frame                                id=bottom
   Wait Until Page Contains                    Expesite - Expesite Support







 ##  ${handle} =                                Select Window                          NEW
 ##  log to console                             ${handle}
 ##  sleep                                      2
 ##click element                              xpath=//*[@id="tdCBALL"]/input
 ##click element                              id=gui_Save_middle


Cost Tracking Contract/Purchase Order Creation
   ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   sleep                                      3
   click element                              link=Budget
   sleep                                      3
   unselect frame
   Select Frame                               id=bottom
   click element                              link=${BudgetName}
   sleep                                      3
   click element                              link=Contracts and Purchase Orders
   sleep                                      4
   click element                              id=gui_New_Contract/PO_middle
   sleep                                      4
   unselect frame
   select window                              NEW
   select from list by label                  id=contracttype_dd                    Standard
   input text                                 id=CommitmentName                     ContractStage19.02
   select from list by label                  id=statusDropDown                     Issued / Awarded
   select from list by label                  id=commitmenttype                     Contract
   click element                              id=gui_Next_middle
   sleep                                      3
   maximize browser window
  # click element                              name=AllAll
  # click element                              id=gui_Save_middle
  # sleep                                      5
 #  maximize browser window
   click element                              id=gui_Save_middle
 #  maximize browser window
  # click element                              id=gui_Close_middle
   select window                              MAIN
   Select Frame                               id=bottom
   click element                              id=gui_New_Contract/PO_middle
   sleep                                      3
   unselect frame
   select window                              NEW
   select from list by label                  id=contracttype_dd                    Standard
   input text                                 id=CommitmentName                     PurchaseOrderStage19.02
   select from list by label                  id=statusDropDown                     Issued / Awarded
   select from list by label                  id=commitmenttype                     Purchase Order
   click element                              id=gui_Next_middle
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
  # ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      3
   unselect frame
   Select Frame                               id=bottom
   click element                              link=${BudgetName}
   click element                              link=Work Orders and Change Orders
   click element                              id=gui_Create_New_Work_Order_middle
   unselect frame
   select window                              NEW
   select frame                               name=popmain
   sleep                                      4
   select from list by label                  name=senderID                           Expesite Support
   input text                                 id=subject                              WorkOrderStage19.02
   sleep                                      3
   click element                              id=gui_Save_middle
   click element                              id=gui_Close_middle
   select window                              MAIN
   Select Frame                               id=bottom
   click element                              id=gui_Create_New_Change_Order_middle
   unselect frame
   select window                              NEW
   select frame                               name=popmain
   sleep                                      5
   select from list by label                  name=RecipientID                        Expesite Support
   input text                                 name=subject                            ChangeOrderStage19.02
   click element                              id=gui_Continue_middle
   click element                              id=gui_Close_middle
   unselect frame

Documents
   Select Frame                              id=top
   Click Element                             link=Documents
   Sleep                                     3
   #Unselect Frame
   #Select Frame                              id=bottom
   #Select Frame                              name=dochead
  # Click Element                             id=gui_New_Folder_middle
  #Sleep                                     3
  # Unselect Frame
  # Select Frame                              id=bottom
  # Select Frame                              name=content
  # Input Text                                name=foldername                          008AutomatedFolder
   #Click Element                             id=gui_Save_middle
  # Sleep                                     5
  # Unselect frame
  # Select Frame                              id=top
  # Click Element                             link=Documents
   #Sleep                                     10
   Unselect frame
   Select Frame                              id=bottom
   Select Frame                              name=folders
   Select Frame                              name=folderbrowsemain
   wait until page contains                  008AutomatedFolder (1)
   click element                             link=008AutomatedFolder (1)
   Unselect frame
   Select Frame                              id=bottom
   Select Frame                              name=dochead
   Click element                             id=gui_Upload_middle
   Unselect Frame
   Select Frame                              id=bottom
 #  Click Element                             id=Html5_ChooseFile_Button_Link
 #  sleep                                     5
 #  Choose File                               id=uploadBox_main