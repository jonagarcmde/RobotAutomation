*** Settings ***
Library  Selenium2Library

*** Variables ***
#Login
${Url}                         https://stage.expesite.com/altlogin/default.asp
${User}                        devteam
${Password}                    Stagedevteam123*

#Access to the project
${ProjectName}                 Karen's Test Project

#Validation Pay Apps
${LastNameBeginsWith}          Hill


#Cost Tracking Budget Creation
${BudgetType}                  Standard Construction Budget
${BudgetName}                  AutomatedSmokeChrome-19.4.0

#Cost Tracking Contract/Purchase Order Creation


#Documents
${FolderName}                        Testing Upload Automatically
${ExcelRoute}                        C:\\TestUpload\\SmokeTestExcel.xlsx
${PDFRoute}                          C:\\TestUpload\\SmokeTestPDF.pdf
${ImageRoute}                        C:\\TestUpload\\SmokeTestImage.jpg
${Image2Route}                       C:\\TestUpload\\Testing;.PNG
${Image3Route}                       C:\\TestUpload\\;Hola.png
${Image4Route}                       C:\\TestUpload\\ex_qae.PNG
${Image5Route}                       C:\\TestUpload\\ex_qae.PNG
${Image6Route}                       C:\\TestUpload\\ho;la.png

${ExcelName}                         SmokeTestExcel.xlsx
${PDFName}                           SmokeTestPDF.pdf
${ImageName}                         SmokeTestImage.jpg
${Image2Name}                        Testing;.PNG
${Image3Name}                        ;Hola.png
${Image4Name}                        ex_qae.PNG
${Image5Name}                        ex_qae.PNG
${Image6Name}                        ho;la.png





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
   #Cost Tracking Work Order/Change Order Creation
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

Access to the project
   Select Frame                                id=bottom
   Select From List By Label                   id=criteriatype          Projects
   Input Text                                  id=project_keywords      ${ProjectName}
   Sleep                                       2
   Click Element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='Search'])[1]/following::font[2]
   Unselect Frame

###########################################################################################################################

Reports
   Select Frame                                id=top
   Click Element                               link=My Reports
   Click Element                               xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Offline Surveys'])[1]/following::a[2]
   Wait Until Page Contains                    My Reports
   Unselect Frame
   Select Frame                                id=bottom
   #Select From List By Label                   name=ShowOnly                                Milestone Report
   Click Element                               link=BB&T Test
   Wait Until Page Contains                    AL - Alexander City, 2055 Cherokee Road [101098]
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
   Select Window                               MAIN
   Select Frame                                id=bottom
   Click Element                               id=gui_Back_middle
   Wait Until Page Contains                    My Reports
   Select From List By Label                   name=ShowOnly                                Data Export Report
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
   Click Element                          link=Admin
   Select Window                          NEW
   Click Element                          link=Assume Another User's Identity
   Sleep                                  5
   Input Text                             name=LastNameBeginsWith             ${LastNameBeginsWith}
   click button                           name=GO
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
    wait until element is not visible     error


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
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              link=${BudgetName}
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

###########################################################################################################################

Cost Tracking Work Order/Change Order Creation
  # ${Numbers}=                                evaluate                              random.randint(100, 10000)     random
   Select Frame                               id=top
   Click Element                              link=Budget
   Sleep                                      3
   Unselect Frame
   Select Frame                               id=bottom
   Click Element                              link=${BudgetName}
   Click Element                              link=Work Orders and Change Orders
   Sleep                                      2
   Click Element                              id=gui_Create_New_Change_Order_middle
   Unselect Frame
   Select Window                              NEW
   Select Frame                               name=popmain
   Sleep                                      4
   Select From List By Label                  name=RecipientID                        Expesite Support
   Input Text                                 name=subject                            WorkOrderStage19.03
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
   Input Text                                 name=subject                            ChangeOrderStage19.03
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
   Choose File                               id=file1                                      ${Image2Route}
   Choose File                               id=file1                                      ${Image3Route}
   Choose File                               id=file1                                      ${Image4Route}
   Choose File                               id=file1                                      ${Image5Route}
   Choose File                               id=file1                                      ${Image6Route}
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
   Wait Until Page Contains                  ${Image2Name}
   Wait Until Page Contains                  ${Image3Name}
   Wait Until Page Contains                  ${Image4Name}
   Wait Until Page Contains                  ${Image5Name}
   Wait Until Page Contains                  ${Image6Name}


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
   Click Element                          link=Admin
   Select Window                          NEW
   Click Element                          link=Fix payment application: Costs are not loading
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
   Click Element                          link=Admin
   Select Window                          NEW
   Click Element                          link=Assume Another User's Identity
   Sleep                                  5
   Input Text                             name=LastNameBeginsWith             McAleenan
   click button                           name=GO
   Click Element                          link=McAleenan, Natasha
   Sleep                                  5
   Select Window                          NEW
   Sleep                                  5
   Select Frame                           id=top
   Click Element                          link=My World
   Click Element                          link=My Inbox
   Unselect Frame

Cost Tracking - Vendor Work Order Response
   Select Frame                              id=bottom
   Click Element                             id=gui_Send_Work_Order_middle
   Select Window                             NEW
   Select Frame                              name=popmain
   Sleep                                     4
   Select From List By Label                 id=CommitmentID                         [Karen's Test Project ] - BidStageE19.02 52895
   Wait Until Page Contains                  Custom Wo 4:
   Select From List By Label                 id=RecipientID                          Expesite Support
   Input Text                                id=subject                              Testing
   Click Element                             id=gui_Save_middle
   Click Element                             id=gui_Close_middle

MixPanel Validation
    Open Browser                             https://mixpanel.com/report/1152088/dashboard#id=31881               Chrome
    Input Text                               id=id_email                                ${UserMix}
    Input Text                               id=id_password                             ${PasswordMix}
    Click Element                            xpath=//*[@id="bottom"]/input
    Click Element                            xpath=//*[@id="wrapper"]/mp-chrome-header/div/div[1]/div/div[1]/a
    Wait Until Page Contains                 Mobile Key Metrics by Employer
    Sleep                                    5


Conditionals
    ${x}=                                   Set Variable                                Simplex
    Run keyword if                          "${x}" == "Simple"
    ...                                     Log to console                              A
    ...                                     ELSE
    ...                                     Log to console                              B