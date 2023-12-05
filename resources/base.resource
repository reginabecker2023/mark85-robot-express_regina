*** Settings ***
Library         libs/database.py
Library         Browser
Library         JSONLibrary 
Resource        env.resource
Resource        pages/SignupPage.resource
Resource        pages/LoginPage.resource
Resource        pages/components/Notice.resource
Resource        pages/components/Alert.resource
Resource        pages/components/Header.resource
Resource        pages/TaskCreatePage.resource
Resource        pages/TasksPage.resource
Resource        services.resource

*** Keywords ***
Start Session
    # Reservado para abrir o navegador
    New Browser      browser=${BROWSER}        headless=False
    New Page         ${BASE_URL}
    Set Browser Timeout    5

# Keyword para Uso de template de suite para os cenários acima
Short password
    [Arguments]        ${short_pass}
    ${user}                      Create Dictionary
    ...        name=Charles Xavier
    ...        email=charles@gmail.com
    ...        password=${short_pass} 

    Go to signup page
    Submit signup form           ${user}
    Alert should be              Informe uma senha com pelo menos 6 digitos    

# Helpers
Get fixture
    [Arguments]        ${file_name}        ${scenario}

    ${data}        Load Json From File        
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
# para tratar o string acima para json
 
    [Return]    ${data}[${scenario}]

Reset user from database    
    [Arguments]        ${user}

    Clean user from database       ${user}[email]
    Insert user from database      ${user} 

Create a new task from API
    [Arguments]        ${data}     

    #Token do usuário
    # E que esse usuário ja cadastrou uma tarefa
    POST user session              ${data}[user] 
    # Primeiro cadastro de Tarefa
    POST a new taks                ${data}[task]        

Do login
    [Arguments]        ${user}     

    # E que estou logado na aplicação web
    Submit login form             ${user}
    User should be logged in      ${user}[name]
