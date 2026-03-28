# consultas.py
# Consultas ao banco de dados
# Autores: Abner (consultas 1, 2, 3) e Grazy (consultas 4, 5, 6)

from db import get_connection


# ---------------------------------------------------------------
# Consultas do Abner
# ---------------------------------------------------------------

def listar_obras_com_contratos():
    # TODO: Abner implementa aqui
    print("  [TODO] listar_obras_com_contratos não implementado ainda.")


def buscar_obra_por_nome():
    # TODO: Abner implementa aqui (parametrizável — pede nome pro usuário)
    print("  [TODO] buscar_obra_por_nome não implementado ainda.")


def listar_etapas_por_obra():
    # TODO: Abner implementa aqui (parametrizável — pede id_obra pro usuário)
    print("  [TODO] listar_etapas_por_obra não implementado ainda.")


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


def obras_por_status_e_bairro():
    # TODO: Grazy implementa aqui (multi-parâmetro: status da etapa + bairro)
    print("  [TODO] obras_por_status_e_bairro não implementado ainda.")


def empresas_com_valor_total():
    # TODO: Grazy implementa aqui
    print("  [TODO] empresas_com_valor_total não implementado ainda.")
