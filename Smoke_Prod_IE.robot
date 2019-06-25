*** Settings ***
Library  Selenium2Library
Resource  Utilities.robot

*** Variables ***
#Login
${Url}                         https://www.expesite.com/login/
${User}                        jogarcia
${Password}                    J0n474ngap.

#Access to the project
${ProjectName}                 Karen's Test Project

#Validation Pay Apps
${LastNameBeginsWith}          Hill


#Cost Tracking Budget Creation
${BudgetType}                         Standard Construction Budget

#Cost Tracking Contract/Purchase Order Creation

#Cost Tracking Work Order/Change Order Creation

#Cost Tracking Payment App/Invoice Creation

#Documents

${ExcelRoute}                        C:\\TestUpload\\SmokeTestExcel.xlsx
${PDFRoute}                          C:\\TestUpload\\SmokeTestPDF.pdf
${ImageRoute}                        C:\\TestUpload\\SmokeTestImage.jpg
${MPPRoute}                          C:\\TestUpload\\2016.mpp


${ExcelName}                         SmokeTestExcel.xlsx
${PDFName}                           SmokeTestPDF.pdf
${ImageName}                         SmokeTestImage.jpg
${ImageName}                         SmokeTestImage.jpg
${MPPName}                           2016.mpp

#MixPanel Credentials
${UserMix}                        jonatan.garcia@contractors.accruent.com
${PasswordMix}                    j0n474n.

###########################################################################################################################

*** Test Cases ***
Log in Accruent
   [Teardown]                  Close Browser
   Open Url In Chorme          ${Url}
   Input Test On Accruent
   #Reports
   Access to the project
   #MPP File/Documents
   #Cost Tracking Budget Creation
   #Cost Tracking Bid Creation
   #Cost Tracking Contract/Purchase Order Creation
   #Cost Tracking Work Order/Change Order Creation
   #Cost Tracking Payment App/Invoice Creation
   Approval/Attach

###########################################################################################################################

*** Keywords ***

Open Url In Chorme
   [Arguments]                 ${Url}
   Open Browser                ${Url}   Internet Explorer
   Maximize Browser Window
   Wait Until Page Contains    Logi

###########################################################################################################################

Input Test On Accruent
   Input Text                   id=username         ${User}
 # Clear Element Text           id=username
   Input Text                   name=password       ${Password}
   Capture Page Screenshot      IE-EV{index}Login.png
   Click Button                 //input[@id='image1']
   Wait Until Page Contains     Expesite


###########################################################################################################################

Reports
   Log to Console                              - - - - - > TC_01 - Reports < - - - - -
   Sleep                                       2
   Select Frame                                id=top
   Click Element                               link=My Reports
   Click Element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Offline Surveys'])[1]/following::a[2]
   Wait Until Page Contains                    My Reports
   Unselect Frame
   Select Frame                                id=bottom
   #Select From List By Label                   name=ShowOnly                                Milestone Report
   Click Element                               link=2 Dawn's Test Report
   Wait Until Page Contains                    AlexTestProj
   Capture Page Screenshot                     IE-EV{index}Login.pn
   Click Element                               id=gui_Export_to_Excel_middle
   Unselect Frame
   Select Window                               NEW
   Click Element                               id=gui_Continue_middle
   Select Frame                                id=excelupper
   Maximize Browser Window
   Capture Page Screenshot                     IE-EV{index}ExportExcel1.png
   Sleep                                       1
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
   Capture Page Screenshot                     IE-EV{index}ExportExcel2.png
   Sleep                                       1
   Click Element                               id=gui_Close_middle
   Select Window                               MAIN
   Select Frame                                id=bottom
   Click Element                               id=gui_Print_View_middle
   Select Window                               NEW
   Wait Until Page Does Not Contain            The Print View of this Milestone Report is being generated.
   Capture Page Screenshot                     IE-EV{index}ExportPDF.png
   Unselect Frame
   Select Window                               MAIN
   Select Frame                                id=bottom
   Click Element                               id=gui_Back_middle
   Sleep                                       1
   Click Element                               id=gui_Back_middle
   Unselect Frame
   Log to Console                              -> Report Section Validated Successfully

###########################################################################################################################


Access to the project
   Sleep                                       2
   Select Frame                                id=bottom
   Click Element                               id=gui_Projects_with_Activity_middle
   Click Element                               link=Karen's Test Project
   Wait Until Page Contains                    Project Role Homepage
   Capture Page Screenshot                     IE-EV{index}AcessProject.png
   Unselect Frame

###########################################################################################################################

MPP File/Documents
   ${FolderName}=                            evaluate                                  random.randint(1000, 100000)             random
   Log to Console                            - - - - - > TC_02 - MPP File / Milestones < - - - - -
   Select Frame                              id=top
   Click Element                             link=Documents
   #Sleep                                     3
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=dochead
   Click Element                             id=gui_New_Folder_middle
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=content
   Input Text                                name=foldername                          ${FolderName}
   Capture Page Screenshot                   IE-EV{index}FolderCreation.png
   Click Element                             id=gui_Save_middle
   Log to Console                            Folder Name: ${FolderName}
   Unselect Frame
   Select Frame                              id=top
   Click Element                             link=Documents
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
   Choose File                               id=file1                                      ${MPPRoute}
   Click Element                             id=gui_Upload_middle
   Handle Alert                              ACCEPT
   Select Window                             NEW
   Wait Until Page Contains                  Enter Update Parameters
   Click Element                             name=autocompletesubs
   Click Element                             id=gui_Update_And_Notify_middle
   Click Element                             id=personcheckbox212215
   Click Element                             id=gui_Notify_middle
   Click Element                             id=gui_Close_middle
   Select Window                             MAIN
   Select Frame                              id=bottom
   Click Element                             id=gui_Do_It_Now_middle
   Click Element                             id=gui_Send_and_Copy_to_History_middle
   Wait Until Page Contains                  Success!
   Click Element                             id=gui_Continue_middle
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=content
   Capture Page Screenshot                   IE-EV{index}MPPFile.png
   Wait Until Page Contains                  ${MPPName}
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
   Sleep                                     2
   Wait Until Page Contains                  Success!
   Click Element                             id=gui_Do_It_Now_middle
   Click Element                             id=gui_Cancel_middle
   Unselect Frame
   Select Frame                              id=bottom
   Select Frame                              name=content
   Capture Page Screenshot                   IE-EV{index}Images.png
   Wait Until Page Contains                  ${ExcelName}
   Wait Until Page Contains                  ${PDFName}
   Wait Until Page Contains                  ${ImageName}
   Unselect Frame
   Log to Console                           -> MPP File / Milestones Validated Successfully


###########################################################################################################################


Cost Tracking Budget Creation
   Log to Console                             - - - - - > TC_03 - Budget Creation < - - - - -
   ${BudgetName}=                             evaluate                              random.randint(1000, 100000)            random
   Select Frame                               id=top
   Click Element                              link=Budget
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              id=gui_New_Budget_middle
   Unselect Frame
   Select Frame                               id=bottom
   Select From List By Label                  name=Standard                       Standard Construction Budget
   Click Element                              id=gui_Do_It_Now_middle_3
   Unselect Frame
   Select Frame                               id=bottom
   Input Text                                 name=budgetname                      ${BudgetName}
   Capture Page Screenshot                    IE-EV{index}BudgetCreation.png
   Click Element                              id=gui_Save_middle
   Click Element                              link=${BudgetName}
   Log to Console                             Budget Name: ${BudgetName}
   Log to Console                             -> Budget Creation Validated Successfully
   Sleep                                      3

###########################################################################################################################

Cost Tracking Bid Creation

   ${BidName}=                                evaluate                              random.randint(100, 10000)     random
#   Select Frame                               id=top
#   Click Element                              link=Budget
#   Sleep                                      3
#   Unselect Frame
#   Select Frame                               id=bottom
#   Click Element                              link=16545
   Click Element                              link=Bid Package
   Select From List By Label                  name=contracttype                     Standard
   Input Text                                 name=txtname                          ${BidName}
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
   Sleep                                       2
   Select Window                               NEW
   Handle Alert                                DISMISS
   Select Frame                                name=AddLineItemstoRFQ
   Click Element                               //input[starts-with(@id,'T_')]
   Click Element                               id=gui_Save_middle
   Unselect Frame
   Select Window                               MAIN
   Select Frame                                id=bottom
   Wait Until Page Contains                    Selected
   Click Element                               id=gui_Attachments_middle
   Unselect Frame
   Select Window                               NEW
   Select Frame                                name=MainAttachments
   Wait Until Page Contains                    There are no reference documents.
   Click Element                               id=gui_Attach_middle
   Choose File                                 id=file1                                      ${ExcelRoute}
   Choose File                                 id=file1                                      ${PDFRoute}
   Choose File                                 id=file1                                      ${ImageRoute}
   Click Element                               id=gui_Upload_middle
   Wait Until Page Contains                    ${ExcelName}
   Wait Until Page Contains                    ${PDFName}
   Wait Until Page Contains                    ${ImageName}
   Unselect Frame
   Select Window                               MAIN
   Select Frame                                id=bottom
   Capture Page Screenshot                     IE-EV{index}BidCreation.png
   Click Element                               id=gui_Send_middle
   Wait Until Page Contains                    Sealed
   Click Element                               xpath=/html/body/table[2]/tbody/tr/td[1]/table/tbody/tr[3]/td/table/tbody/tr[1]/td/a
   Select From List By Label                   name=NavChange                                 Track - By Contract / PO



###########################################################################################################################

Cost Tracking Contract/Purchase Order Creation
   Log to Console                              - - - - - > TC_04 - Contract/Purchase Order Creation < - - - - -
   ${ContractName}=                            evaluate                                  random.randint(1000, 100000)             random
   ${PurchaseOrderName}=                       evaluate                                  random.randint(1000, 100000)             random
   ${Numbers}=                                 evaluate                                  random.randint(100, 10000)               random
   ${CValues}=                                 evaluate                                  random.randint(100000, 1000000)          random
#   Select Frame                               id=top
#   Click Element                              link=Budget
#   Sleep                                      3
#   Unselect Frame
#   Select Frame                               id=bottom
#   Click Element                              link=${BudgetName}
   Click Element                              link=Contracts and Purchase Orders
   Click Element                              id=gui_New_Contract/PO_middle
   Sleep                                      2
   Unselect Frame
   Select Window                              NEW
   Select From List By Label                  id=contracttype_dd                    Standard
   Input Text                                 id=CommitmentName                     ${ContractName}
   Select From List By Label                  id=statusDropDown                     Issued / Awarded
   Select From List By Label                  id=commitmenttype                     Contract
   Capture Page Screenshot                    IE-EV{index}ContractCreation.png
   Click Element                              id=gui_Next_middle
   Maximize Browser Window
   Click Element                              name=AllAll
   Click Element                              id=gui_Save_middle
#   Sleep                                      3
   #General Requirements
   Double Click Element                       //input[starts-with(@id,'laborUnits_')]
   Input Text                                 //input[starts-with(@id,'laborUnits_')]                     2
   Double Click Element                       //input[starts-with(@id,'laborUnitCost_')]
   Input Text                                 //input[starts-with(@id,'laborUnitCost_')]                  ${CValues}
   Double Click Element                       //input[starts-with(@id,'materialUnits_')]
   Input Text                                 //input[starts-with(@id,'materialUnits_')]                  2
   Double Click Element                       //input[starts-with(@id,'materialUnitCost_')]
   Input Text                                 //input[starts-with(@id,'materialUnitCost_')]               ${CValues}
   Click Element                              id=gui_Save_middle
   Sleep                                      1
   Select Window                              MAIN
   Select Frame                               id=bottom
   Click Element                              id=gui_New_Contract/PO_middle
   Sleep                                      3
   Unselect Frame
   Log to Console                             Contract Name: ${ContractName}
   Log to Console                             -> Contract Creation Validated Successfully
   Select Window                              NEW
   Select From List By Label                  id=contracttype_dd                    Standard
   Input Text                                 id=CommitmentName                     ${PurchaseOrderName}
   Select From List By Label                  id=statusDropDown                     Issued / Awarded
   Select From List By Label                  id=commitmenttype                     Purchase Order
   Capture Page Screenshot                    IE-EV{index}PurchaseCreation.png
   Click Element                              id=gui_Next_middle
   Click Element                              name=AllLabor
   Click Element                              id=gui_Save_middle
#   Double Click Element                       //input[starts-with(@id,'laborUnits_')]
#   Input Text                                 //input[starts-with(@id,'laborUnits_')]                     2
#   Double Click Element                       //input[starts-with(@id,'laborUnitCost_')]
#   Input Text                                 //input[starts-with(@id,'laborUnitCost_')]                  1000
#   Double Click Element                       //input[starts-with(@id,'materialUnits_')]
#   Input Text                                 //input[starts-with(@id,'materialUnits_')]                  2
#   Double Click Element                       //input[starts-with(@id,'materialUnitCost_')]
#   Input Text                                 //input[starts-with(@id,'materialUnitCost_')]               1000
#   Click Element                              id=gui_Save_middle
   Select Window                              MAIN
   Select Frame                               id=bottom
   Click Element                              id=dir2
   Capture Page Screenshot                    IE-EV{index}Contract-PurchaseCreation.png
   Wait Until Page Contains                   Issued
   Wait Until Page Contains                   Awarded
   Click Element                              xpath=/html/body/table[2]/tbody/tr/td[1]/table/tbody/tr[3]/td/table/tbody/tr[1]/td/a/img
   Log to Console                              Purchase Order Name: ${PurchaseOrderName}
   Log to Console                              -> Purchase Order Creation Validated Successfully

###########################################################################################################################

Cost Tracking Work Order/Change Order Creation
   Log to Console                              - - - - - > TC_05 - Work Order/Change Order Creation < - - - - -
   ${WorkOrderName}=                            evaluate                                  random.randint(1000, 100000)             random
   ${ChangeOrderName}=                          evaluate                                  random.randint(1000, 100000)             random
#   Select Frame                               id=top
#   Click Element                              link=Budget
#   Sleep                                      3
#   Unselect Frame
#   Select Frame                               id=bottom
#   Click Element                              link=${BudgetName}
#   Click Element                              link=Work Orders and Change Orders
#   Sleep                                      2
   Click Element                              id=gui_Create_New_Work_Order_middle
   Unselect Frame
   Select Window                              NEW
   Select Frame                               name=popmain
   Wait Until Page Contains                   From:
   Select From List By Label                  name=senderID                           Expesite Support
   Input Text                                 name=subject                            ${WorkOrderName}
   Capture Page Screenshot                    IE-EV{index}WorkOrderCreation.png
   Click Element                              id=gui_Save_middle
   Sleep                                      5
   Click Element                              id=gui_Add/Remove_Line_Items_middle
   Click Element                              id=lineItemIDs1
   Click Element                              id=gui_Save_middle
   Double Click Element                       //input[starts-with(@id,'laborUnits_')]
   Input Text                                 //input[starts-with(@id,'laborUnits_')]                     2
   Double Click Element                       //input[starts-with(@id,'laborUnitCost_')]
   Input Text                                 //input[starts-with(@id,'laborUnitCost_')]                  1000
   Double Click Element                       //input[starts-with(@id,'materialUnits_')]
   Input Text                                 //input[starts-with(@id,'materialUnits_')]                  2
   Double Click Element                       //input[starts-with(@id,'materialUnitCost_')]
   Input Text                                 //input[starts-with(@id,'materialUnitCost_')]               1000
   Click Element                              id=gui_Save_middle
   Unselect Frame
   Select Window                              MAIN
   Select Frame                               id=bottom
   Sleep                                      5
   Click Element                              link=Work Order 1
   Unselect Frame
   Select Window                              NEW
   Select Frame                               name=popmain
   Click Element                              id=gui_Approve_middle
   Click Element                              id=gui_Send_middle
   Capture Page Screenshot                    IE-EV{index}WorkOrderValidation.png
   Wait Until Page Contains                   Approved
   Unselect Frame
   Log to Console                             Work Order Name: ${WorkOrderName}
   Log to Console                             -> Work Order Creation Validated Successfully
   Select Window                              MAIN
   Select Frame                               id=bottom
   Click Element                              id=gui_Create_New_Change_Order_middle
   Unselect Frame
   Select Window                              NEW
   Select Frame                               name=popmain
   Sleep                                      10
   Select From List By Index                  name=CommitmentandBudgetID                1
   Wait Until Page Contains                   From:
   Select From List By Label                  name=senderID                             Expesite Support
   Input Text                                 name=subject                              ${ChangeOrderName}
   Capture Page Screenshot                    IE-EV{index}ChangeOrderCreation.png
   Click Element                              id=gui_Continue_middle
   Click Element                              id=gui_Add_middle
   Double Click Element                       //input[starts-with(@id,'laborUnits_')]
   Input Text                                 //input[starts-with(@id,'laborUnits_')]                     1
   Double Click Element                       //input[starts-with(@id,'laborUnitCost_')]
   Input Text                                 //input[starts-with(@id,'laborUnitCost_')]                  10
   Double Click Element                       //input[starts-with(@id,'materialUnits_')]
   Input Text                                 //input[starts-with(@id,'materialUnits_')]                  1
   Double Click Element                       //input[starts-with(@id,'materialUnitCost_')]
   Input Text                                 //input[starts-with(@id,'materialUnitCost_')]               10
   Click Element                              id=gui_Save_middle
   Sleep                                      2
   Unselect Frame
   Log to Console                             Change Order Name: ${ChangeOrderName}
   Log to Console                             -> Change Order Creation Validated Successfully
 #  Select Window                              MAIN
#   Select Frame                               id=bottom
#   Click Element                              link=Change Order 1
#   Unselect Frame
#   Select Window                              NEW
#   Select Frame                               name=popmain
#   Click Element                              id=gui_View/Edit_middle
#   Select Window                              NEW
#   Select Frame                               name=MainAttachments
#   Sleep                                      2
#   Click Element                              id=gui_Attach_middle
#   Upload File
#   Select Window                              MAIN
#   Select Frame                               id=bottom
#   Sleep                                      6
#   Select From List By Label                  name=NavChange                       Track - Invoices/Payment Applications
#   Wait Until Page Contains                   There are no Payment Requests for this Budget.
#   Click Element                              link=Change Order 15
#   Unselect Frame
#   Select Window                              NEW
#   Select Frame                               name=popmain
#   Click Element                              id=gui_Approve_middle
#   Click Element                              id=gui_Send_middle
#   Wait Until Page Contains                   Approved




###########################################################################################################################

Cost Tracking Payment App/Invoice Creation
   Log to Console                             - - - - - > TC_06 - Payment App/Invoice Creation < - - - - -
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Sleep                                      3
   Click Element                              link=85334
   Click Element                              link=Invoices and Payment Applications
   Click Element                              id=gui_New_Payment_App/Invoice_middle
   Unselect Frame
   Select Window                              NEW
   Sleep                                      4
   Select Frame                               name=UpdatePayRequest
   Sleep                                      2
  # Select From List By Index                  id=SelectedCommitmentID                   1
   Input Text                                 id=name                                   PayApp_01
   Capture Page Screenshot                    IE-EV{index}PayAppCreation.png
   Click Element                              id=gui_Next_middle
   Sleep                                      2
   Maximize Browser Window
   Double Click Element                       //input[starts-with(@id,'laborSubTotal_')]
   Input Text                                 //input[starts-with(@id,'laborSubTotal_')]                  100
   Double Click Element                       //input[starts-with(@id,'materialSubTotal_')]
   Input Text                                 //input[starts-with(@id,'materialSubTotal_')]               100
   Double Click Element                       //input[starts-with(@id,'otherCost_')]
   Input Text                                 //input[starts-with(@id,'otherCost_')]                      100
   Click Element                              id=gui_Save_middle
   Log to Console                             Pay App Name: PayApp_01
#   Click Element                              id=gui_View/Edit_middle
#   Unselect Frame
#   Select Window                              NEW
#   Select Frame                               name=MainAttachments
#   Sleep                                      2
#   Click Element                              id=gui_Attach_middle
#   Upload File
    Unselect Frame
    Select Window                              MAIN
    Select Frame                               id=bottom
    Select From List By Label                  name=NavChange                       Track - Changes


Approval/Attach
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              link=85334
   Click Element                              link=Work Orders and Change Orders
   Click Element                              link=Change Order 1
   Unselect Frame
   Select Window                              NEW
   Sleep                                      5
   Select Frame                               name=popmain
   Sleep                                      5
   Click Element                              id=gui_Approve_middle
   Sleep                                      2
   Click Element                              id=gui_Send_middle
   Capture Page Screenshot                    IE-EV{index}ChangeOrderValidation.png
   Wait Until Page Contains                   Approved
#   Click Element                              id=gui_View/Edit_middle
#   Select Window                              NEW
#   Sleep                                      10
#   Select Frame                               name=MainAttachments
#   Sleep                                      2
#   Click Element                              id=gui_Attach_middle
#   Upload File
#   Sleep                                      5
   Unselect Frame
   Select Window                              MAIN
   Sleep                                      2
   Select Frame                               id=bottom
   Wait Until Page Contains                   Approved
   Select From List By Label                  name=NavChange                       Track - Invoices/Payment Applications
   Sleep                                      2
   Click Element                              link=PayApp_01
   Unselect Frame
   Select Window                              NEW
   Sleep                                      2
   Select Frame                               name=UpdatePayRequest
   Sleep                                      2
   Click Element                              id=gui_Approve_middle
   Sleep                                      2
   Click Element                              id=gui_Send_middle
   Capture Page Screenshot                    IE-EV{index}PayAppValidation.png
   Wait Until Page Contains                   Approved
#   Click Element                              id=gui_View/Edit_middle
#   Select Window                              NEW
#   Select Frame                               name=MainAttachments
#   Sleep                                      2
#   Click Element                              id=gui_Attach_middle
#   Upload File
#   Sleep                                      5
#   Unselect Frame
   Select Window                              MAIN
   Sleep                                      2
   Select Frame                               id=bottom
   Wait Until Page Contains                   Approved


MixPanel Validation
    Open Browser                             https://mixpanel.com/report/1152088/dashboard#id=31881               Chrome
    Input Text                               id=id_email                                ${UserMix}
    Input Text                               id=id_password                             ${PasswordMix}
    Click Element                            xpath=//*[@id="bottom"]/input
    Click Element                            xpath=//*[@id="wrapper"]/mp-chrome-header/div/div[1]/div/div[1]/a
    Wait Until Page Contains                 Mobile Key Metrics by Employer
    Sleep                                    5

