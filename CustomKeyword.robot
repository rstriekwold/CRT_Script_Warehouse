*** Settings ***
Resource                      ./resources/common.robot
Library                       String
Library                       DateTime
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead                        Custom Keyword
    Appstate                  Home
    LaunchApp                 Sales

    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
    ClickText                 New                        anchor=Import
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    Picklist                  Salutation                  Ms.
    TypeText                  First Name                  Tina
    TypeText                  Last Name                   Smith
    Picklist                  Lead Status                 Working
    TypeText                  Phone                       +12234567858449             First Name
    TypeText                  Company                     Growmore                    Last Name
    TypeText                  Title                       Manager                     Address Information
    TypeText                  Email                       tina.smith@gmail.com        Rating
    TypeText                  Website                     https://www.growmore.com/

    ClickText                 Lead Source
    ClickText                 Advertisement
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     2
    
    ClickText                 Details                    anchor=Chatter
    VerifyText               Ms. Tina Smith
    VerifyText               Manager                     anchor=Title
    VerifyField               Phone                       +12234567858449
    VerifyField               Company                     Growmore
    VerifyField               Website                     https://www.growmore.com/

    # as an example, let's check Phone number format. Should be "+" and 14 numbers
    ${phone_num}=             GetFieldValue               Phone
    Should Match Regexp	      ${phone_num}	              ^[+]\\d{14}$
    
    ClickText                 Leads
    VerifyText                Tina Smith
    VerifyText                Manager
    VerifyText                Growmore

Delete Tina Smith's Lead
    [tags]                    Lead                        Custom Keyword
    LaunchApp                 Sales
    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
    
    Wait Until Keyword Succeeds   1 min   5 sec   ClickText    Tina Smith
    ClickText                    Show more actions
    ClickText                    Delete
    ClickText                    Delete
    ClickText                    Close
    VerifyNoText                 Tina Smith

Create Account Growmore
    [Tags]                        Account                Custom Keyword
    ${uniqueAccountName}=         Start New Account      Growmore    Get Current Date

    PickList                      Type            Competitor
    ClickText                     Website
    TypeText                      Website         www.growmore.org
    ClickText                     Phone
    TypeText                      Phone           1234567890
    PickList                      Industry        Banking
    ClickText                     Employees
    TypeText                      Employees       100
    ClickText                     Save            partial_match=false
    UseModal                      Off

    ClickText                 Details                    anchor=Related
    VerifyText               ${uniqueAccountName}
    VerifyText               ${uniqueAccountName}                    anchor=Account Name
    VerifyField               Phone                       (123) 456-7890
    VerifyField               Employees                   100
    VerifyField               Website                     www.growmore.org
    VerifyField               Industry                    Banking
