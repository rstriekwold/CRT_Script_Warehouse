*** Settings ***

Library    QWeb
Resource                      ./resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***

Create order in webshop
    [Documentation]   Select a product, verify details on the page,     add the product to the cart and continue shopping.
    Appstate          Start webshop
    ClickText         Sacha the Deer
    VerifyText        Slim Fit, 5oz 100% Cotton T-Shirt.
    ${pricepdp}       GetText           //div/h4
    ClickText         Add to cart
    ${price} =        Convert To String     ${pricepdp}
    VerifyText        Cart summary
    VerifyText        ${price}
    VerifyText        Sacha the Deer
    ClickText         Continue shopping
