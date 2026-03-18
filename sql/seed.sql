/*
 * SEED VARIADO - Sistema de Transparência de Obras Públicas
 * PostgreSQL
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
(5, 1, 2, 'Fundação', 'concluida',
 'Blocos, baldrames e sapatas da unidade.',
 '2025-02-10', '2025-04-15'),

(6, 2, 2, 'Estrutura', 'em_andamento',
 'Pilares, vigas, lajes e estrutura principal.',
 '2025-04-20', '2025-10-15'),

(7, 3, 2, 'Alvenaria', 'pendente',
 'Fechamento de paredes e divisórias internas.',
 '2025-10-20', '2025-12-20'),

(8, 4, 2, 'Instalações e acabamento', 'pendente',
 'Instalações prediais, revestimentos e pintura.',
 '2026-01-05', '2026-04-20'),

-- OBRA 3
(9, 1, 3, 'Terraplenagem', 'concluida',
 'Regularização do solo e conformação da pista.',
 '2024-08-25', '2024-10-10'),

(10, 2, 3, 'Drenagem pluvial', 'concluida',
 'Execução de galerias, bocas de lobo e saídas.',
 '2024-10-15', '2025-01-30'),

(11, 3, 3, 'Base e sub-base', 'concluida',
 'Preparação das camadas para pavimentação.',
 '2025-02-01', '2025-04-15'),

(12, 4, 3, 'Pavimentação asfáltica', 'atrasada',
 'Aplicação de binder e capa asfáltica.',
 '2025-04-20', '2025-07-25'),

(13, 5, 3, 'Sinalização horizontal e vertical', 'pendente',
 'Pintura de faixas, placas e tachões.',
 '2025-08-01', '2025-09-20'),

-- OBRA 4
(14, 1, 4, 'Limpeza do terreno', 'concluida',
 'Retirada de entulho e nivelamento inicial.',
 '2025-03-15', '2025-03-28'),

(15, 2, 4, 'Urbanização e piso', 'em_andamento',
 'Execução de caminhos, meio-fio e piso intertravado.',
 '2025-04-01', '2025-07-20'),

(16, 3, 4, 'Paisagismo', 'pendente',
 'Plantio de grama, arbustos e árvores ornamentais.',
 '2025-07-21', '2025-08-30'),

(17, 4, 4, 'Instalação de equipamentos', 'pendente',
 'Playground, academia e bancos.',
 '2025-09-01', '2025-10-10'),

-- OBRA 5
(18, 1, 5, 'Demolições internas', 'concluida',
 'Adequações para ampliação dos boxes.',
 '2024-11-05', '2024-12-10'),

(19, 2, 5, 'Estrutura metálica', 'concluida',
 'Montagem da nova cobertura metálica.',
 '2024-12-15', '2025-03-20'),

(20, 3, 5, 'Instalações elétricas e hidráulicas', 'em_andamento',
 'Infraestrutura dos novos boxes e corredores.',
 '2025-03-25', '2025-08-20'),

(21, 4, 5, 'Acabamento final', 'pendente',
 'Revestimentos, pintura e ajustes finais.',
 '2025-08-25', '2025-11-10'),

-- OBRA 6
(22, 1, 6, 'Recuperação estrutural', 'em_andamento',
 'Reparo em vigas, pilares e arquibancadas.',
 '2025-04-20', '2025-08-30'),

(23, 2, 6, 'Cobertura', 'pendente',
 'Troca de telhas e estrutura de cobertura.',
 '2025-09-01', '2025-10-30'),

(24, 3, 6, 'Vestiários e banheiros', 'pendente',
 'Reforma completa de áreas de apoio.',
 '2025-11-01', '2025-12-20'),

(25, 4, 6, 'Pintura e acabamento', 'pendente',
 'Pintura interna, externa e sinalização esportiva.',
 '2025-12-21', '2026-01-25');


-- =========================================================
-- FISCALIZACAO
-- =========================================================
INSERT INTO FISCALIZACAO (
    id_fiscalizacao, id_etapa, cpf_fiscal, data, relatorio, resultado,
    foto_url_arquivo, foto_latitude, foto_longitude
) VALUES
-- Obra 1
(1, 1, '444.444.444-44', '2025-01-28',
 'Demolição em andamento conforme planejamento. Área isolada corretamente.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_001.jpg', -3.7311, -38.5261),

(2, 1, '555.555.555-55', '2025-02-06',
 'Etapa concluída com remoção completa de resíduos.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_002.jpg', -3.7310, -38.5263),

(3, 2, '666.666.666-66', '2025-03-18',
 'Reforço estrutural com bom progresso físico. Sem anomalias visíveis.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_003.jpg', -3.7313, -38.5260),

(4, 3, '777.777.777-77', '2025-06-10',
 'Instalações elétricas em execução. Encontrado trecho sem eletroduto adequado.',
 'em_analise',
 'https://exemplo.gov/fotos/fisc_004.jpg', -3.7315, -38.5262),

(5, 3, '444.444.444-44', '2025-07-05',
 'Correções iniciadas, porém ainda pendente regularização completa.',
 'pendente',
 'https://exemplo.gov/fotos/fisc_005.jpg', -3.7316, -38.5264),

-- Obra 2
(6, 5, '555.555.555-55', '2025-03-15',
 'Fundação executada dentro das especificações do projeto.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_006.jpg', -3.7451, -38.5102),

(7, 6, '666.666.666-66', '2025-06-25',
 'Estrutura vertical iniciada. Concreto e ferragem em conformidade.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_007.jpg', -3.7453, -38.5101),

(8, 6, '777.777.777-77', '2025-08-30',
 'Foram observadas falhas de organização do canteiro e proteção lateral insuficiente.',
 'pendente',
 'https://exemplo.gov/fotos/fisc_008.jpg', -3.7454, -38.5105),

-- Obra 3
(9, 9, '444.444.444-44', '2024-09-20',
 'Terraplenagem avançando conforme cronograma.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_009.jpg', -3.7201, -38.5391),

(10, 10, '555.555.555-55', '2025-01-20',
 'Sistema de drenagem implantado adequadamente.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_010.jpg', -3.7203, -38.5393),

(11, 11, '666.666.666-66', '2025-03-28',
 'Base e sub-base concluídas com compactação satisfatória.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_011.jpg', -3.7205, -38.5395),

(12, 12, '777.777.777-77', '2025-06-18',
 'Pavimentação com execução parcial e trechos com espessura abaixo do esperado.',
 'reprovado',
 'https://exemplo.gov/fotos/fisc_012.jpg', -3.7208, -38.5398),

(13, 12, '444.444.444-44', '2025-07-22',
 'Persistem atrasos na frente de serviço. Empresa apresentou justificativa climática.',
 'em_analise',
 'https://exemplo.gov/fotos/fisc_013.jpg', -3.7210, -38.5400),

-- Obra 4
(14, 14, '555.555.555-55', '2025-03-26',
 'Terreno liberado e apto para início da urbanização.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_014.jpg', -3.7601, -38.4951),

(15, 15, '666.666.666-66', '2025-05-30',
 'Piso intertravado executado parcialmente com boa qualidade.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_015.jpg', -3.7604, -38.4954),

(16, 15, '777.777.777-77', '2025-07-12',
 'Identificados pontos de recalque em trecho do passeio.',
 'pendente',
 'https://exemplo.gov/fotos/fisc_016.jpg', -3.7606, -38.4956),

-- Obra 5
(17, 18, '444.444.444-44', '2024-11-25',
 'Demolições internas concluídas sem intercorrências.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_017.jpg', -3.7340, -38.5280),

(18, 19, '555.555.555-55', '2025-02-18',
 'Estrutura metálica montada com alinhamento adequado.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_018.jpg', -3.7343, -38.5282),

(19, 20, '666.666.666-66', '2025-06-08',
 'Instalações em andamento. Falta atualização de diário de obra.',
 'em_analise',
 'https://exemplo.gov/fotos/fisc_019.jpg', -3.7345, -38.5285),

-- Obra 6
(20, 22, '777.777.777-77', '2025-06-02',
 'Recuperação estrutural com avanço compatível com o cronograma.',
 'aprovado',
 'https://exemplo.gov/fotos/fisc_020.jpg', -3.7490, -38.5120),

(21, 22, '444.444.444-44', '2025-08-12',
 'Foram detectadas fissuras remanescentes em arquibancada lateral.',
 'pendente',
 'https://exemplo.gov/fotos/fisc_021.jpg', -3.7493, -38.5124);


-- =========================================================
-- AVALIA
-- =========================================================
INSERT INTO AVALIA (id_fiscalizacao, id_etapa, observacao) VALUES
(1, 1, 'Primeira inspeção da demolição, sem irregularidades.'),
(2, 1, 'Etapa encerrada e liberada para próxima fase.'),
(3, 2, 'Estrutura reforçada em conformidade com o projeto.'),
(4, 3, 'Necessária correção de trecho das instalações elétricas.'),
(5, 3, 'Aguardando regularização completa para aprovação.'),
(6, 5, 'Fundação aprovada integralmente.'),
(7, 6, 'Estrutura aprovada na fase intermediária.'),
(8, 6, 'Pendência relacionada à segurança do canteiro.'),
(9, 9, 'Terraplenagem executada conforme memorial descritivo.'),
(10, 10, 'Drenagem aprovada.'),
(11, 11, 'Base finalizada com qualidade satisfatória.'),
(12, 12, 'Reprovação por falha técnica e atraso.'),
(13, 12, 'Empresa apresentou defesa e cronograma revisado.'),
(14, 14, 'Etapa liberada para urbanização.'),
(15, 15, 'Boa execução do piso no trecho vistoriado.'),
(16, 15, 'Necessário refazer trecho com recalque.'),
(17, 18, 'Demolições executadas adequadamente.'),
(18, 19, 'Cobertura metálica alinhada e aprovada.'),
(19, 20, 'Avaliação parcial das instalações em andamento.'),
(20, 22, 'Boa recuperação estrutural até o momento.'),
(21, 22, 'Persistem pontos a corrigir antes da conclusão.'),

-- Casos N:N: uma fiscalização avaliando outras etapas relacionadas
(8, 7, 'Embora a vistoria principal fosse a estrutura, foi observada preparação inadequada para início da alvenaria.'),
(12, 13, 'A sinalização não pôde ser iniciada por dependência da pavimentação.'),
(16, 16, 'Paisagismo ainda não iniciado por ajustes pendentes na urbanização.'),
(19, 21, 'Acabamento final ainda depende da conclusão das instalações.'),
(21, 23, 'Cobertura não pode avançar plenamente antes da liberação estrutural total.');


-- =========================================================
-- AJUSTE DAS SEQUENCES
-- =========================================================
SELECT setval(pg_get_serial_sequence('OBRA', 'id_obra'),
              COALESCE((SELECT MAX(id_obra) FROM OBRA), 1), true);

SELECT setval(pg_get_serial_sequence('CONTRATO', 'id_contrato'),
              COALESCE((SELECT MAX(id_contrato) FROM CONTRATO), 1), true);

SELECT setval(pg_get_serial_sequence('ETAPA', 'id_etapa'),
              COALESCE((SELECT MAX(id_etapa) FROM ETAPA), 1), true);

SELECT setval(pg_get_serial_sequence('FISCALIZACAO', 'id_fiscalizacao'),
              COALESCE((SELECT MAX(id_fiscalizacao) FROM FISCALIZACAO), 1), true);

COMMIT;