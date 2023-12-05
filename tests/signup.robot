*** Settings ***
Documentation      Cenários de testes do cadastro de usuários
# Library            FakerLibrary
Resource           ../resources/base.resource
Suite Setup        Log     Tudo aqui ocorre antes da Suite (Antes de todos os testes)
Suite TearDown     Log     Tudo aqui ocorre depois da Suite (Depois de todos os testes)
Test Setup        Start Session 
# Quando o teste falha no robot o print é automático, para gerar de sucesso declara-se abaixo
Test TearDown     Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuário
    [Tags]    cad

# Declarando variáveis que são utilizadas somente neste cenário
    # ${name}                      FakerLibrary.Name
    # ${email}                     FakerLibrary.Email
    ${user}                      Create Dictionary
    ...        name=Regina
    ...        email=reginabecker2023@gmail.com
    ...        password=pwd123        

    # Remover os dados da base Mongo             
    Remove user from database    ${user}[email]

    Go to signup page
    Submit signup form           ${user}
    Notice should be             Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir o cadastro com email duplicado
    [Tags]    dup

    ${user}                      Create Dictionary
    ...        name=becker
    ...        email=becker2023@gmail.com
    ...        password=pwd123    

    # Remover os dados da base Mongo             
    Remove user from database    ${user}[email]

    # insere os dados da base Mongo             
    Insert user from database    ${user}

    Go to signup page
    Submit signup form           ${user}
    Notice should be             Oops! Já existe uma conta com o e-mail informado.

Campos obrigatórios
    [Tags]    required

    ${user}                      Create Dictionary
    ...        name=${EMPTY}
    ...        email=${EMPTY}
    ...        password=${EMPTY}        

    Go to signup page
    Submit signup form           ${user}
    Alert should be              Informe seu nome completo
    Alert should be              Informe seu e-email
    Alert should be              Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com email incorreto
    [Tags]    inv_email

    ${user}                      Create Dictionary
    ...        name=Charles Xavier
    ...        email=charles.com.br
    ...        password=pwd123 
    
    Go to signup page
    Submit signup form           ${user}
    Alert should be              Digite um e-mail válido

Não deve cadastrar com senha muito curta
    [Tags]    short_pass
# Variável de Lista de Dados
    @{password_list}        Create List        1        12        123        1234        12345
    
    FOR    ${password}    IN     @{password_list} 
        Short password      ${password}
    END        

# Não deve cadastrar com senha de 1 digito
#     [Tags]    short_pass
#     [Template]
#     Short password               1