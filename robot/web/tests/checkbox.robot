*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Variables ***
${check_thor}       id:thor
${check_iron}       css:input[value='iron-man']
${check_panther}    xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Checking option by Id
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_thor}
    Checkbox Should Be Selected     ${check_thor}
    Sleep                           5
    Close Browser

Checking option with CSS Selector
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_iron}
    checkbox Should Be Selected     ${check_iron}
    Close Browser

Checking option with Xpath
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_panther}
    checkbox Should Be Selected     ${check_panther}
    Sleep                           5
    Close Browser
