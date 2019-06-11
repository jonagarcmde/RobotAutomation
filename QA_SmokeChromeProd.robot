*** Settings ***
Library  Selenium2Library

*** Variables ***
#Login
${Url}                         https://www.expesite.com/login/
${User}                        jogarcia
${Password}                    j0n474ngarciagap

#Access to the project
${ProjectName}                 Karen's Test Project

#Validation Pay Apps
${LastNameBeginsWith}          Hill


#Cost Tracking Budget Creation
${BudgetType}                         Standard Construction Budget
${BudgetName}                         A_SmokeChrome-19.04

#Cost Tracking Contract/Purchase Order Creation
${ContractName}                      ContractStage19.04
${PurchaseOrderName}                 PurchaseOrderStage19.04

#Cost Tracking Work Order/Change Order Creation
${WorkOrderName}                     WorkOrderStage19.04



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

Reports
   Select Frame                                id=top
   Click Element                               link=My Reports
   Click Element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Offline Surveys'])[1]/following::a[2]
   Wait Until Page Contains                    My Reports
   Unselect Frame
   Select Frame                                id=bottom
   #Select From List By Label                   name=ShowOnly                                Milestone Report
   Click Element                               link=2 Dawn's Test Report
   Wait Until Page Contains                    AlexTestProj
   Sleep                                       2
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
   Click Element                              link=Budget
   Sleep                                      8
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              xpath=(.//*[normalize-space(text()) and normalize-space(.)='Back'])[1]/following::u[1]
   Unselect Frame
   Select Frame                               id=bottom
   Select From List By Label                  name=Standard                       Standard Construction Budget
   Click Element                              id=gui_Do_It_Now_middle_3
   Unselect Frame
   Select Frame                               id=bottom
   Input Text                                 name=budgetname                      ${BudgetName}
   Click Element                              id=gui_Save_middle
   Wait Until Page Contains                   ${BudgetName}
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
 ##  Sleep                                      2
 ##Click Element                              xpath=//*[@id="tdCBALL"]/input
 ##Click Element                              id=gui_Save_middle

###########################################################################################################################

Cost Tracking Contract/Purchase Order Creation
   ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
#   Select Frame                               id=top
#   Click Element                              link=Budget
#   Sleep                                      3
#   Unselect Frame
#   Select Frame                               id=bottom
#   Click Element                              link=${BudgetName}
   Click Element                              link=Contracts and Purchase Orders
   Sleep                                      4
   Click Element                              id=gui_New_Contract/PO_middle
   Sleep                                      4
   Unselect Frame
   Select Window                              NEW
   Select From List By Label                  id=contracttype_dd                    Standard
   Input Text                                 id=CommitmentName                     ${ContractName}
   Select From List By Label                  id=statusDropDown                     Issued / Awarded
   Select From List By Label                  id=commitmenttype                     Contract
   Click Element                              id=gui_Next_middle
   Sleep                                      3
   Maximize Browser Window
   Sleep                                      3
   Click Element                              xpath=//*[@id="T_42194619_1_1"]
   Click Element                              xpath=//*[@id="T_42194638_1_2"]
   Click Element                              id=gui_Save_middle
   Sleep                                      3
   #Site Utilities
   Double Click Element                       id=laborUnits_1_0_0_148801747_42194620
   Input Text                                 id=laborUnits_1_0_0_148801747_42194620                         2
   Double Click Element                       id=laborUnitCost_1_0_0_148801747_42194620
   Input Text                                 id=laborUnitCost_1_0_0_148801747_42194620                      200
   Double Click Element                       id=materialUnits_1_0_0_148801747_42194620
   Input Text                                 id=materialUnits_1_0_0_148801747_42194620                      2
   Double Click Element                       id=materialUnitCost_1_0_0_148801747_42194620
   Input Text                                 id=materialUnitCost_1_0_0_148801747_42194620                  200
   #Glazing
   Double Click Element                       id=laborUnits_2_0_0_148801761_42194640
   Input Text                                 id=laborUnits_2_0_0_148801761_42194640                         2
   Double Click Element                       id=laborUnitCost_2_0_0_148801761_42194640
   Input Text                                 id=laborUnitCost_2_0_0_148801761_42194640                      200
   Double Click Element                       id=materialUnits_2_0_0_148801761_42194640
   Input Text                                 id=materialUnits_2_0_0_148801761_42194640                      2
   Double Click Element                       id=materialUnitCost_2_0_0_148801761_42194640
   Input Text                                 id=materialUnitCost_2_0_0_148801761_42194640                   200
   Click Element                              id=gui_Save_middle
   Click Element                              id=gui_Close_middle
   Sleep                                      4
   Select Window                              MAIN
   Select Frame                               id=bottom
   Wait Until Page Contains                   ${ContractName}
   Click Element                              id=gui_New_Contract/PO_middle
   Sleep                                      3
   Unselect Frame
   Select Window                              NEW
   Select From List By Label                  id=contracttype_dd                    Standard
   Input Text                                 id=CommitmentName                     ${PurchaseOrderName}
   Select From List By Label                  id=statusDropDown                     Issued / Awarded
   Select From List By Label                  id=commitmenttype                     Purchase Order
   Click Element                              id=gui_Next_middle
   Click Element                              id=gui_Save_middle
   Select Window                              MAIN
   Select Frame                               id=bottom
   Click Element                              id=dir2
   Wait Until Page Contains                   Issued
   Wait Until Page Contains                   Awarded
   Click Element                              xpath=/html/body/table[2]/tbody/tr/td[1]/table/tbody/tr[3]/td/table/tbody/tr[1]/td/a/img
   Log to Console                              ~**Cost Tracking Contract/Purchase Order Creation Validated Successfully**~

###########################################################################################################################

Cost Tracking Work Order/Change Order Creation
  # ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
#   Select Frame                               id=top
#   Click Element                              link=Budget
#   Sleep                                      3
#   Unselect Frame
#   Select Frame                               id=bottom
#   Click Element                              link=${BudgetName}
#   Click Element                              link=Work Orders and Change Orders
   Sleep                                      2
   Click Element                              id=gui_Create_New_Change_Order_middle
   Unselect Frame
   Select Window                              NEW
   Select Frame                               name=popmain
   Sleep                                      4
   Select From List By Label                  name=RecipientID                        Expesite Support
   Input Text                                 name=subject                            ${WorkOrderName}
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
   Input Text                                 name=subject                            ${WorkOrderName}
   Click Element                              id=gui_Continue_middle
   Click Element                              id=gui_Close_middle
   Unselect Frame

###########################################################################################################################

Cost Tracking Payment App/Invoice Creation
   ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
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
   Unselect Frame
   Select Frame                              id=top
   Click Element                             link=Documents
   Sleep                                     10
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=folders
   Select Frame                              name=folderbrowsemain
   Wait Until Page Contains                  ${FolderName} (0)
   Click Element                             link=${FolderName} (0)
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=dochead
   Click Element                             id=gui_Upload_middle
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
    Wait Until Page Contains                 Mobile Key Metrics by Employer
    Sleep                                    5
