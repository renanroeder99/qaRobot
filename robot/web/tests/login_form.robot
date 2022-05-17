*** Settings ***
Resource    base.robot

Test Setup          Nova sessão
Test Teardown       Encerra sessão


***Test Cases***
Login com sucesso
    Go To           ${url}/login
    Login With      stark  jarvis!

    Page Should Contain     Você acessou a área logada!

Senha inválida
    [tags]          login_error
    Go To           ${url}/login
    Login With      stark  abc123!

    ${message}=                     Get WebElement      id:flash
    Should Contain Login Alert      Senha é invalida!

Usuario nao existe
    [tags]          login_user404
    Go To           ${url}/login
    Login With      roeder  123qwe

    ${message}=                     Get WebElement      id:flash
    Should Contain Login Alert      O usuário informado não está cadastrado

***Keywords***
Login With
    [Arguments]     ${uname}        ${pass}
    Input Text      css:input[name=username]        stark
    Input Text      css:input[name=password]        jarvis!
    Click Element   class:btn-login

Should Contain Login Alert
    [Arguments]     ${expected_message}

    ${message}=     Get WebElement      id:flash
    Should Contain  ${message.text}     ${expected_message}

Should See Logged User
    [Arguments]     ${fullname}
    Page Should Contain     Olá, ${fullname}. Você acessou a área logada!