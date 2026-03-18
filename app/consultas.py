# consultas.py
# Consultas ao banco de dados
# Autores: Abner (consultas 1, 2, 3) e Grazy (consultas 4, 5, 6)

from db import get_connection


# ---------------------------------------------------------------
# Consultas do Abner
# ---------------------------------------------------------------

def listar_todas_obras():
    conn = get_connection()
    cursor = conn.cursor()

    query = """
    SELECT id_obra, nome, data_inicio, data_fim_prevista, 
           endereco_rua, endereco_bairro
    FROM obra
    ORDER BY id_obra
    """
    cursor.execute(query)
    resultados = cursor.fetchall()

    print("\n=== Todas as Obras ===")
    for r in resultados:
        id_obra, nome, data_inicio, data_fim_prevista, rua, bairro = r
        print(f"\n  ID: {id_obra}")
        print(f"  Nome: {nome}")
        print(f"  Data início: {data_inicio}")
        print(f"  Data fim prevista: {data_fim_prevista}")
        print(f"  Endereço: {rua}, {bairro}")
    conn.close()


def listar_obras_com_contratos():
    conn = get_connection()
    cursor = conn.cursor()

    query = """
    SELECT o.nome, c.id_contrato, c.valor_total
    FROM obra o
    JOIN contrato c ON o.id_obra = c.id_obra
    """
    cursor.execute(query)
    resultados = cursor.fetchall()

    print("\n=== Obras com Contratos ===")
    for r in resultados:
        print(r)
    conn.close()
    


def buscar_obra_por_nome():
    nome = input("Digite o nome da obra: ")
    
    conn = get_connection()
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

    conn = get_connection()
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
# Consultas 4, 5 e 6.
# ---------------------------------------------------------------
#
# Essa consulta faz um filtro por fiscal e período, mostrando as fiscalizações realizadas por um fiscal 
# específico dentro de um intervalo de datas. O resultado inclui detalhes como data, etapa, obra, resultado 
# e relatório da fiscalização. 
def fiscalizacoes_por_fiscal_e_periodo():
    """Consulta 4: Fiscalizações por fiscal e período"""
    cpf_fiscal = input("  CPF do fiscal: ").strip()
    data_inicio = input("  Data inicial (AAAA-MM-DD): ").strip()
    data_fim = input("  Data final (AAAA-MM-DD): ").strip()

    conn = None
    try:
        # Conecta ao banco e executa a consulta parametrizada.
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute(
                """
                SELECT
                    f.id_fiscalizacao,
                    f.data,
                    u.nome AS nome_fiscal,
                    e.nome AS nome_etapa,
                    o.nome AS nome_obra,
                    f.resultado,
                    f.relatorio
                FROM FISCALIZACAO f
                JOIN USUARIO u ON u.cpf = f.cpf_fiscal
                JOIN ETAPA e ON e.id_etapa = f.id_etapa
                JOIN OBRA o ON o.id_obra = e.id_obra
                WHERE f.cpf_fiscal = %s
                  AND f.data BETWEEN %s AND %s
                ORDER BY f.data, f.id_fiscalizacao
                """,
                (cpf_fiscal, data_inicio, data_fim),
            )
            resultados = cur.fetchall()
        
        print("\n  Fiscalizações encontradas:")

        if not resultados:  
        # Se não houver resultados, informa o usuário.
            print("  Nenhuma fiscalização encontrada para os filtros informados.")
            return
  
        for item in resultados:
        # Exibe os resultados de forma legível.
            id_fiscalizacao, data, nome_fiscal, nome_etapa, nome_obra, resultado, relatorio = item
            print(f"  ID: {id_fiscalizacao}")
            print(f"    Data: {data}")
            print(f"    Fiscal: {nome_fiscal}")
            print(f"    Obra: {nome_obra}")
            print(f"    Etapa: {nome_etapa}")
            print(f"    Resultado: {resultado or 'N/A'}")
            print(f"    Relatório: {relatorio or 'N/A'}")
    except Exception as e:
        # Em caso de erro, exibe a mensagem:
        print(f"\n  [ERRO] Não foi possível executar a consulta: {e}")

    finally:
        # Garante que a conexão seja fechada, mesmo em caso de erro.
        if conn is not None:
            conn.close()



# Essa consulta permite ao usuário filtrar obras com base no status de suas etapas e no
# bairro onde estão localizadas.
def obras_por_status_e_bairro():
    """Consulta 5: Obras por status da etapa e bairro"""
    status = input("  Status da etapa (pendente, em_andamento, concluida, atrasada): ").strip()
    bairro = input("  Bairro da obra: ").strip()

    conn = None
    try:
        # Conecta ao banco e executa a consulta parametrizada.
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute(
                """
                SELECT DISTINCT
                    o.id_obra,
                    o.nome,
                    o.endereco_bairro,
                    e.nome AS nome_etapa,
                    e.status
                FROM OBRA o
                JOIN ETAPA e ON e.id_obra = o.id_obra
                WHERE e.status = %s
                  AND LOWER(o.endereco_bairro) = LOWER(%s)
                ORDER BY o.nome, e.nome
                """,
                (status, bairro),
            )
            resultados = cur.fetchall()

        print("\n  Obras encontradas:")

        if not resultados:
            # Se não houver resultados, informa o usuário.
            print("  Nenhuma obra encontrada para os filtros informados.")
            return

        for item in resultados:
            # Exibe os resultados de forma legível.
            id_obra, nome_obra, endereco_bairro, nome_etapa, status_etapa = item
            print(f"  ID da obra: {id_obra}")
            print(f"    Nome: {nome_obra}")
            print(f"    Bairro: {endereco_bairro or 'N/A'}")
            print(f"    Etapa: {nome_etapa}")
            print(f"    Status da etapa: {status_etapa}")
    except Exception as e:
        # Em caso de erro, exibe a mensagem:
        print(f"\n  [ERRO] Não foi possível executar a consulta: {e}")

    finally:
        # Garante que a conexão seja fechada, mesmo em caso de erro.
        if conn is not None:
            conn.close()



# Essa consulta lista todas as empresas contratadas, mostrando o número de contratos 
# e o valor total contratado para cada empresa.
def empresas_com_valor_total():
    """Consulta 6: Empresas contratadas e valor total contratado."""
    conn = None
    try:
        # Conecta ao banco e executa a consulta agregada das empresas.
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute(
                """
                SELECT
                    ec.cnpj,
                    ec.nome,
                    COUNT(c.id_contrato) AS quantidade_contratos,
                    COALESCE(SUM(c.valor_total), 0) AS valor_total_contratado
                FROM EMPRESA_CONTRATADA ec
                LEFT JOIN CONTRATO c ON c.cnpj = ec.cnpj
                GROUP BY ec.cnpj, ec.nome
                ORDER BY valor_total_contratado DESC, ec.nome
                """
            )
            resultados = cur.fetchall()

        print("\n  Empresas contratadas e valor total:")

        if not resultados:
            # Se não houver resultados, informa o usuário.
            print("  Nenhuma empresa encontrada.")
            return

        for item in resultados:
            # Exibe os resultados de forma legível.
            cnpj, nome_empresa, quantidade_contratos, valor_total = item
            print(f"  CNPJ: {cnpj}")
            print(f"    Empresa: {nome_empresa}")
            print(f"    Contratos: {quantidade_contratos}")
            print(f"    Valor total contratado: R$ {valor_total:.2f}")
    except Exception as e:
        # Em caso de erro, exibe a mensagem:
        print(f"\n  [ERRO] Não foi possível executar a consulta: {e}")

    finally:
        # Garante que a conexão seja fechada, mesmo em caso de erro.
        if conn is not None:
            conn.close()
