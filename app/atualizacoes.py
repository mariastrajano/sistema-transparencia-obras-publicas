# atualizacoes.py
# Operações de UPDATE no banco de dados
# Autor: Abner


from db import get_connection


def atualizar_status_etapa():
    id_etapa = input("ID da estapa: ")
    novo_status = input("Novo status: ")
    
    try:
        conn = get_connection()
        cursor = conn.cursor()

        query = """
        UPDATE etapa
        SET status = %s
        WHERE id_etapa = %s
        """
        cursor.execute(query, (novo_status, id_etapa))
        conn.commit()

        print("Status atualizado com sucesso!")

    except Exception as e:
        print("Erro ao atualizar status! ", e)

    finally:
        conn.close()
        input("\n[Enter para continuar]")

def atualizar_contrato():
    id_contrato = input("ID do contrato: ")
    novo_valor = input("Novo valor do contrato: ")

    try:
        conn = get_connection()
        cursor = conn.cursor()

        query = """
        UPDATE contrato
        SET valor = %s
        WHERE id_contrato = %s
        """

        cursor.execute(query, (novo_valor, id_contrato))
        conn.commit()

        print("✅ Contrato atualizado com sucesso!")

    except Exception as e:
        print("❌ Erro ao atualizar contrato:", e)

    finally:
        conn.close()
        input("\n[Enter para continuar]")
