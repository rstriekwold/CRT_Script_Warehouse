*** Settings ***
Documentation      New test suite
Library             QWeb
Suite Setup       Open Browser  about:blank  chrome
Suite Teardown     Close All Browsers

*** Test Cases ***
een nieuwe test
  [Documentation]  nieuwe test
  [Tags]           testgen    linear    numtests=2    jorrit
        GoTo       https://www.tweakers.net/
        VerifyText   Pricewatch
        VerifyText   Forum
        VerifyUrl   https://tweakers.net/
        ClickText    Pricewatch
        ClickText    Processors
        TypeText     Verfijn resultaten  [Piet, Henk]