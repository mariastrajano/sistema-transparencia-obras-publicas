# Sistema de Transparência de Obras Públicas

## Visão Geral

O Sistema de Transparência de Obras Públicas é uma aplicação desenvolvida para centralizar e facilitar o acompanhamento de obras executadas pelo poder público. O sistema oferece ferramentas completas para gerenciar informações sobre projetos, contratos, etapas de execução, fiscalização e responsáveis técnicos.

A plataforma promove **transparência administrativa**, permitindo que órgãos de controle e a sociedade acompanhem de forma estruturada e auditável o desenvolvimento das obras públicas.

## Funcionalidades Principais

### Gestão de Obras
- Cadastro e acompanhamento de obras públicas
- Registro de informações detalhadas (localização, cronograma, responsáveis)
- Divisão de obras em etapas executáveis
- Acompanhamento de progresso e status

### Gestão de Contratos
- Associação de contratos a obras específicas
- Registro de empresas contratadas
- Controle de valores e datas de vigência
- Rastreabilidade completa de contratos

### Fiscalização
- Registro de visitas e inspeções de fiscalização
- Documentação de parecer técnico
- Associação de evidências (georreferenciamento)
- Relatórios de conformidade

### Controle de Acesso
- Usuários diferenciados (administradores públicos, fiscais)
- Vinculação com órgãos de controle
- Rastreabilidade de ações e modificações

## Tecnologias utilizadas

| Componente | Tecnologia |
|-----------|-----------|
| **Banco de Dados** | PostgreSQL 18 |
| **Backend/API** | Python 3.13 |
| **Interface** | CLI (Command Line Interface) |
| **Encoding** | UTF-8 (suporte completo a português) |
| **Driver BD** | psycopg2-binary 2.9.9 |

## Estrutura do Projeto

```
sistema-transparencia-obras-publicas/
├── app/                          # Aplicação Python
│   ├── main.py                  # Menu principal interativo
│   ├── db.py                    # Gerenciamento de conexão
│   ├── consultas.py             # Queries e relatórios
│   ├── insercoes.py             # Inserção de dados
│   └── atualizacoes.py          # Atualizações de registros
│
├── sql/                          # Banco de dados
│   ├── schema.sql               # Estrutura (11 tabelas)
│   └── seed.sql                 # Dados de demonstração (87 registros)
│
├── reset_db.py                  # Script para recarregar dados
├── .env                         # Configuração (credenciais PostgreSQL)
├── GUIA_DEMONSTRACAO.txt        # Passo a passo para apresentação
└── README.md                    # Este arquivo
```

## Estrutura do Banco de Dados

O sistema utiliza 11 tabelas organizadas em domínios bem definidos:

**Órgãos e Usuários:**
- `ORGAO_CONTROLE` - Órgãos responsáveis pelo acompanhamento
- `USUARIO` - Usuários do sistema
- `ADMINISTRADOR_PUBLICO` - Especialização de usuários
- `FISCAL_OBRA` - Especialização de usuários

**Execução:**
- `OBRA` - Projetos públicos
- `ETAPA` - Fases de execução
- `EMPRESA_CONTRATADA` - Executoras
- `CONTRATO` - Vínculos comerciais
- `GERENCIA` - Relação administrador-obra

**Fiscalização:**
- `FISCALIZACAO` - Visitas e inspeções
- `AVALIA` - Avaliação de qualidade

## Como Usar

### Pré-requisitos

- PostgreSQL 18 instalado e em execução
- Python 3.13+
- Dependências: `pip install -r requirements.txt`

### Instalação Rápida

1. **Clonar o repositório:**
   ```bash
   git clone https://github.com/mariastrajano/sistema-transparencia-obras-publicas.git
   cd sistema-transparencia-obras-publicas
   ```

2. **Configurar o banco de dados:**
   - Edite o arquivo `.env` com suas credenciais PostgreSQL
   - Execute para popular o banco: `python reset_db.py`

3. **Iniciar a aplicação:**
   ```bash
   python app/main.py
   ```

4. **Navegue pelo menu interativo:**
   - **Opção 1:** Inserir dados (novas obras, etapas, etc)
   - **Opção 2:** Consultar dados (7 tipos de relatórios)
   - **Opção 3:** Atualizar dados (status e valores)
   - **Opção 0:** Sair

### Dados de Demonstração

O sistema vem pré-carregado com dados de exemplo incluindo:
- 6 obras públicas em andamento
- 25 etapas de execução
- 8 usuários (administradores e fiscais)
- 6 empresas contratadas
- 21 registros de fiscalização

Para recarregar os dados originais:
```bash
python reset_db.py
```

## Contribuidores

| Nome | Responsabilidades |
|------|-------------------|
| Abner Levi | Arquitetura, Consultas |
| Grazielly Bibiano | Consultas, Relatórios |
| Maria Antônia | Inserções, Modelagem |
| Matheus Nogueira | Atualizações, Integração |
