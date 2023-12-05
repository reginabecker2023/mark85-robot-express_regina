# Serve para poder customizar o método do framework do robot = @keyword('Remove user from database')
# para conseguir customizar o nome do método
from robot.api.deco import keyword
from pymongo import MongoClient
import bcrypt

# Conextar no cluster
client = MongoClient('mongodb+srv://reginabecker2023:$thina$2023@cluster0.nmb7pml.mongodb.net/?retryWrites=true&w=majority')

# Acessar o Banco
db = client["markdb"]

@keyword('Clean user from database')
# Limpa a base de dados de Users e Tasks
def clean_user(user_email):
    users = db['users']
    tasks = db['tasks']
    u = users.find_one({'email': user_email})
    # Se usuário existir, excluir as tarefas e usuários
    if (u): 
        tasks.delete_many({'user': u['_id']})
        users.delete_many({'email': user_email})

# No teste sempre que chamar 'Remove user from database', vai executar este método
@keyword('Remove user from database')

# Método em python que remove e-mail
def remove_user(email):
    users = db['users']
    # : email é o parametro do método que requer ser passado remove_user(email) como se fosse o where
    users.delete_many({'email': email})
    print('removing user by ' + email)

@keyword('Insert user from database')
# Método para inserir usuário
def insert_user(user):
    # Biblioteca para criptografar senha
    hash_pass = bcrypt.hashpw(user['password'].encode('utf-8'), bcrypt.gensalt(8))
    doc = {
        'name': user['name'],
        'email': user['email'], 
        'password': hash_pass
    }
    users = db['users']
    users.insert_one(doc)
    print(doc)    