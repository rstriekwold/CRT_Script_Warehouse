#
# Test asset originally created using Copado QEditor.
#

*** Settings ***

Library    QWeb

*** Test Cases ***

test
    [Documentation]   Test Case created using the QEditor
    OpenBrowser       about:blank       chrome
    GoTo              https://www.google.nl/
    ClickText         Accept all
    ClickText         Search            partial_match=False
    TypeText          q                 test\n
