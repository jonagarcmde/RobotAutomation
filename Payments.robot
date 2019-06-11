*** Settings ***
Library  Selenium2Library

*** Variables ***
#Login
${Url}                         http://exqa.accruentsystems.com:81/login/
${User}                        devteam
${Password}                    devteam123

#Access to the project
${ProjectName}                 BizTalk - CBRE - Associated Bank

#Cost Tracking Budget Creation
${BudgetType}                  Standard Construction Budget
${BudgetName}                  AutomatedSmokeChrome-19.03-2
${PaymentID}=                  Set variable                                                 0

#Cost Tracking Contract/Purchase Order Creation


###########################################################################################################################

*** Test Cases ***
Log in Accruent
   [Teardown]                  Close Browser
   Open Url In Chorme          ${Url}
   Input Test On Accruent
   Access to the project
   #Cost Tracking Budget Creation
   Cost Tracking Payment App/Invoice Creation

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

Cost Tracking Payment App/Invoice Creation
          # ${Numbers}=                                evaluate                              random.randint(1000, 100000)     random
           ${Value1}=                                 evaluate                              random.randint(100, 10000)     random
           ${Value2}=                                 evaluate                              random.randint(100, 10000)     random
           ${Tax}=                                    evaluate                              random.randint(1, 100)         random
           Select Frame                               id=top
           Click Element                              link=BizTalk - CBRE - Associated Bank
           Sleep                                      5
           Click Element                              link=Budget
           Unselect Frame
           Select Frame                               id=bottom
           Click Element                              link=Invoices and Payment Applications
          : FOR    ${INDEX}    IN RANGE       101
          \    ${Numbers}=                               evaluate                              random.randint(1000, 100000)     random
          \    ${Value1}=                                evaluate                              random.randint(100, 10000)     random
          \    ${Value2}=                                evaluate                              random.randint(100, 10000)     random
          \    ${Tax}=                                   evaluate                              random.randint(1, 100)         random
          \   Click Element                              id=gui_New_Payment_App/Invoice_middle
          \   Unselect Frame
          \   Select Window                              NEW
          \   Select Frame                               name=UpdatePayRequest
          \   Sleep                                      3
          \   Input Text                                 id=name                                         PA-${Numbers}
          \   Click Element                              id=gui_Next_middle
          \   Double Click Element                       id=laborSubTotal_3_2_0_0_42007806
          \   Input Text                                 id=laborSubTotal_3_2_0_0_42007806               ${Value1}
          \   Double Click Element                       id=laborSubTotal_12_10_0_0_42007815
          \   Input Text                                 id=laborSubTotal_12_10_0_0_42007815             ${Value2}
          \   Double Click Element                       name=TaxTotal
          \   Input Text                                 name=TaxTotal                                   ${Tax}
          \   Click Element                              name=FreightTotal
          \   Click Element                              id=gui_Save_middle
          \   Wait Until Page Contains                   PA-${Numbers}
          \   Click Element                              id=gui_Close_middle
          \   Log to Console                             PA-${Numbers}
          \   Select Window                              MAIN
          \   Select Frame                               id=bottom