*** Settings ***
Documentation      Cenários de testes de atualização de tarefas  
Resource           ../../resources/base.resource
Test Setup         Start Session
Test TearDown      Take Screenshot

*** Test Cases ***
Deve poder marcar uma tarefa como concluída
    [Tags]      done
    
    ${data}     Get fixture        tasks           done
    #Dado que eu tenho um novo usuário
    Reset user from database       ${data}[user] 

    Create a new task from API     ${data}

    # Quando estou logado na aplicação web
    Do login                      ${data}[user]

    # Então posso deixar a tarefa como concluída
    Mark taks as completed        ${data}[task][name] 
    Task should be complete       ${data}[task][name] 