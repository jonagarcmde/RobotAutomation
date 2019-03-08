*** Settings ***
Library  Selenium2Library

*** Test Cases ***
Log in Accruent
   [Teardown]                  Close Browser
   Open Url In Chorme          https://uat.verisae.com/DataNett/pcc/login.html
   Input Test On Accruent

*** Keywords ***
Open Url In Chorme
   [Arguments]                 ${url}
   Open Browser                ${url}   Chrome
   Wait Until Page Contains    Login

Input Test On Accruent
   Input Text                 id=login         maira.molina
   sleep                      1
   Input Text                 name=password
   sleep                      1
   Click Link                 link=Login
   sleep                      1
   Wait Until Page Contains   Verisae
   sleep                      1

#Radio Buttons
#Select Radio Button           [Group]             [Value]
#Select Radio Button           add_type            office

#CheckBoxes
#Select Checkbox                Attribute:value
#Select Checkbox                name:terms

#LinkText
#Click Link                      //tag[text()='text to find']
#Click Link                      //a[text()='Forgotten Accoutn?']