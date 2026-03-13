# **Sistema de Transparência de Obras Públicas**

## **Descrição do Projeto**
Este projeto tem como objetivo desenvolver um **Sistema de Transparência de Obras Públicas**, permitindo o acompanhamento detalhado de obras realizadas pelo poder público.

O sistema registra informações como:

- obras em execução
- contratos firmados
- etapas de execução
- medições realizadas
- responsáveis técnicos
- atualizações e evidências da obra (como fotos georreferenciadas)

A proposta busca **promover maior transparência na gestão pública**, permitindo **fiscalização mais eficiente, redução de irregularidades e maior participação social** no acompanhamento das obras.

Este repositório contém a evolução do projeto desenvolvido na disciplina Banco de Dados, seguindo duas etapas:

- Trabalho Prático 1 (TP1) – Modelagem e projeto do banco de dados
- Trabalho Prático 2 (TP2) – Implementação do banco de dados e integração com aplicação

## **Objetivos**

- Promover transparência no acompanhamento de obras públicas.
- Registrar dados estruturados sobre contratos, etapas, medições e responsáveis.
- Criar uma base de dados auditável e rastreável.
- Aplicar conceitos teóricos de Banco de Dados em um projeto realista.
- Implementar e integrar um banco de dados relacional com uma aplicação em Python.

## **Tecnologias Utilizadas**

- **Banco de Dados:** MySQL
- **Backend:** Python 3.11+
- **Interface:** CLI (linha de comando)

## **Estrutura do Repositório**

```
sistema-transparencia-obras-publicas/
├── models/
│   ├── usuario.py
│   ├── fiscalizacao.py
│   └── obra.py
│
├──  database/
    └── schema.sql
```

## **Como Executar o Projeto**

Pré-requisitos:

```
Python 3.11+
```

Clone o repositório:

```
git clone https://github.com/mariastrajano/sistema-transparencia-obras-publicas.git
cd sistema-transparencia-obras-publicas
```

Execute o sistema via terminal:

```
python run.py
```

## **Integrantes do Grupo**

- Abner Levi - @abnerlevi
- Grazielly Bibiano - @graziellybn
- Maria Antônia - @mariastrajano
- Matheus Nogueira - @mathsNS
