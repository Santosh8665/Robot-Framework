*** Settings ***

Library  SeleniumLibrary
Library  DateTime
Library  String

*** Variables ***

${Browser}  Chrome
${Url}  https://test.salesforce.com/
${Username}  vms-tosca.testing@varian.com.sfqa
${Password}  Varian@123

*** Keywords ***

Login to SFQA System

    Open Browser  ${Url}  ${Browser}
    SeleniumLibrary.Maximize Browser Window
    Input Text  id:username  ${Username}
    Input Text  id:password  ${Password}
    Select Checkbox  id:rememberUn
    Click Button  name:Login

Click on Opportunities Tab

    Wait Until Element Is Visible  //nav[@class='appLauncher slds-context-bar__icon-action']//button  timeout=1 min 30 s
    Sleep  3s
    click element  //nav[@class='appLauncher slds-context-bar__icon-action']//button
    Wait Until Element Is Visible  xpath=(//span[contains(text(),'Opportunities')])[4]  timeout=1 min 30 s
    click element  xpath=(//span[contains(text(),'Opportunities')])[4]
    Wait Until Element Is Visible  //span[@title="Opportunity Name"]  timeout=1 min 30 s

Click on the New Opportunity

    Wait Until Element Is Visible  //div[@title="New"]  timeout=1 min 30 s
    Click Element  //div[@title="New"]
    Wait Until Element Is Visible  //iframe[@title='accessibility title']  timeout=1 min 30 s
    Select Frame  //iframe[@title='accessibility title']

Select Account

    [Arguments]  ${Account}
    Wait Until Element Is Visible  //button[@name='oppAccountId-oppAccountName-Account-Account']  timeout=1 min 30 s
    Sleep  5s
    Click Element  //button[@name='oppAccountId-oppAccountName-Account-Account']
    Input Text  xpath=(//input[@class='slds-input input uiInput uiInputText uiInput--default uiInput--input'])[3]  ${Account}
    Press Key  xpath=(//input[@class='slds-input input uiInput uiInputText uiInput--default uiInput--input'])[3]  \\13
    Sleep  1s
    Wait Until Element Is Visible  //table[@class='slds-table slds-table--bordered slds-max-medium-table--stacked-horizontal']/tbody/tr[1]/td[1]/a  timeout=1 min 30 s
    Click Link  //table[@class='slds-table slds-table--bordered slds-max-medium-table--stacked-horizontal']/tbody/tr[1]/td[1]/a

Select Site Partner

    [Arguments]  ${Site Partner}
    Wait Until Element Is Visible  //button[@name='oppSitePartnerId-oppSitePartnerName-Account-Account']  timeout=1 min 30 s
    Click Button  //button[@name='oppSitePartnerId-oppSitePartnerName-Account-Account']
    Wait Until Element Is Visible  xpath=(//input[@class='slds-input input uiInput uiInputText uiInput--default uiInput--input'])[3]  timeout=1 min 30 s
    Input Text  xpath=(//input[@class='slds-input input uiInput uiInputText uiInput--default uiInput--input'])[3]  ${Site Partner}
    Press Key  xpath=(//input[@class='slds-input input uiInput uiInputText uiInput--default uiInput--input'])[3]  \\13
    Sleep  1s
    Wait Until Element Is Visible  //table[@class='slds-table slds-table--bordered slds-max-medium-table--stacked-horizontal']/tbody/tr[1]/td[1]/a  timeout=1 min 30 s
    Click Link  //table[@class='slds-table slds-table--bordered slds-max-medium-table--stacked-horizontal']/tbody/tr[1]/td[1]/a

Select Primary Contact Name

    [Arguments]  ${Primary Contact Name}
    Wait Until Element Is Visible  //button[@name='oppPrimaryContactId-oppPrimaryContactName-Contact-Contact']
    Click Button  //button[@name='oppPrimaryContactId-oppPrimaryContactName-Contact-Contact']
    Wait Until Element Is Visible  xpath=(//input[@class='slds-input input uiInput uiInputText uiInput--default uiInput--input'])[3]  timeout=1 min 30 s
    Input Text  xpath=(//input[@class='slds-input input uiInput uiInputText uiInput--default uiInput--input'])[3]  ${Primary Contact Name}
    Press Key  xpath=(//input[@class='slds-input input uiInput uiInputText uiInput--default uiInput--input'])[3]  \\13
    Sleep  1s
    Wait Until Element Is Visible  //table[@class='slds-table slds-table--bordered slds-max-medium-table--stacked-horizontal']/tbody/tr[1]/td[1]/a  timeout=1 min 30 s
    Click Link  //table[@class='slds-table slds-table--bordered slds-max-medium-table--stacked-horizontal']/tbody/tr[1]/td[1]/a

Enter Opportunity Name

    ${random}  Generate Random String  3  [NUMBERS]
    Set Test Variable  ${Opportunity Name}  360 Oncology ${random}
    Wait Until Element Is Visible  (//label[@class='slds-form-element__label uiLabel-left form-element__label uiLabel'])[1]//following-sibling::input  timeout=1 min 30 s
    Input Text  (//label[@class='slds-form-element__label uiLabel-left form-element__label uiLabel'])[1]//following-sibling::input  ${Opportunity Name}

Select Account Sector

    [Arguments]  ${Account Sector}
    Wait Until Element Is Visible  (//select[@class='slds-input requiredField select'])[1]
    Select From List By Value  (//select[@class='slds-input requiredField select'])[1]  ${Account Sector}

Select Payer Same as Customer

    [Arguments]  ${Payer Same as Customer}
    Wait Until Element Is Visible  (//select[@class='slds-input requiredField select'])[2]
    Select From List By Value  (//select[@class='slds-input requiredField select'])[2]  ${Payer Same as Customer}

Enter Expected Close Date and Primary Quote Req.Delivery Date to Current Date

    Wait Until Element Is Visible  //input[@class='expectedclosedate requiredField input']
    ${date}=  Get Current Date  result_format=%b %d, %Y
    Input Text  //input[@class='expectedclosedate requiredField input']  ${date}
    Wait Until Element Is Visible  (//input[@class='expectedclosedate input'])[2]
    Input Text  (//input[@class='expectedclosedate input'])[2]  ${date}

Select Opportunity Stage

    [Arguments]  ${Opportunity Stage}
    Wait Until Element Is Visible  (//select[@class='slds-input requiredField select'])[5]
    Select From List By Value  (//select[@class='slds-input requiredField select'])[5]  ${Opportunity Stage}

Select Existing Product Replacement

    [Arguments]  ${Existing Product Replacement}
    Wait Until Element Is Visible  (//select[@class='slds-input requiredField select'])[6]
    Select From List By Value  (//select[@class='slds-input requiredField select'])[6]  ${Existing Product Replacement}

Add Competitor Details

    Execute JavaScript  window.scrollTo(0,2000)
    Wait Until Element Is Visible  (//button[@class='slds-button slds-button_neutral'])[1]
    Click Button  (//button[@class='slds-button slds-button_neutral'])[1]
    Sleep  1s

Select Vendor

    [Arguments]  ${Vendor}
    Wait Until Element Is Visible  (//select[@class='slds-select'])[5]
    Select From List By Value  (//select[@class='slds-select'])[5]  ${Vendor}

Select Product Name

    [Arguments]  ${Product Name}
    Wait Until Element Is Visible  (//select[@class='slds-select'])[6]
    Select From List By Value  (//select[@class='slds-select'])[6]  ${Product Name}

Enter Isotope Source

    [Arguments]  ${Isotope Source}
    Wait Until Element Is Visible  (//input[@class=' input uiInput uiInputText uiInput--default uiInput--input'])
    Input Text  (//input[@class=' input uiInput uiInputText uiInput--default uiInput--input'])  ${Isotope Source}

Save Quote

    Click Element  //button[@class='slds-button slds-button_brand slds-button slds-button--brand']
    #Sleep  1s
    Handle Alert
    Sleep  3s
    Wait Until Element Is Visible  //div[@title='Clone']  timeout=1 min 30 s
