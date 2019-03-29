*** Settings ***
Library  Selenium2Library

*** Variables ***
#Login
${Url}                         https://stage.expesite.com/altlogin/default.asp
${User}                        ####
${Password}                    ####

#Access to the project
${ProjectName}                 Karen's Test Project

#Validation Pay Apps
${LastNameBeginsWith}          Hill


#Cost Tracking Budget Creation
${BudgetType}                  Standard Construction Budget
${BudgetName}                  AutomatedSmokeChrome-19.03-2

#Cost Tracking Contract/Purchase Order Creation


#Documents
${FolderName}                        ImagesStage19.03-2
${ExcelRoute}                        C:\\TestUpload\\SmokeTestExcel.xlsx
${PDFRoute}                          C:\\TestUpload\\SmokeTestPDF.pdf
${ImageRoute}                        C:\\TestUpload\\SmokeTestImage.jpg
${ExcelName}                         SmokeTestExcel.xlsx
${PDFName}                           SmokeTestPDF.pdf
${ImageName}                         SmokeTestImage.jpg




#MixPanel Credentials
${UserMix}                        jonatan.garcia@contractors.accruent.com
${PasswordMix}                    j0n474n.

###########################################################################################################################

*** Test Cases ***
Log in Accruent
   [Teardown]                  Close Browser
   Open Url In Chorme          ${Url}
   Input Test On Accruent
   Access to the project
   #Validation Pay Apps
   #Reports
   #Cost Tracking Budget Creation
   #Cost Tracking Bid Creation
   #Cost Tracking Contract/Purchase Order Creation
   #Cost Tracking Work Order/Change Order Creation  PENDING !!!
   #Cost Tracking Payment App/Invoice Creation
   Documents
   #Loop
   #Apply Fix Misssing Cost
   #Sum
   #Cost Tracking - Vendor Access
   #Cost Tracking - Vendor Work Order Response
   #MixPanel Validation
   #Conditionals




###########################################################################################################################

*** Keywords ***

Open Url In Chorme
   [Arguments]                 ${Url}
   Open Browser                ${Url}   Chrome
   maximize browser window
   Wait Until Page Contains    Login

###########################################################################################################################

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

###########################################################################################################################

Access to the project
   Select Frame                                id=bottom
   select from list by label                   id=criteriatype          Projects
   input text                                  id=project_keywords      ${ProjectName}
   sleep                                       2
   click element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='Search'])[1]/following::font[2]
   unselect frame

###########################################################################################################################

Reports
   Select Frame                                id=top
   Click element                               link=My Reports
   Click element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Offline Surveys'])[1]/following::a[2]
   Wait Until Page Contains                    My Reports
   Unselect Frame
   Select Frame                                id=bottom
   #Select from list by label                   name=ShowOnly                                Milestone Report
   Click Element                               link=BB&T Test
   Wait Until Page Contains                    AL - Alexander City, 2055 Cherokee Road [101098]
   sleep                                       2
   Click Element                               id=gui_Export_to_Excel_middle
   Unselect Frame
   Select Window                               NEW
   Click Element                               id=gui_Continue_middle
   Sleep                                       2
   Select Frame                                id=excelupper
   Click Element                               id=gui_Close_middle
   Select Window                               MAIN
   Select Frame                                id=bottom
   Click Element                               id=gui_Export_to_Excel_middle
   Unselect Frame
   Select Window                               NEW
   Click Element                               name=ExcelExportAsCSV
   Click Element                               id=gui_Continue_middle
   Select Frame                                name=excelupper
   Wait Until Page Contains                    The Excel Export of this Milestone Report is Complete.
   Sleep                                       2
   Click Element                               id=gui_Close_middle
   Select Window                               MAIN
   Select Frame                                id=bottom
   Click Element                               id=gui_Print_View_middle
   Select Window                               NEW
   Wait Until Page Does Not Contain            The Print View of this Milestone Report is being generated.
   Sleep                                       2
   Select Window                               MAIN
   Select Frame                                id=bottom
   Click Element                               id=gui_Back_middle
   Wait Until Page Contains                    My Reports
   Select from list by label                   name=ShowOnly                                Data Export Report
   Click Element                               link=Vendor PO Information
   Select Window                               NEW
   Select Frame                                id=excelupper
   Sleep                                       2
   Wait Until Page Contains                    The Data Export Report is Complete.
   Sleep                                       10
   Click Element                               id=gui_Close_middle






###########################################################################################################################

Validation Pay Apps
   Select Frame                           id=top
   click element                          link=Admin
   select window                          NEW
   click element                          link=Assume Another User's Identity
   sleep                                  5
   input text                             name=LastNameBeginsWith             ${LastNameBeginsWith}
   click button                           name=GO
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
    wait until element is not visible     error


###########################################################################################################################

Cost Tracking Budget Creation
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      8
   unselect frame
   Select Frame                               id=bottom
   click element                              xpath=(.//*[normalize-space(text()) and normalize-space(.)='Back'])[1]/following::u[1]
   unselect frame
   Select Frame                               id=bottom
   select from list by label                  name=Standard                       Standard Construction Budget
   click element                              id=gui_Do_It_Now_middle_3
   unselect frame
   Select Frame                               id=bottom
   input text                                 name=budgetname                      ${BudgetName}
   click element                              id=gui_Save_middle
   wait until page contains                   ${BudgetName}
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
   Select Window                               MAIN
   Select Frame                                id=bottom
   Wait Until Page Contains                    Expesite - Expesite Support
   Click Element                               id=gui_Add_Line_Items_middle
   Unselect Frame
#   Select Window                               NEW
#   Wait Until Page Contains                     L = Labor Total
#   Select Frame                                name=AddLineItemstoRFQ
#   Click Element                               name=AllAll
#   Sleep                                       4




  # Click Element                               id=gui_Save_middle


 ##  ${handle} =                                Select Window                          NEW
 ##  log to console                             ${handle}
 ##  sleep                                      2
 ##click element                              xpath=//*[@id="tdCBALL"]/input
 ##click element                              id=gui_Save_middle

###########################################################################################################################

Cost Tracking Contract/Purchase Order Creation
   ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      3
   unselect frame
   Select Frame                               id=bottom
   click element                              link=${BudgetName}
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

###########################################################################################################################

Cost Tracking Work Order/Change Order Creation
  # ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      3
   unselect frame
   Select Frame                               id=bottom
   click element                              link=${BudgetName}
   click element                              link=Work Orders and Change Orders
   Sleep                                      2
   click element                              id=gui_Create_New_Change_Order_middle
   unselect frame
   select window                              NEW
   select frame                               name=popmain
   sleep                                      4
   select from list by label                  name=RecipientID                        Expesite Support
   input text                                 name=subject                            WorkOrderStage19.03
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
   input text                                 name=subject                            ChangeOrderStage19.03
   click element                              id=gui_Continue_middle
   click element                              id=gui_Close_middle
   unselect frame

###########################################################################################################################

Cost Tracking Payment App/Invoice Creation
   ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   click element                              link=Budget
   sleep                                      3
   unselect frame
   Select Frame                               id=bottom
   Click Element                              link=${BudgetName}
   Click Element                              link=Invoices and Payment Applications
   : FOR    ${INDEX}    IN RANGE       10
   \    ${Numbers}=                                evaluate                                     random.randint(100, 10000)     random
   \    Click Element                              id=gui_New_Payment_App/Invoice_middle
   \    Unselect Frame
   \    Select Window                              NEW
   \    Select Frame                               name=UpdatePayRequest
   \    Sleep                                      2
   \    Input Text                                 id=name                                        P-${Numbers}
   \    Sleep                                      5
   \    Click Element                              id=gui_Next_middle
   \    Click Element                              id=gui_Save_middle
   \    Click Element                              id=gui_Close_middle
   \    Select Window                              MAIN
   \    Select Frame                               id=bottom
   \    Sleep                                      3


##Loop
#    : FOR    ${INDEX}    IN RANGE       10
#   \    ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
#   \    log to console                             ${Numbers}

#Ctrl + / -> Comments



Documents
   Select Frame                              id=top
   Click Element                             link=Documents
   Sleep                                     3
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=dochead
   Click Element                             id=gui_New_Folder_middle
   Sleep                                     3
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=content
   Input Text                                name=foldername                          ${FolderName}
   Click Element                             id=gui_Save_middle
   Sleep                                     5
   Unselect frame
   Select Frame                              id=top
   Click Element                             link=Documents
   Sleep                                     10
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=folders
   Select Frame                              name=folderbrowsemain
   wait until page contains                  ${FolderName} (0)
   click element                             link=${FolderName} (0)
   Unselect frame
   Select Frame                              id=bottom
   Select Frame                              name=dochead
   Click element                             id=gui_Upload_middle
   Unselect Frame
   Select Frame                              id=bottom
   Choose File                               id=file1                                      ${ExcelRoute}
   Choose File                               id=file1                                      ${PDFRoute}
   Choose File                               id=file1                                      ${ImageRoute}
   Click Element                             id=gui_Upload_middle
   Wait Until Page Contains                  Success!
   Click Element                             id=gui_Do_It_Now_middle
   Click Element                             id=gui_Cancel_middle
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=content
   Wait Until Page Contains                  ${ExcelName}
   Wait Until Page Contains                  ${PDFName}
   Wait Until Page Contains                  ${ImageName}
   Sleep                                     3








#   : FOR    ${INDEX}    IN RANGE       2
#   \   ${x}=                                     Set Variable                                       ${INDEX}
#   \   Run keyword if                            "${x}" == "2"
#   \   ...                                       Choose File                                         id=file1               C:\\TestUpload\\Image001.jpg
#   \   ...                                       ELSE
#   \   ...                                       Choose File                                         id=file1               C:\\TestUpload\\SmokeTestImage.jpg
#   Sleep                                         4

#Conditionals
#    ${x}=                                   Set Variable                                Simplex
#    Run keyword if                          "${x}" == "Simple"
#    ...                                     Log to console                              A
#    ...                                     ELSE
#    ...                                     Log to console                              B














Apply Fix Misssing Cost
   Select Frame                           id=top
   click element                          link=Admin
   select window                          NEW
   click element                          link=Fix payment application: Costs are not loading
   Click Element                          id=gui_Fix_pay_app_middle
   ${PaymentID}=                          set variable                                                 752439
   : FOR    ${INDEX}    IN RANGE       9
    \   Input Text                              id=PayAppIDCheck                                      ${PaymentID}
    \   Click Element                           name=GO
    \   Sleep                                   2
    \   Click Element                           id=applyFix
    \   Wait Until Page Contains Element        id=successMessage
    \   ${PaymentID}=                           evaluate                                             ${PaymentID}+1
    Click Element                               link=Back to Fix Pay App Main Page

#Sum
#    ${Numbers}=                                set variable                                    10
#   : FOR    ${INDEX}    IN RANGE       5
#   \    ${Numbers}=                             evaluate                                    ${Numbers}+1
#   \    log to console                          ${Numbers}


Cost Tracking - Vendor Access
   Select Frame                           id=top
   click element                          link=Admin
   select window                          NEW
   click element                          link=Assume Another User's Identity
   sleep                                  5
   input text                             name=LastNameBeginsWith             McAleenan
   click button                           name=GO
   click element                          link=McAleenan, Natasha
   sleep                                  5
   select window                          NEW
   sleep                                  5
   Select Frame                           id=top
   click element                          link=My World
   click element                          link=My Inbox
   Unselect Frame

Cost Tracking - Vendor Work Order Response
   Select Frame                              id=bottom
   Click Element                             id=gui_Send_Work_Order_middle
   select window                             NEW
   select frame                              name=popmain
   sleep                                     4
   select from list by label                 id=CommitmentID                         [Karen's Test Project ] - BidStageE19.02 52895
   Wait until page contains                  Custom Wo 4:
   select from list by label                 id=RecipientID                          Expesite Support
   input text                                id=subject                              Testing
   Click element                             id=gui_Save_middle
   Click element                             id=gui_Close_middle

MixPanel Validation
    Open Browser                             https://mixpanel.com/report/1152088/dashboard#id=31881               Chrome
    Input Text                               id=id_email                                ${UserMix}
    Input Text                               id=id_password                             ${PasswordMix}
    Click Element                            xpath=//*[@id="bottom"]/input
    Click Element                            xpath=//*[@id="wrapper"]/mp-chrome-header/div/div[1]/div/div[1]/a
    Wait until page contains                 Mobile Key Metrics by Employer
    Sleep                                    5


Conditionals
    ${x}=                                   Set Variable                                Simplex
    Run keyword if                          "${x}" == "Simple"
    ...                                     Log to console                              A
    ...                                     ELSE
    ...                                     Log to console                              B