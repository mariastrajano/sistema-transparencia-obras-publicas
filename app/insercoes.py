# insercoes.py
# Operações de INSERT no banco de dados
# Autor: Antônia

from db import get_connection

def inserir_obra():
    try:
        conn = get_connection()
        cur = conn.cursor()

        print("\n=== Inserir Nova Obra ===")

        nome = input("Nome da obra: ")
        descricao = input("Descrição: ")
        data_inicio = input("Data de início (YYYY-MM-DD): ")
        data_fim_prevista = input("Data fim prevista (YYYY-MM-DD ou vazio): ")
        numero = input("Número do endereço: ")
        rua = input("Rua: ")
        bairro = input("Bairro: ")

        cur.execute("""
            INSERT INTO OBRA (
                nome, descricao, data_inicio, data_fim_prevista,
                endereco_numero, endereco_rua, endereco_bairro
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (
            nome,
            descricao,
            data_inicio,
            data_fim_prevista if data_fim_prevista else None,
            numero,
            rua,
            bairro
        ))

        conn.commit()
        print("\nObra inserida com sucesso!")

    except Exception as e:
        print("\nErro ao inserir obra:", e)

    finally:
        cur.close()
        conn.close()

    input("\n[Enter para continuar]")

def inserir_etapa():
    try:
        conn = get_connection()
        cur = conn.cursor()

        print("\n=== Inserir Nova Etapa ===")

        id_obra = input("ID da obra: ")
        nome = input("Nome da etapa: ")
        descricao = input("Descrição: ")
        print("\n  Status válidos: pendente | em_andamento | concluida | atrasada")
        status = input("Status escolhido: ")
        ordem_etapa = input("Ordem da etapa (número): ")
        data_inicio = input("Data início prevista (YYYY-MM-DD ou vazio): ")
        data_fim = input("Data fim prevista (YYYY-MM-DD ou vazio): ")

        cur.execute("""
            INSERT INTO ETAPA (
                ordem_etapa, id_obra, nome, status,
                descricao, data_inicio_prevista, data_fim_prevista
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (
            ordem_etapa,
            id_obra,
            nome,
            status,
            descricao,
            data_inicio if data_inicio else None,
            data_fim if data_fim else None
        ))

        conn.commit()
        print("\nEtapa inserida com sucesso!")

    except Exception as e:
        print("\nErro ao inserir etapa:", e)

    finally:
        cur.close()
        conn.close()

    input("\n[Enter para continuar]")

def vincular_admin_obra():
    try:
        conn = get_connection()
        cur = conn.cursor()

        print("\n=== Vincular Administrador à Obra ===")

        cpf_admin = input("CPF do administrador: ")
        id_obra = input("ID da obra: ")
        data_inicio = input("Data de início da gestão (YYYY-MM-DD): ")

        cur.execute("""
            INSERT INTO GERENCIA (
                cpf_administrador, id_obra, data_inicio
            )
            VALUES (%s, %s, %s)
        """, (
            cpf_admin,
            id_obra,
            data_inicio
        ))

        conn.commit()
        print("\nAdministrador vinculado à obra com sucesso!")

    except Exception as e:
        print("\nErro ao vincular administrador:", e)

    finally:
        cur.close()
        conn.close()

    input("\n[Enter para continuar]")