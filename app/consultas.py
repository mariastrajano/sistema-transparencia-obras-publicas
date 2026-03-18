# consultas.py
# Consultas ao banco de dados
# Autores: Abner (consultas 1, 2, 3) e Grazy (consultas 4, 5, 6)

from db import get_connection


# ---------------------------------------------------------------
# Consultas do Abner
# ---------------------------------------------------------------

def listar_obras_com_contratos():
    conn = get_connection()
    cursor = conn.cursor()

    query = """
    SELECT o.nome, c.numero_contrato, c.valor
    FROM obra o
    JOIN contrato c ON o.id_obra = c.id_obra
    """
    cursor.execute(query)
    resultados = cursor.fetchall()

    print("\n=== Obras com Contratados ===")
    for r in resultados:
        print(r)
    conn.close()
    


def buscar_obra_por_nome():
    nome = input("Digite o nome da obra: ")
    
    conn = get_connection
    cursor = conn.cursor()

    query = """
    SELECT * FROM obra
    WHERE nome LIKE %s
    """
    cursor.execute(query, (f"%{nome}%",))
    resultados = cursor.fetchall()

    print("\n=== Resultado da Busca ===")
    for r in resultados:
        print(r)

    conn.close()

def listar_etapas_por_obra():
    id_obra = input("Digite o ID da Obra: ")

    conn = get_connection
    cursor = conn.cursor()

    query = """
    SELECT id_etapa, nome, status
    FROM etapa
    WHERE id_obra = %s
    """
    cursor.execute(query, (id_obra,))
    resultados = cursor.fetchall()

    print("\n=== Etapas da Obra ===")
    for r in resultados:
        print(r)

    conn.close()

# ---------------------------------------------------------------
# Consultas da Grazy
# ---------------------------------------------------------------

def fiscalizacoes_por_fiscal_e_periodo():
    # TODO: Grazy implementa aqui (multi-parâmetro: cpf_fiscal + data início + data fim)
    print("  [TODO] fiscalizacoes_por_fiscal_e_periodo não implementado ainda.")


def obras_por_status_e_bairro():
    # TODO: Grazy implementa aqui (multi-parâmetro: status da etapa + bairro)
    print("  [TODO] obras_por_status_e_bairro não implementado ainda.")


def empresas_com_valor_total():
    # TODO: Grazy implementa aqui
    print("  [TODO] empresas_com_valor_total não implementado ainda.")
