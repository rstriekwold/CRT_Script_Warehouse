*** Settings ***
Resource                      ./resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite

*** Variables ***
${Price}    $10.00

*** Test Cases ***

Create order in webshop
    [Documentation]     Select a product, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    Appstate            Start webshop
    # Appstate            Create order
    ClickText           Sacha the Deer
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    # ${Price}            GetText             $9.00
    ClickText           Add to cart
    VerifyText           ${Price}           anchor=Total    
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping

# Create Account Growmore
#     [Tags]                        Account                  Create A New Account
#     Appstate                      Home
#     LaunchApp                     Sales
#     ClickText                     Accounts
#     ClickText                     New
#     UseModal                      On
#     Sleep                         1 sec
#     VerifyText                    Account Name             timeout=4
#     TypeText                      Account Name    Growmore
#     PickList                      Type            Competitor
#     ClickText                     Website
#     TypeText                      Website         www.growmore.org
#     ClickText                     Phone
#     TypeText                      Phone           1234567890
#     PickList                      Industry        Banking
#     ClickText                     Employees
#     TypeText                      Employees       100
#     ClickText                     Save            partial_match=false
#     UseModal                      Off
#     ClickText                 Details                    anchor=Related
#     VerifyText               Account Name             timeout=4
#     VerifyText               Growmore
#     VerifyText               Growmore                    anchor=Account Name
#     VerifyField               Phone                       (123) 456-7890
#     VerifyField               Employees                   100
#     VerifyField               Website                     www.growmore.org
#     VerifyField               Industry                    Banking
#     ClickText                 Delete
#     UseModal                  On
#     ClickText                 Delete
#     UseModal                  Off
