#
# Test asset originally created using Copado QEditor.
#

*** Settings ***

Resource    Broken.robot

Library    QWeb

*** Test Cases ***

test
    [Documentation]   Test Case created using the QEditor
    OpenBrowser       about:blank       chrome
    Home
