# main.py
# Ponto de entrada do sistema — menu principal navegável
# Autor: Matheus

import sys
from db import get_connection
from insercoes import inserir_obra, inserir_etapa, vincular_admin_obra
from consultas import (
    listar_obras_com_contratos,
    buscar_obra_por_nome,
    listar_etapas_por_obra,
    fiscalizacoes_por_fiscal_e_periodo,
    obras_por_status_e_bairro,
    empresas_com_valor_total
)
from atualizacoes import atualizar_status_etapa, atualizar_contrato


def separador():
    print("\n" + "-" * 48 + "\n")


def menu_principal():
    while True:
        separador()
        print("  Sistema de Transparência de Obras Públicas")
        separador()
        print("  1. Inserir dados")
        print("  2. Consultar dados")
        print("  3. Atualizar dados")
        print("  0. Sair")
        print()

        opcao = input("  Opção: ").strip()

        if opcao == "1":
            menu_insercao()
        elif opcao == "2":
            menu_consulta()
        elif opcao == "3":
            menu_atualizacao()
        elif opcao == "0":
            print("\n  Até mais!\n")
            sys.exit(0)
        else:
            print("\n  Opção inválida, tenta de novo.")
            input("  [Enter para continuar]")


def menu_insercao():
    while True:
        separador()
        print("  Inserção de Dados")
        separador()
        print("  1. Nova obra")
        print("  2. Nova etapa de obra")
        print("  3. Vincular administrador a obra")
        print("  0. Voltar")
        print()

        opcao = input("  Opção: ").strip()

        if opcao == "1":
            inserir_obra()
        elif opcao == "2":
            inserir_etapa()
        elif opcao == "3":
            vincular_admin_obra()
        elif opcao == "0":
            break
        else:
            print("\n  Opção inválida.")
            input("  [Enter para continuar]")


def menu_consulta():
    while True:
        separador()
        print("  Consultas")
        separador()
        print("  1. Listar todas as obras com contratos")
        print("  2. Buscar obra por nome")
        print("  3. Listar etapas de uma obra")
        print("  4. Fiscalizações por fiscal e período")
        print("  5. Obras por status de etapa e bairro")
        print("  6. Empresas contratadas com valor total")
        print("  0. Voltar")
        print()

        opcao = input("  Opção: ").strip()

        opcoes = {
            "1": listar_obras_com_contratos,
            "2": buscar_obra_por_nome,
            "3": listar_etapas_por_obra,
            "4": fiscalizacoes_por_fiscal_e_periodo,
            "5": obras_por_status_e_bairro,
            "6": empresas_com_valor_total,
        }

        if opcao in opcoes:
            opcoes[opcao]()
            input("\n  [Enter para continuar]")
        elif opcao == "0":
            break
        else:
            print("\n  Opção inválida.")
            input("  [Enter para continuar]")


def menu_atualizacao():
    while True:
        separador()
        print("  Atualização de Dados")
        separador()
        print("  1. Atualizar status de uma etapa")
        print("  2. Atualizar dados de um contrato")
        print("  0. Voltar")
        print()

        opcao = input("  Opção: ").strip()

        if opcao == "1":
            atualizar_status_etapa()
        elif opcao == "2":
            atualizar_contrato()
        elif opcao == "0":
            break
        else:
            print("\n  Opção inválida.")
            input("  [Enter para continuar]")


if __name__ == "__main__":
    # Testa a conexão antes de abrir o menu
    # Se não conectar, não tem pra que continuar
    print("\n  Verificando conexão com o banco...")
    try:
        conn = get_connection()
        conn.close()
        print("  Conexão OK!")
    except Exception:
        print("  Falha na conexão. Verifique o .env e se o PostgreSQL tá rodando.")
        sys.exit(1)

    menu_principal()
