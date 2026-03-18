/*
 * Sistema de Transparência de Obras Públicas
 * SGBD: PostgreSQL
 *
 * Ajustes em relação ao DER original:
 *   - ETAPA: a PK composta (ordem_etapa, id_obra) foi substituída por uma
 *     surrogada (id_etapa SERIAL) pra simplificar as FKs em FISCALIZACAO
 *     e AVALIA. A composição original virou UNIQUE constraint.
 *   - USUARIO: a relação "trabalhaPara" do DER ficou como cnpj_orgao
 *     direto na tabela, sem tabela associativa separada.
 *   - Status de ETAPA e resultado de FISCALIZACAO têm CHECK pra evitar
 *     valores fora do domínio.
 */

-- Derruba tudo na ordem certa pra não dar erro de FK
DROP TABLE IF EXISTS AVALIA              CASCADE;
DROP TABLE IF EXISTS FISCALIZACAO        CASCADE;
DROP TABLE IF EXISTS ETAPA               CASCADE;
DROP TABLE IF EXISTS CONTRATO            CASCADE;
DROP TABLE IF EXISTS GERENCIA            CASCADE;
DROP TABLE IF EXISTS OBRA                CASCADE;
DROP TABLE IF EXISTS EMPRESA_CONTRATADA  CASCADE;
DROP TABLE IF EXISTS ADMINISTRADOR_PUBLICO CASCADE;
DROP TABLE IF EXISTS FISCAL_OBRA         CASCADE;
DROP TABLE IF EXISTS USUARIO             CASCADE;
DROP TABLE IF EXISTS ORGAO_CONTROLE      CASCADE;


-- Órgão de controle (ex: TCE, CGU, Prefeitura...)
CREATE TABLE ORGAO_CONTROLE (
    cnpj VARCHAR(18)   PRIMARY KEY,
    nome VARCHAR(255)  NOT NULL
);


-- Tabela base dos usuários do sistema
-- A coluna tipo_usuario diferencia fiscal de administrador
-- cnpj_orgao foi adicionado aqui pra guardar a relação "trabalhaPara" do DER
CREATE TABLE USUARIO (
    cpf          VARCHAR(14)  PRIMARY KEY,
    nome         VARCHAR(255) NOT NULL,
    email        VARCHAR(255) NOT NULL UNIQUE,
    senha        VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(20)  NOT NULL
                 CHECK (tipo_usuario IN ('fiscal', 'administrador')),
    cnpj_orgao   VARCHAR(18)
                 REFERENCES ORGAO_CONTROLE(cnpj)
                 ON UPDATE CASCADE ON DELETE SET NULL
);


-- Especialização de USUARIO: fiscal de obra
CREATE TABLE FISCAL_OBRA (
    cpf VARCHAR(14) PRIMARY KEY
        REFERENCES USUARIO(cpf)
        ON UPDATE CASCADE ON DELETE CASCADE
);


-- Especialização de USUARIO: administrador público
CREATE TABLE ADMINISTRADOR_PUBLICO (
    cpf VARCHAR(14) PRIMARY KEY
        REFERENCES USUARIO(cpf)
        ON UPDATE CASCADE ON DELETE CASCADE
);


-- Empresa que vai executar a obra
CREATE TABLE EMPRESA_CONTRATADA (
    cnpj VARCHAR(18)   PRIMARY KEY,
    nome VARCHAR(255)  NOT NULL
);


-- A obra pública em si
CREATE TABLE OBRA (
    id_obra           SERIAL        PRIMARY KEY,
    nome              VARCHAR(255)  NOT NULL,
    descricao         TEXT,
    data_inicio       DATE          NOT NULL,
    data_fim_prevista DATE,
    endereco_numero   VARCHAR(20),
    endereco_rua      VARCHAR(255),
    endereco_bairro   VARCHAR(255),
    CONSTRAINT chk_datas_obra
        CHECK (data_fim_prevista IS NULL OR data_fim_prevista >= data_inicio)
);


-- Tabela associativa N:N — administrador gerencia obra
-- Um admin pode gerenciar várias obras, uma obra pode ter vários admins
CREATE TABLE GERENCIA (
    cpf_administrador VARCHAR(14) NOT NULL
        REFERENCES ADMINISTRADOR_PUBLICO(cpf)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_obra           INT         NOT NULL
        REFERENCES OBRA(id_obra)
        ON UPDATE CASCADE ON DELETE CASCADE,
    data_inicio       DATE        NOT NULL,
    PRIMARY KEY (cpf_administrador, id_obra)
);


-- Contrato entre a obra e a empresa contratada
CREATE TABLE CONTRATO (
    id_contrato     SERIAL         PRIMARY KEY,
    id_obra         INT            NOT NULL
                    REFERENCES OBRA(id_obra)
                    ON UPDATE CASCADE ON DELETE RESTRICT,
    cnpj            VARCHAR(18)    NOT NULL
                    REFERENCES EMPRESA_CONTRATADA(cnpj)
                    ON UPDATE CASCADE ON DELETE RESTRICT,
    valor_total     DECIMAL(15,2)  NOT NULL CHECK (valor_total > 0),
    data_assinatura DATE           NOT NULL,
    data_termino    DATE,
    CONSTRAINT chk_datas_contrato
        CHECK (data_termino IS NULL OR data_termino >= data_assinatura)
);


-- Etapas de uma obra (ex: fundação, estrutura, acabamento...)
-- Ajuste: id_etapa como PK surrogada, (ordem_etapa, id_obra) virou UNIQUE
CREATE TABLE ETAPA (
    id_etapa             SERIAL        PRIMARY KEY,
    ordem_etapa          INT           NOT NULL,
    id_obra              INT           NOT NULL
                         REFERENCES OBRA(id_obra)
                         ON UPDATE CASCADE ON DELETE CASCADE,
    nome                 VARCHAR(255)  NOT NULL,
    status               VARCHAR(20)   NOT NULL DEFAULT 'pendente'
                         CHECK (status IN ('pendente', 'em_andamento', 'concluida', 'atrasada')),
    descricao            TEXT,
    data_inicio_prevista DATE,
    data_fim_prevista    DATE,
    UNIQUE (ordem_etapa, id_obra),
    CONSTRAINT chk_datas_etapa
        CHECK (data_fim_prevista IS NULL
            OR data_inicio_prevista IS NULL
            OR data_fim_prevista >= data_inicio_prevista)
);


-- Registro de uma visita de fiscalização a uma etapa
CREATE TABLE FISCALIZACAO (
    id_fiscalizacao  SERIAL        PRIMARY KEY,
    id_etapa         INT           NOT NULL
                     REFERENCES ETAPA(id_etapa)
                     ON UPDATE CASCADE ON DELETE RESTRICT,
    cpf_fiscal       VARCHAR(14)   NOT NULL
                     REFERENCES FISCAL_OBRA(cpf)
                     ON UPDATE CASCADE ON DELETE RESTRICT,
    data             DATE          NOT NULL,
    relatorio        TEXT,
    resultado        VARCHAR(20)
                     CHECK (resultado IN ('aprovado', 'reprovado', 'pendente', 'em_analise')),
    foto_url_arquivo VARCHAR(500),
    foto_latitude    FLOAT         CHECK (foto_latitude  BETWEEN -90  AND 90),
    foto_longitude   FLOAT         CHECK (foto_longitude BETWEEN -180 AND 180)
);


-- Tabela associativa N:N — uma fiscalização pode avaliar várias etapas
-- e uma etapa pode ser avaliada em várias fiscalizações
CREATE TABLE AVALIA (
    id_fiscalizacao INT NOT NULL
                    REFERENCES FISCALIZACAO(id_fiscalizacao)
                    ON UPDATE CASCADE ON DELETE CASCADE,
    id_etapa        INT NOT NULL
                    REFERENCES ETAPA(id_etapa)
                    ON UPDATE CASCADE ON DELETE RESTRICT,
    observacao      TEXT,
    PRIMARY KEY (id_fiscalizacao, id_etapa)
);
