*** Settings ***
Documentation        Consumindo a API REST do sistema Mark85
Library              RequestsLibrary

*** Keywords ***
POST user session
    [Arguments]            ${user}

    ${payload}             Create Dictionary
    ...                    email=${user}[email]
    ...                    password=${user}[password]

    ${resp}    POST        url=http://localhost:3333/sessions
    ...     json=${payload}
    ...     expected_status=200
    
    ${token}               Set Variable        ${resp.json()}[token]
    # existe Set Suite e Set Global
    Set Test Variable      ${token}

POST a new taks
    [Arguments]            ${payload}

    ${headers}             Create Dictionary
    ...                    Authorization=${token}

    POST                   url=http://localhost:3333/tasks
    ...                    json=${payload}
    ...                    headers=${headers}
    ...                    expected_status=201
