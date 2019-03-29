*** Settings ***
Library  Selenium2Library

*** Variables ***
#Login
${Url}                         https://www.expesite.com/login/####
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
   Reports
   Access to the project
   Cost Tracking Budget Creation
   #Cost Tracking Bid Creation
   Cost Tracking Contract/Purchase Order Creation
   Cost Tracking Work Order/Change Order Creation
   #Cost Tracking Payment App/Invoice Creation
   #Documents
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

Reports
   Select Frame                                id=top
   Click element                               link=My Reports
   Click element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Offline Surveys'])[1]/following::a[2]
   Wait Until Page Contains                    My Reports
   Unselect Frame
   Select Frame                                id=bottom
   #Select from list by label                   name=ShowOnly                                Milestone Report
   Click Element                               link=2 Dawn's Test Report
   Wait Until Page Contains                    AlexTestProj
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
   Unselect Frame
   Select Window                               MAIN
   Select Frame                                id=bottom
   Click Element                               id=gui_Back_middle
   Click Element                               id=gui_Back_middle
   Unselect Frame
   Log to Console                              ~**Report Section Validated Successfully**~

###########################################################################################################################


Access to the project
   Select Frame                                id=bottom
   Click Element                               id=gui_Projects_with_Activity_middle
   Click Element                               link=Karen's Test Project
   Wait Until Page Contains                    Project Role Homepage
   Unselect Frame
   Log to Console                              ~**Access to the Project Validated Successfully**~

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
#   Select Frame                               id=top
#   click element                              link=Budget
#   sleep                                      3
#   unselect frame
#   Select Frame                               id=bottom
#   click element                              link=${BudgetName}
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
   Sleep                                      3
   Click Element                              id=T_42029050_1
   Click Element                              id=T_42029051_1
   Click Element                              id=gui_Save_middle
   Sleep                                      3
   #Concrete
   Double Click Element                       id=laborUnits_1_0_0_148221779_42029050
   Input Text                                 id=laborUnits_1_0_0_148221779_42029050                         2
   Double Click Element                       id=laborUnitCost_1_0_0_148221779_42029050
   Input Text                                 id=laborUnitCost_1_0_0_148221779_42029050                      200
   Double Click Element                       id=materialUnits_1_0_0_148221779_42029050
   Input Text                                 id=materialUnits_1_0_0_148221779_42029050                      2
   Double Click Element                       id=materialUnitCost_1_0_0_148221779_42029050
   Input Text                                 id=materialUnitCost_1_0_0_148221779_42029050                   200
   #Masonry
   Double Click Element                       id=laborUnits_2_0_0_148221780_42029051
   Input Text                                 id=laborUnits_2_0_0_148221780_42029051                         2
   Double Click Element                       id=laborUnitCost_2_0_0_148221780_42029051
   Input Text                                 id=laborUnitCost_2_0_0_148221780_42029051                      200
   Double Click Element                       id=materialUnits_2_0_0_148221780_42029051
   Input Text                                 id=materialUnits_2_0_0_148221780_42029051                      2
   Double Click Element                       id=materialUnitCost_2_0_0_148221780_42029051
   Input Text                                 id=materialUnitCost_2_0_0_148221780_42029051                   200
   Click Element                              id=gui_Save_middle
   Click Element                              id=gui_Close_middle
   Sleep                                      4
   select window                              MAIN
   Select Frame                               id=bottom
   Wait Until Page Contains                   ContractStage19.02
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
   Click Element                              id=dir2
   wait until page contains                   Issued
   wait until page contains                   Awarded
   Click Element                              xpath=/html/body/table[2]/tbody/tr/td[1]/table/tbody/tr[3]/td/table/tbody/tr[1]/td/a/img
   Log to Console                              ~**Cost Tracking Contract/Purchase Order Creation Validated Successfully**~

###########################################################################################################################

Cost Tracking Work Order/Change Order Creation
  # ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
#   Select Frame                               id=top
#   click element                              link=Budget
#   sleep                                      3
#   unselect frame
#   Select Frame                               id=bottom
#   click element                              link=${BudgetName}
#   click element                              link=Work Orders and Change Orders
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

MixPanel Validation
    Open Browser                             https://mixpanel.com/report/1152088/dashboard#id=31881               Chrome
    Input Text                               id=id_email                                ${UserMix}
    Input Text                               id=id_password                             ${PasswordMix}
    Click Element                            xpath=//*[@id="bottom"]/input
    Click Element                            xpath=//*[@id="wrapper"]/mp-chrome-header/div/div[1]/div/div[1]/a
    Wait until page contains                 Mobile Key Metrics by Employer
    Sleep                                    5


laborUnits_1_0_0_148221793_42029048
laborUnitCost_1_0_0_148221793_42029048
laborUnits_2_0_0_148221794_42029049
laborUnitCost_2_0_0_148221794_42029049
