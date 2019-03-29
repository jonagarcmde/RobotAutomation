*** Settings ***
Library  Selenium2Library

*** Variables ***
#Login
${Url}                         https://www.expesite.com/login/##0f92
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
   #Reports
   Access to the project
   #Cost Tracking Budget Creation
   #Cost Tracking Bid Creation
   Cost Tracking Contract/Purchase Order Creation
   #Cost Tracking Work Order/Change Order Creation
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

Access to the project
   Select Frame                                id=bottom
   Click Element                               id=gui_Projects_with_Activity_middle
   Click Element                               link=Karen's Test Project
   Wait Until Page Contains                    Project Role Homepage
   Unselect Frame
   Log to Console                              ~**Access to the Project Validated Successfully**~

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
   Sleep                                      4




   Sleep                                      5
#  # sleep                                      5
# #  maximize browser window
#   click element                              id=gui_Save_middle
# #  maximize browser window
#  # click element                              id=gui_Close_middle
#   select window                              MAIN
#   Select Frame                               id=bottom
#   click element                              id=gui_New_Contract/PO_middle
#   sleep                                      3
#   unselect frame
#   select window                              NEW
#   select from list by label                  id=contracttype_dd                    Standard
#   input text                                 id=CommitmentName                     PurchaseOrderStage19.02
#   select from list by label                  id=statusDropDown                     Issued / Awarded
#   select from list by label                  id=commitmenttype                     Purchase Order
#   click element                              id=gui_Next_middle
#   click element                              id=gui_Save_middle
#   select window                              MAIN
#   Select Frame                               id=bottom
#   sleep                                      3
#   select from list by label                  name=NavChange                         Plan - Line Items by Provider
#   sleep                                      3
#   select from list by label                  name=NavChange                         Plan - Contracts/Purchase Orders
#   wait until page contains                   Issued
#   wait until page contains                   Awarded
#   Click Element                              xpath=/html/body/table[2]/tbody/tr/td[1]/table/tbody/tr[3]/td/table/tbody/tr[1]/td/a/img
#   Log to Console                              ~**Cost Tracking Contract/Purchase Order Creation Validated Successfully**~