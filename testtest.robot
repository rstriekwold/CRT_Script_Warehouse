#
# Test asset originally created using Copado QEditor.
#

*** Settings ***


Library    QForce

Resource    ./resources/common.robot

Library    QWeb

*** Test Cases ***

test
    [Documentation]   Test Case created using the QEditor
    OpenBrowser       about:blank       chrome
    Home
    LaunchApp         Sales
    VerifyText        Quarterly Performance

test2
    [Documentation]   Test Case created using the QEditor
    Home

test3
    [Documentation]   Test Case created using the QEditor
    Home

test4
    [Documentation]    Test Case created using the QEditor

