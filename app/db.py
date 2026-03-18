# db.py
# Módulo de conexão com o banco de dados PostgreSQL
# Autor: Matheus
#
# Todas as outras partes do sistema importam get_connection() daqui.
# A conexão usa as variáveis do arquivo .env, então não precisa
# hardcodar senha nem nome do banco no código.

import os
import psycopg2
from dotenv import load_dotenv

load_dotenv()


def get_connection():
    """
    Abre e retorna uma conexão com o PostgreSQL.
    Lembra de fechar a conexão depois de usar!
    """
    try:
        conn = psycopg2.connect(
            host=os.getenv("DB_HOST", "localhost"),
            port=os.getenv("DB_PORT", "5432"),
            dbname=os.getenv("DB_NAME", "obras_publicas"),
            user=os.getenv("DB_USER", "postgres"),
            password=os.getenv("DB_PASSWORD", "")
        )
        return conn
    except psycopg2.OperationalError as e:
        print(f"\n[ERRO] Não conseguiu conectar ao banco: {e}")
        print("Verifique se o PostgreSQL tá rodando e se o .env tá certo.")
        raise
