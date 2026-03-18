/*
 * SEED CORRETO - Sistema de Transparência de Obras Públicas
 * PostgreSQL - UTF-8 Encoding
 */

BEGIN;

-- =========================================================
-- ORGAO_CONTROLE
-- =========================================================
INSERT INTO ORGAO_CONTROLE (cnpj, nome) VALUES
('10.111.111/0001-01', 'Controladoria Geral do Município'),
('20.222.222/0001-02', 'Tribunal de Contas do Estado'),
('30.333.333/0001-03', 'Secretaria Municipal de Infraestrutura'),
('40.444.444/0001-04', 'Controladoria Geral da União - Regional'),
('50.555.555/0001-05', 'Secretaria de Obras Públicas');


-- =========================================================
-- USUARIO
-- =========================================================
INSERT INTO USUARIO (cpf, nome, email, senha, tipo_usuario, cnpj_orgao) VALUES
('111.111.111-11', 'Ana Paula Ribeiro',     'ana.ribeiro@orgao.gov.br',      'hash_ana',      'administrador', '30.333.333/0001-03'),
('222.222.222-22', 'Carlos Henrique Lima',  'carlos.lima@orgao.gov.br',      'hash_carlos',   'administrador', '50.555.555/0001-05'),
('333.333.333-33', 'Fernanda Rocha',        'fernanda.rocha@orgao.gov.br',   'hash_fernanda', 'administrador', '30.333.333/0001-03'),
('444.444.444-44', 'Marcos Vinicius Alves', 'marcos.alves@controle.gov.br',  'hash_marcos',   'fiscal',        '10.111.111/0001-01'),
('555.555.555-55', 'Juliana Costa',         'juliana.costa@controle.gov.br', 'hash_juliana',  'fiscal',        '20.222.222/0001-02'),
('666.666.666-66', 'Rafael Mendes',         'rafael.mendes@controle.gov.br', 'hash_rafael',   'fiscal',        '40.444.444/0001-04'),
('777.777.777-77', 'Patricia Gomes',        'patricia.gomes@controle.gov.br','hash_patricia', 'fiscal',        '10.111.111/0001-01'),
('888.888.888-88', 'Eduardo Nunes',         'eduardo.nunes@orgao.gov.br',    'hash_eduardo',  'administrador', '50.555.555/0001-05');


-- =========================================================
-- ESPECIALIZAÇÕES
-- =========================================================
INSERT INTO ADMINISTRADOR_PUBLICO (cpf) VALUES
('111.111.111-11'),
('222.222.222-22'),
('333.333.333-33'),
('888.888.888-88');

INSERT INTO FISCAL_OBRA (cpf) VALUES
('444.444.444-44'),
('555.555.555-55'),
('666.666.666-66'),
('777.777.777-77');


-- =========================================================
-- EMPRESA_CONTRATADA
-- =========================================================
INSERT INTO EMPRESA_CONTRATADA (cnpj, nome) VALUES
('60.666.666/0001-06', 'Construtora Horizonte LTDA'),
('70.777.777/0001-07', 'Via Urbana Engenharia S/A'),
('80.888.888/0001-08', 'Nova Era Infraestrutura LTDA'),
('90.999.999/0001-09', 'Pavitec Obras Públicas LTDA'),
('11.000.000/0001-10', 'Edifica Brasil Serviços de Engenharia'),
('22.123.123/0001-11', 'Construmax Projetos e Execuções LTDA');


-- =========================================================
-- OBRA
-- =========================================================
INSERT INTO OBRA (
    id_obra, nome, descricao, data_inicio, data_fim_prevista,
    endereco_numero, endereco_rua, endereco_bairro
) VALUES
(1, 'Reforma da Escola Municipal Sol Nascente',
 'Reforma de salas, cobertura, instalações elétricas e adaptação de acessibilidade.',
 '2025-01-10', '2025-12-15',
 '120', 'Rua das Flores', 'Centro'),

(2, 'Construção da UBS Bairro Esperança',
 'Construção de unidade básica de saúde com consultórios, farmácia e recepção.',
 '2025-02-03', '2026-04-30',
 '450', 'Avenida Central', 'Esperança'),

(3, 'Pavimentação da Avenida do Contorno',
 'Execução de drenagem e pavimentação asfáltica em corredor urbano.',
 '2024-08-20', '2025-09-30',
 'S/N', 'Avenida do Contorno', 'Industrial'),

(4, 'Construção de Praça Pública Vila Verde',
 'Praça com iluminação, paisagismo, playground e academia ao ar livre.',
 '2025-03-12', '2025-10-25',
 '85', 'Rua Projetada A', 'Vila Verde'),

(5, 'Ampliação do Mercado Público Municipal',
 'Ampliação dos boxes, cobertura metálica e modernização elétrica.',
 '2024-11-01', '2025-11-20',
 '300', 'Rua do Comércio', 'Centro'),

(6, 'Reforma do Ginásio Poliesportivo Municipal',
 'Recuperação estrutural, vestiários, cobertura e arquibancadas.',
 '2025-04-15', '2026-01-30',
 '77', 'Avenida Esportiva', 'Boa Vista');


-- =========================================================
-- GERENCIA
-- =========================================================
INSERT INTO GERENCIA (cpf_administrador, id_obra, data_inicio) VALUES
('111.111.111-11', 1, '2025-01-10'),
('222.222.222-22', 2, '2025-02-03'),
('333.333.333-33', 3, '2024-08-20'),
('111.111.111-11', 4, '2025-03-12'),
('888.888.888-88', 5, '2024-11-01'),
('222.222.222-22', 6, '2025-04-15'),
('333.333.333-33', 2, '2025-06-01'),
('888.888.888-88', 6, '2025-07-01');


-- =========================================================
-- CONTRATO
-- =========================================================
INSERT INTO CONTRATO (
    id_contrato, id_obra, cnpj, valor_total, data_assinatura, data_termino
) VALUES
(1, 1, '60.666.666/0001-06', 980000.00,  '2025-01-05', '2025-12-15'),
(2, 2, '11.000.000/0001-10', 2850000.00, '2025-01-25', '2026-04-30'),
(3, 3, '90.999.999/0001-09', 3190000.00, '2024-08-10', '2025-09-30'),
(4, 4, '80.888.888/0001-08', 740000.00,  '2025-03-01', '2025-10-25'),
(5, 5, '22.123.123/0001-11', 1560000.00, '2024-10-20', '2025-11-20'),
(6, 6, '70.777.777/0001-07', 2125000.00, '2025-04-01', '2026-01-30');


-- =========================================================
-- ETAPA
-- =========================================================
INSERT INTO ETAPA (
    id_etapa, ordem_etapa, id_obra, nome, status, descricao,
    data_inicio_prevista, data_fim_prevista
) VALUES
-- OBRA 1
(1, 1, 1, 'Demolição inicial', 'concluida',
 'Remoção de estruturas comprometidas e limpeza da área.',
 '2025-01-15', '2025-02-05'),

(2, 2, 1, 'Reforço estrutural', 'concluida',
 'Reforço de pilares, vigas e cobertura.',
 '2025-02-06', '2025-04-20'),

(3, 3, 1, 'Instalações elétricas', 'em_andamento',
 'Substituição da rede elétrica e quadro geral.',
 '2025-04-25', '2025-07-30'),

(4, 4, 1, 'Acabamento e acessibilidade', 'pendente',
 'Pisos, pintura, rampas e corrimãos.',
 '2025-08-01', '2025-12-05'),

-- OBRA 2
(5, 1, 2, 'Fundações e estrutura', 'em_andamento',
 'Escavação, fundações e estrutura de concreto.',
 '2025-02-10', '2025-05-15'),

(6, 2, 2, 'Alvenaria e cobertura', 'pendente',
 'Alvenaria, impermeabilização e cobertura.',
 '2025-05-20', '2025-09-30'),

(7, 3, 2, 'Instalações hidráulicas e elétricas', 'pendente',
 'Redes de água, esgoto, gás e elétricas.',
 '2025-10-01', '2026-01-15'),

(8, 4, 2, 'Acabamento final', 'pendente',
 'Revestimentos, pintura, portas e louças.',
 '2026-01-20', '2026-04-30'),

-- OBRA 3
(9, 1, 3, 'Drenagem superficial', 'concluida',
 'Construção de bueiros e canais de drenagem.',
 '2024-09-01', '2024-11-15'),

(10, 2, 3, 'Pavimentação asfáltica', 'em_andamento',
 'Aplicação de base, binder e asfalto.',
 '2024-11-20', '2025-03-30'),

(11, 3, 3, 'Sinalização e paisagismo', 'pendente',
 'Marcações horizontais, pintura de guia e arborização.',
 '2025-04-01', '2025-09-30'),

-- OBRA 4
(12, 1, 4, 'Escavação e preparação', 'concluida',
 'Limpeza e nivelamento do terreno.',
 '2025-03-20', '2025-04-10'),

(13, 2, 4, 'Infraestrutura (iluminação, água)', 'em_andamento',
 'Instalação de rede elétrica de iluminação e fonte.',
 '2025-04-15', '2025-07-15'),

(14, 3, 4, 'Construção de equipamentos', 'pendente',
 'Playground, academia ao ar livre, bancos e mesas.',
 '2025-07-20', '2025-09-30'),

(15, 4, 4, 'Paisagismo final', 'pendente',
 'Plantio de árvores, flores e grama.',
 '2025-10-01', '2025-10-25'),

-- OBRA 5
(16, 1, 5, 'Demolição parcial', 'concluida',
 'Remoção de estruturas comprometidas.',
 '2024-11-15', '2024-12-30'),

(17, 2, 5, 'Estrutura de ampliação', 'em_andamento',
 'Pilares, vigas e cobertura metálica nova.',
 '2025-01-10', '2025-05-20'),

(18, 3, 5, 'Instalações e revestimentos', 'pendente',
 'Elétricas, hidráulicas, pisos e azulejos.',
 '2025-05-25', '2025-09-30'),

(19, 4, 5, 'Acabamento e mobiliário', 'pendente',
 'Portas, bancadas e equipamentos de mercado.',
 '2025-10-01', '2025-11-20'),

-- OBRA 6
(20, 1, 6, 'Recuperação estrutural', 'em_andamento',
 'Reforço de vigas, pilares e laje.',
 '2025-04-20', '2025-08-31'),

(21, 2, 6, 'Vestiários e sanitários', 'pendente',
 'Reforma completa de vestiários e piscinas.',
 '2025-09-01', '2025-11-30'),

(22, 3, 6, 'Arquibancadas e cobertura', 'pendente',
 'Reforma estrutural de arquibancadas e cobertura.',
 '2025-12-01', '2026-01-30'),

(23, 4, 6, 'Acabamento final', 'pendente',
 'Pintura, sinalização e limpeza final.',
 '2026-02-01', '2026-02-28'),

(24, 5, 6, 'Testes e entrega', 'pendente',
 'Testes de sistemas e entrega da obra.',
 '2026-03-01', '2026-03-15'),

(25, 6, 6, 'Acompanhamento pós-entrega', 'pendente',
 'Vistorias e correções menores pós-inauguração.',
 '2026-03-16', '2026-03-31');


-- =========================================================
-- FISCALIZACAO
-- =========================================================
INSERT INTO FISCALIZACAO (
    id_etapa, cpf_fiscal, data,
    relatorio, resultado
) VALUES
-- OBRA 1
(1, '444.444.444-44', '2025-02-01', 'Vistoria inicial - Demolição iniciada conforme projeto', 'aprovado'),
(1, '444.444.444-44', '2025-02-04', 'Conclusão da demolição - Estrutura limpa e segura', 'aprovado'),
(2, '444.444.444-44', '2025-03-15', 'Reforço estrutural em andamento - Qualidade adequada', 'aprovado'),
(3, '777.777.777-77', '2025-06-10', 'Instalações elétricas - Verificadas de acordo com normas', 'aprovado'),

-- OBRA 2
(5, '555.555.555-55', '2025-03-01', 'Fundações sendo escavadas - Profundidade correta', 'aprovado'),
(5, '555.555.555-55', '2025-04-20', 'Estrutura de concreto em andamento - Dentro do cronograma', 'aprovado'),
(6, '555.555.555-55', '2025-07-01', 'Alvenaria iniciada - Espessura de juntas adequada', 'aprovado'),

-- OBRA 3
(9, '666.666.666-66', '2024-10-15', 'Drenagem - Bueiros posicionados corretamente', 'aprovado'),
(9, '666.666.666-66', '2024-11-10', 'Drenagem concluída - Escoamento adequado', 'aprovado'),
(10, '666.666.666-66', '2024-12-20', 'Base compactada - Densidade adequada verificada', 'aprovado'),
(10, '777.777.777-77', '2025-02-15', 'Pavimentação asfáltica em andamento', 'aprovado'),

-- OBRA 4
(12, '444.444.444-44', '2025-03-25', 'Terreno preparado - Nivelamento adequado', 'aprovado'),
(13, '777.777.777-77', '2025-05-10', 'Iluminação instalada - Testes de funcionamento OK', 'aprovado'),

-- OBRA 5
(16, '555.555.555-55', '2024-12-15', 'Demolição concluída - Segurança garantida', 'aprovado'),
(17, '555.555.555-55', '2025-02-28', 'Estrutura em andamento - Aço de qualidade verificado', 'aprovado'),
(17, '555.555.555-55', '2025-05-01', 'Estrutura finalizada - Pronta para cobertura', 'aprovado'),

-- OBRA 6
(20, '666.666.666-66', '2025-05-15', 'Recuperação estrutural iniciada - Diagnóstico confirma patologias', 'aprovado'),
(20, '666.666.666-66', '2025-07-30', 'Reforço estrutural em andamento - Execução conforme projeto', 'aprovado'),
(20, '666.666.666-66', '2025-08-25', 'Recuperação estrutural - 90% concluída, dentro do cronograma', 'aprovado'),
(22, '777.777.777-77', '2025-12-10', 'Inspeção prévia de arquibancadas', 'aprovado'),
(25, '444.444.444-44', '2026-03-25', 'Acompanhamento final - Obra entregue em conformidade', 'aprovado');

COMMIT;
