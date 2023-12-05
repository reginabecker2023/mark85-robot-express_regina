## Executar
robot hello.robot

## Criar a conta na aplicação web
http://localhost:3000/signup

## Quando criar a conta vai ter o Usuário no Menu Browser do Mongo
https://cloud.mongodb.com/v2/6569eb4ddae4f70036119391#/metrics/replicaSet/6569eb93ee96a42fce1559ae/explorer/markdb/users/find

## Criado outra conta na aplicação web
reginabecker2023@yahoo.com
Becker Regina

reginabecker2023@gmail.com
Regina Becker

## Browser Librarie
    https://github.com/MarketSquare/robotframework-browser
01) Install node.js e.g. from https://nodejs.org/en/download/

02) Update pip :
        pip install -U pip 

    se der erro pode ser
        python.exe -m pip install --upgrade pip

    to ensure latest version is used
    Regina@DESKTOP-JM3KCQU MINGW64 ~
    $ pip install -U pip
    DEPRECATION: Loading egg at c:\python312\lib\site-packages\vboxapi-1.0-py3.12.egg is deprecated. pip 24.3 will enforce this behaviour change. A possible replacement is to use pip for package installation.. Discussion can be found at https://github.com/pypa/pip/issues/12330
    Requirement already satisfied: pip in c:\python312\lib\site-packages (23.3.1)


3) Install robotframework-browser from the commandline é a biblioteca do playrigth: pip install robotframework-browser

4) Install the node dependencies: run 
        rfbrowser init 
        in your shell

5) if rfbrowser is not found, try python -m Browser.entry init

## Executar Script de teste automatizado da aplicação web
robot online.robot


## Organizando Outputs

robot -d ./logs online.robot

# Elementos
https://marketsquare.github.io/robotframework-browser/Browser.html#Finding%20elements

Selector strategies that are supported by default are listed in the table below.
-------------------------------------------------------------------
Strategy	Match based on	        Example
css	        CSS selector.           css=.class > \#login_btn
xpath	    XPath expression.	    xpath=//input[@id="login_btn"]
text	    Browser text engine.	text=Login
id	        Element ID Attribute.	id=login_btn
-------------------------------------------------------------------

## Executar Script de teste automatizado da aplicação web

robot -d ./logs signup.robot

## Super Dicas de Xpath
    https://devhints.io/xpath

# Instalar biblioteca Faker
    pip install robotframework-faker

# Executar todos os arquivos de testes
robot -d ./logs tests    


# Biblioteca do Mongo
https://pypi.org/project/pymongo/

pip install pymongo

# Mongo Mark85 Conect Driver String de Conexão
https://cloud.mongodb.com/v2/6569eb4ddae4f70036119391#/overview?connectCluster=Cluster0

Regina@DESKTOP-JM3KCQU MINGW64 /c/QAx/projects/mark85-robot-express
$ docker run --rm -it python:3.8.1-buster /bin/bash


Regina@DESKTOP-JM3KCQU MINGW64 /c/QAx/projects/mark85-robot-express
$ python -m venv venv

#Dica
https://copyprogramming.com/howto/shell-the-dnspython-module-must-be-installed

pip install dnspython
pip freeze && python test.py

# Executar todos os arquivos de testes
robot -d ./logs tests/signup.robot    

# Executar por tag
robot -d ./logs -i dup tests/signup.robot  

# Para trabalhar com fixtures, precisa instalar a biblioteca
pip install robotframework-jsonlibrary

# Disponibizar repositório
git init
git status
git add .
git commit -m "This is a new commit for what I originally planned to be amended"
git status
git push origin main

para criar a chave ssh do git hub no terminal digitar
    ssh-keygen

No github
https://github.com/settings/keys
Menu Settigns
ssh and GPG keys

cat colocar o nome do caminho do comando acima
    cat /c/Users/Regina/.ssh/id_rsa.pub

copiar a chave mostrada

Cadastrar a chave no caminho
https://github.com/settings/keys


git remote add origin https://github.com/reginabecker2023/mark85-robot-express_regina.git
  git branch -M main
  git push -u origin main

git config -e --system
C:\Program Files\Git\mingw64\etc\ssl\certs
