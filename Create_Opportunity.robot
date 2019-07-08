*** Settings ***

Resource  ..//Resources/Opportunity.robot

*** Test Cases ***

Create Opportunity

    Login to SFQA System
    Click on Opportunities Tab
    Click on the New Opportunity
    Select Account  DSB Test USA
    Select Site Partner  DSB Test USA
    Select Primary Contact Name  Gregory Tester 7
    Enter Opportunity Name
    Select Account Sector  Government
    Select Payer Same as Customer  Yes
    Enter Expected Close Date and Primary Quote Req.Delivery Date to Current Date
    Select Opportunity Stage  0 - NEW LEAD
    Select Existing Product Replacement  No
    Add Competitor Details
    Select Vendor  Accuray
    Select Product Name  CyberKnife
    Enter Isotope Source  Test
    Save Quote