from flask import Flask
from flask_cors import CORS
from dotenv import load_dotenv
from api.bd.db import mysql 
from datetime import datetime # Importante para los turnos
import os

load_dotenv()
app = Flask(__name__)
CORS(app)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
app.config['MYSQL_HOST'] = os.getenv('DB_HOST')
app.config['MYSQL_USER'] = os.getenv('DB_USER')
app.config['MYSQL_PASSWORD'] = os.getenv('DB_PASSWORD')
app.config['MYSQL_DB'] = os.getenv('DB_NAME')

mysql.init_app(app)

# Importamos y Registramos las rutas
#from api.routes.dueno import dueno_bp
#app.register_blueprint(dueno_bp) 

#from api.routes.inquilino import inquilino_bp
#app.register_blueprint(inquilino_bp) 

#from api.routes.cama import cama_bp
#app.register_blueprint(cama_bp) 

#from api.routes.estadia import estadia_bp
#app.register_blueprint(estadia_bp)