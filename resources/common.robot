*** Settings ***
Library                   QWeb
Library                   QForce
Library                   String


*** Variables ***
${username}               rstriekwold@copado.com.crttestprod.roberttrai
${login_url}              https://copadoprofessionalservices-crt--roberttrai.sandbox.lightning.force.com/         # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}               ${login_url}/lightning/page/home
${web_shop}               https://qentinelqi.github.io/shop/ 


*** Keywords ***
Home
    [Documentation]       Navigate to homepage, login if needed
    GoTo                  ${home_url}
    ${login_status} =     IsText                      To access this page, you have to log in to Salesforce.    2
    Run Keyword If        ${login_status}             Login
    ClickText             Home
    VerifyTitle           Home | Salesforce
Setup Browser
    Open Browser          about:blank                 Chrome
    SetConfig             LineBreak                   ${EMPTY}               #\ue000
    SetConfig             DefaultTimeout              20s                    #sometimes salesforce is slow


End suite
    Close All Browsers


Login
    [Documentation]       Login to Salesforce instance
    GoTo                  ${login_url}
    TypeText              Username                    ${username}             delay=1
    TypeText              Password                    ${password}
    ClickText             Log In



Sales App
    [Documentation]        Navigate to the Sales App
    LaunchApp              Sales

# Example of custom keyword with robot fw syntax
VerifyStage
    [Documentation]       Verifies that stage given in ${text} is at ${selected} state; either selected (true) or not selected (false)
    [Arguments]           ${text}                     ${selected}=true
    VerifyElement         //a[@title\="${text}" and @aria-checked\="${selected}"]


NoData
    VerifyNoText          ${data}                     timeout=3                        delay=2


DeleteAccounts
    [Documentation]       RunBlock to remove all data until it doesn't exist anymore
    ClickText             ${data}
    ClickText             Delete
    VerifyText            Are you sure you want to delete this account?
    ClickText             Delete                      2
    VerifyText            Undo
    VerifyNoText          Undo
    ClickText             Accounts                    partial_match=False


DeleteLeads
    [Documentation]       RunBlock to remove all data until it doesn't exist anymore
    ClickText             ${data}
    ClickText             Delete
    VerifyText            Are you sure you want to delete this lead?
    ClickText             Delete                      2
    VerifyText            Undo
    VerifyNoText          Undo
    ClickText             Leads                    partial_match=False


Start webshop
    [Documentation]       Start the qentinel webshop
    DeleteAllCookies
    GoTo                  ${web_shop}


 Create order
    Run Keyword         Start webshop
    ClickText           Sacha the Deer
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping