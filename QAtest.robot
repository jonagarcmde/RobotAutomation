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
   Maximize Browser Window
   Wait Until Page Contains    Login


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

Access to the project
   Sleep                                       4
   Select Frame                                id=bottom
   Sleep                                       4
   Select From List By Label                   id=criteriatype          Projects
   Sleep                                       4
   Input Text                                  id=project_keywords      ${ProjectName}
   Sleep                                       2
   Sleep                                       4
   Click Element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='Search'])[1]/following::font[2]
   Unselect Frame

Reports
   Select Frame                                id=top
   Click Element                               link=My Reports
   Click Element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Offline Surveys'])[1]/following::a[2]
   Wait Until Page Contains                    My Reports

Validation Pay Apps
   Select Frame                           id=top
   Click Element                          link=Admin
   Select Window                          NEW
   Sleep                                  4
   Click Element                          link=Assume Another User's Identity
   Sleep                                  5
   Input Text                             name=LastNameBeginsWith             ${LastNameBeginsWith}
   click button                           name=GO
   Sleep                                  4
   Click Element                          link=Hill, Chad
   Sleep                                  5
   Select Window                          NEW
   Sleep                                  5
   Select Frame                           id=top
   Click Element                          link=My World
   Click Element                          link=My Inbox
   Unselect Frame
 #  Select Frame                          id=bottom
 #  Click Element                         xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Inbox'])[2]/following::u[1]
    Sleep                                 10
    wait until element is not visible      error

Cost Tracking Budget Creation
   Select Frame                               id=top
   Sleep                                      4
   Click Element                              link=Budget
   Sleep                                      8
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              xpath=(.//*[normalize-space(text()) and normalize-space(.)='Back'])[1]/following::u[1]
   Unselect Frame
   Select Frame                               id=bottom
   Sleep                                      4
   Select From List By Label                  name=Standard                       Standard Construction Budget
   Click Element                              id=gui_Do_It_Now_middle_3
   Unselect Frame
   Select Frame                               id=bottom
   Sleep                                      4
   Input Text                                 name=budgetname                      ${BudgetName}
   Click Element                              id=gui_Save_middle
   Wait Until Page Contains                   ${BudgetName}
   Sleep                                      4
   Click Element                              link=${BudgetName}
   Sleep                                      3



###########################################################################################################################

Cost Tracking Bid Creation
   ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              link=${BudgetName}
   Click Element                              link=Bid Package
   Select From List By Label                  name=contracttype                     Standard
   Input Text                                 name=txtname                          ${Numbers}
   Input Text                                 name=txtDue                           12/31/2019
   Click Element                              id=gui_Add_Bidders_middle
   Unselect Frame
   Select Window                               NEW
   Sleep                                       3
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
 ##  Sleep                                      2
 ##Click Element                              xpath=//*[@id="tdCBALL"]/input
 ##Click Element                              id=gui_Save_middle


Cost Tracking Contract/Purchase Order Creation
   ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   Sleep                                      3
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              link=${BudgetName}
   Sleep                                      3
   Click Element                              link=Contracts and Purchase Orders
   Sleep                                      4
   Click Element                              id=gui_New_Contract/PO_middle
   Sleep                                      4
   Unselect Frame
   Select Window                              NEW
   Select From List By Label                  id=contracttype_dd                    Standard
   Input Text                                 id=CommitmentName                     ContractStage19.02
   Select From List By Label                  id=statusDropDown                     Issued / Awarded
   Select From List By Label                  id=commitmenttype                     Contract
   Click Element                              id=gui_Next_middle
   Sleep                                      3
   Maximize Browser Window
  # Click Element                              name=AllAll
  # Click Element                              id=gui_Save_middle
  # Sleep                                      5
 #  Maximize Browser Window
   Click Element                              id=gui_Save_middle
 #  Maximize Browser Window
  # Click Element                              id=gui_Close_middle
   Select Window                              MAIN
   Select Frame                               id=bottom
   Click Element                              id=gui_New_Contract/PO_middle
   Sleep                                      3
   Unselect Frame
   Select Window                              NEW
   Select From List By Label                  id=contracttype_dd                    Standard
   Input Text                                 id=CommitmentName                     PurchaseOrderStage19.02
   Select From List By Label                  id=statusDropDown                     Issued / Awarded
   Select From List By Label                  id=commitmenttype                     Purchase Order
   Click Element                              id=gui_Next_middle
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
  # ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              link=${BudgetName}
   Click Element                              link=Work Orders and Change Orders
   Click Element                              id=gui_Create_New_Work_Order_middle
   Unselect Frame
   Select Window                              NEW
   Select Frame                               name=popmain
   Sleep                                      4
   Select From List By Label                  name=senderID                           Expesite Support
   Input Text                                 id=subject                              WorkOrderStage19.02
   Sleep                                      3
   Click Element                              id=gui_Save_middle
   Click Element                              id=gui_Close_middle
   Select Window                              MAIN
   Select Frame                               id=bottom
   Click Element                              id=gui_Create_New_Change_Order_middle
   Unselect Frame
   Select Window                              NEW
   Select Frame                               name=popmain
   Sleep                                      5
   Select From List By Label                  name=RecipientID                        Expesite Support
   Input Text                                 name=subject                            ChangeOrderStage19.02
   Click Element                              id=gui_Continue_middle
   Click Element                              id=gui_Close_middle
   Unselect Frame

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
  # Unselect Frame
  # Select Frame                              id=top
  # Click Element                             link=Documents
   #Sleep                                     10
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=folders
   Select Frame                              name=folderbrowsemain
   Wait Until Page Contains                  008AutomatedFolder (1)
   Click Element                             link=008AutomatedFolder (1)
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=dochead
   Click Element                             id=gui_Upload_middle
   Unselect Frame
   Select Frame                              id=bottom
 #  Click Element                             id=Html5_ChooseFile_Button_Link
 #  Sleep                                     5
 #  Choose File                               id=uploadBox_main