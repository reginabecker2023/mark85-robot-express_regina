*** Settings ***
Documentation            Ações e elementos do cabeçalho do Mark85
Library                  Browser
Library                  String

*** Keywords ***
User should be logged in
    [Arguments]        ${name}
    # Da biblioteca library para separar nome e sobrenome
    @{splited_name}              Split String            ${name}
    ${element}                   Set Variable            css=header .right small
    Wait For Elements State      ${element}              visible            5
    Get Text                     ${element}              equal             Olá, ${splited_name}[0]    

Got to task form
    Click     css=.button-add





