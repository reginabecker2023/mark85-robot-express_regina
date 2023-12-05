*** Settings ***
Documentation        Cenários de autenticação do usuário
Library              Collections
Resource             ../resources/base.resource
Test Setup           Start Session
Test TearDown        Take Screenshot

*** Test Cases ***
Deve poder logar com um usuário pré-cadastrado
    [Tags]             login
    ${user}                      Create Dictionary
    ...        name=Regina becker
    ...        email=reginabecker2023@gmail.com
    ...        password=pwd123

    # Remover os dados da base Mongo             
    Remove user from database    ${user}[email]

    # insere os dados da base Mongo             
    Insert user from database    ${user}

    Submit login form             ${user}
    User should be logged in      ${user}[name]

Não deve logar com senha inválida
    [Tags]             inv_login
    ${user}                      Create Dictionary
    ...        name=Estive Woz
    ...        email=woz@gmail.com
    ...        password=123456

    # Remover os dados da base Mongo             
    Remove user from database    ${user}[email]

    # insere os dados da base Mongo             
    Insert user from database    ${user}
    # da biblioteca collections
    Set To Dictionary            ${user}        password=abc123

    Submit login form             ${user}
    Notice should be              Ocorreu um erro ao fazer login, verifique suas credenciais. 
