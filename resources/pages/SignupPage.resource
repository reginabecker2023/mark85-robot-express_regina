*** Settings ***
Documentation        Elementos e ações da página de cadastro
Library              Browser
Resource             ../env.resource

*** Keywords ***
Go to signup page
    # Reservado para abrir o navegador
    Go To                        ${BASE_URL}/signup
    
    # Ao carregar a página a biblioteca browser tem até 5 segundos para encontrar o elemento
    # Técnica de Checkpoint, pontos de validação para saber se está passando pelo fluxo correto
    ${element}                   Set Variable            css=h1         
    Wait For Elements State      ${element}              visible            5
    Get Text                     ${element}              equal              Faça seu cadastro

Submit signup form
    [Arguments]    ${user}
    # Preencher o formulário
    # Assim 
    # id=name  
    # ou assim css=#name (# indica id)    
    # xpath=//input[@id="email"]
    Fill Text                    css=input[name=name]        ${user}[name]    
    Fill Text                    css=input[name=email]       ${user}[email]
    Fill Text                    css=input[name=password]    ${user}[password]
    # Localizar assim
    # id=buttonSignup
    # button[type=submit]
    # xpath=//button[text()="Cadastrar"]
    # Estratégia da biblioteca Browser permite usar >> text=Cadastrar
    Click                        css=button[type=submit] >> text=Cadastrar
