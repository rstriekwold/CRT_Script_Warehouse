*** Settings ***
Documentation      New test suite
Library         QWeb
Suite Setup       Open Browser  about:blank  chrome
Suite Teardown     Close All Browsers

*** Test Cases ***
test test
  [Documentation]  test to test the test
  [Tags]    test test
  GoTo  https://www.tweakers.net/
  VerifyText   Pricewatch
  VerifyText   Forum
  VerifyUrl   https://tweakers.net/

Open the pricewatch and go to the CPU section and filter on AMD
  [Documentation]  open the pricewatch
  [Tags]  test
  ClickText    Pricewatch
  ClickText    Processors
  ScrollTo    Merk CPU
  ClickText    AMD  anchor=Geen voorkeur
  VerifyText   Filters wissen
  #VerifyElement   //a[contains(text(),"Filters wissen")]

een nieuwe test
  [Documentation]  nieuwe test
  [Tags]  testgen  linear  numtests=2
  TypeText       Verfijn resultaten  [Piet, Henk]