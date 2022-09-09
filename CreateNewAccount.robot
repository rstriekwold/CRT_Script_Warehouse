*** Settings ***
Library    QWeb
Resource                      ./resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite

*** Variables ***
${accountName}

*** Test Cases ***

Create order in webshop
    [Documentation]   Select a product, verify details on the page,     add the product to the cart and continue shopping.
    Appstate          Start webshop
    ClickText         Sacha the Deer
    VerifyText        Slim Fit, 5oz 100% Cotton T-Shirt.
    ${price}       GetText           //div/h4    
    ClickText         Add to cart
    ${pricepdp} =        Convert To String     ${price}
    VerifyText        Cart summary
    VerifyText        ${pricepdp}                     anchor=Total
    VerifyText        Sacha the Deer
    ClickText         Continue shopping

Create order in webshop and add same product again
    [Documentation]   Select a product, verify details on the page,     add the product to the cart and continue shopping.
    Appstate          Create order
    VerifyText        Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText         Add to cart
    VerifyText        Cart summary
    VerifyElementText     //span[@class\="snipcart__font--secondary snipcart__font--regular"]   2
    ClickItem         Remove item
    VerifyText        Your cart is empty


Create Account Growmore
    # [Tags]                        Account      Create A New Account     testgen       linear
    [Tags]                        testgen    linear    numtests=2    growmore
    Appstate                      Home
    LaunchApp                     Sales
    ClickText                     Accounts
    ClickText                     New
    UseModal                      On
    VerifyText                    Save              timeout=4   
    # ${accountName}=             Convert To String                         [Growmore,Growless]
    # Wait Until Keyword Succeeds   1 min   5 sec             
    TypeText                      Account Name      [Growmore, Growless]
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
    ClickText                     Details                    anchor=Related
    VerifyText                    Growmore
    VerifyText                    Growmore                    anchor=Account Name
    VerifyField                   Phone                       (123) 456-7890
    VerifyField                   Employees                   100
    VerifyField                   Website                     www.growmore.org
    VerifyField                   Industry                    Banking
    ClickText                     Delete
    UseModal                      On
    ClickText                     Delete
    UseModal                      Off
