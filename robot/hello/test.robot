*** Settings ***
Library     app.py

Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=      Welcome     Renan
    Should Be Equal     ${result}       opa, e ai Renan, Bem vindo