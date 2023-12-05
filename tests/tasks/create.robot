*** Settings ***
Documentation        Cenários de cadastro de tarefas
Resource             ../../resources/base.resource
Test Setup           Start Session
Test TearDown        Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    [Tags]      critical
    ${data}     Get fixture        tasks           create
    
    #Dado que eu tenho um novo usuário
    Reset user from database       ${data}[user] 

    # Cenários de Login
    Do login                      ${data}[user]
    
    # Cenários de tarefas
    Got to task form
    Submit task form              ${data}[task]
    Task should be registered     ${data}[task][name]
    Log         ${data}

Não deve cadastrar tarefa com nome duplicado
    [Tags]      dup
    
    ${data}     Get fixture        tasks           duplicate
    #Dado que eu tenho um novo usuário
    Reset user from database       ${data}[user] 

    Create a new task from API     ${data}

    # E que estou logado na aplicação web
    Do login                      ${data}[user]

    # Quando faço um cadatro dessa mesma tarefa que já existe
    Got to task form
    Submit task form              ${data}[task]
    # Então devo ver uma notidação de tarefa duplicada
    Notice should be              Oops! Tarefa duplicada.

Não deve cadastrar uma nova tarefa quando atinge o limite de Tags
    [Tags]      limit
    
    ${data}     Get fixture        tasks           tags_limit
    #Dado que eu tenho um novo usuário
    Reset user from database       ${data}[user] 

    # E que estou logado na aplicação web
    Do login                      ${data}[user]

    # Quando faço um cadatro dessa mesma tarefa que já existe
    Got to task form
    Submit task form              ${data}[task]
    # Então devo ver uma notidação de tarefa duplicada
    Notice should be              Oops! Limite de tags atingido.