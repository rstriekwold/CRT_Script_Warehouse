*** Settings ***
Library    QWeb
Resource                      ./resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite

*** Test Cases ***

Create Account Growmore and delete
    [Tags]                        testgen            growmore
    Appstate                      Home
    LaunchApp                     Sales
    ClickText                     Accounts
    ClickText                     New
    UseModal                      On
    VerifyText                    Save              timeout=4          
    TypeText                      Account Name      [Growmore, Growless]
    PickList                      Type              Competitor
    ClickText                     Website
    TypeText                      Website           www.growmore.org
    ClickText                     Phone
    TypeText                      Phone             1234567890
    PickList                      Industry          Banking
    ClickText                     Employees
    TypeText                      Employees         100
    ClickText                     Save              partial_match=false
    UseModal                      Off
    ClickText                     Details           anchor=Related
    VerifyText                    Growmore
    VerifyText                    Growmore          anchor=Account Name
    VerifyField                   Phone             (123) 456-7890
    VerifyField                   Employees         100
    VerifyField                   Website           www.growmore.org
    VerifyField                   Industry          Banking
    ClickText                     Delete
    UseModal                      On
    ClickText                     Delete
    UseModal                      Off
