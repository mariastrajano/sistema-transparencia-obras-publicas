#!/usr/bin/env python3
import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

conn = psycopg2.connect(
    host=os.getenv("DB_HOST", "localhost"),
    port=os.getenv("DB_PORT", "5432"),
    dbname=os.getenv("DB_NAME", "obras_publicas"),
    user=os.getenv("DB_USER", "postgres"),
    password=os.getenv("DB_PASSWORD", ""),
    client_encoding="UTF8"
)

cursor = conn.cursor()

print("Limpando dados...")
cursor.execute("TRUNCATE AVALIA CASCADE;")
cursor.execute("TRUNCATE FISCALIZACAO CASCADE;")
cursor.execute("TRUNCATE ETAPA CASCADE;")
cursor.execute("TRUNCATE GERENCIA CASCADE;")
cursor.execute("TRUNCATE CONTRATO CASCADE;")
cursor.execute("TRUNCATE OBRA CASCADE;")
cursor.execute("TRUNCATE FISCAL_OBRA CASCADE;")
cursor.execute("TRUNCATE ADMINISTRADOR_PUBLICO CASCADE;")
cursor.execute("TRUNCATE EMPRESA_CONTRATADA CASCADE;")
cursor.execute("TRUNCATE USUARIO CASCADE;")
cursor.execute("TRUNCATE ORGAO_CONTROLE CASCADE;")
conn.commit()

print("Carregando seed com UTF-8 correto...")
with open('sql/seed.sql', 'r', encoding='utf-8') as f:
    sql_content = f.read()

cursor.execute(sql_content)
conn.commit()

cursor.execute("SELECT COUNT(*) FROM OBRA;")
obras = cursor.fetchone()[0]
print(f"✓ {obras} obras carregadas")

cursor.execute("SELECT id_obra, nome FROM OBRA ORDER BY id_obra LIMIT 6;")
print("\nDados carregados:")
for row in cursor.fetchall():
    print(f"  {row[0]} - {row[1]}")

cursor.close()
conn.close()
