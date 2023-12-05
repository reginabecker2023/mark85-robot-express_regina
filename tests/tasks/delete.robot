*** Settings ***
Documentation      Cenários de testes de remoção de tarefas  
Resource           ../../resources/base.resource
Test Setup         Start Session
Test TearDown      Take Screenshot

*** Test Cases ***
Deve poder apagar uma tarefa indesejada
    [Tags]      deleted
    
    ${data}     Get fixture        tasks           delete
    #Dado que eu tenho um novo usuário
    Reset user from database       ${data}[user] 

    Create a new task from API     ${data}

    # Quando estou logado na aplicação web
    Do login                      ${data}[user]

    # Então posso excluir a tarefa
    Request removal               ${data}[task][name]
    Task should not exist         ${data}[task][name]