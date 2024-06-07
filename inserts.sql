USE capulus;

-- Tabela pessoas
INSERT INTO pessoas (nome, sobrenome, email, cpf)
	VALUES ("Luan", "Alves Fernandes", "LuanAlvesFernandes@jourrapide.com", "636.176.985-22"),
		   ("Marisa", "Almeida Santos", "MarisaAlmeidaSantos@dayrep.com", "428.902.759-81"),
           ("Eduarda", "Santos Dias", "EduardaSantosDias@armyspy.com", "951.846.547-98"),
           ("Felipe", "Ribeiro Rocha", "FelipeRibeiroRocha@teleworm.us", "214.629.571-61"),
           ("Luiz", "Cardoso Rodrigues", "LuizCardosoRodrigues@rhyta.com", "433.145.043-06"),
           ("Samuel", "Barbosa Alves", "SamuelBarbosaAlves@rhyta.com", "441.840.863-06"),
           ("Mariana", "Pereira Cardoso", "MarianaPereiraCardoso@teleworm.us", "557.771.339-08"),
           ("Victor", "Sousa Carvalho", "VictorSousaCarvalho@teleworm.us", "595.388.381-14"),
           ("Leonardo", "Dias Barbosa", "LeonardoDiasBarbosa@rhyta.com", "966.136.182-76"),
           ("Luis", "Melo Barbosa", "LuisMeloBarbosa@rhyta.com", "983.440.969-95");

-- Tabela telefones
INSERT INTO telefones (id_pessoa, telefone, tipo) 
	VALUES (1, '7114-8385', 'Residencial'),
		   (1, '96215-4517', 'Celular'),
		   (2, '4614-2700', 'Residencial'),
		   (2, '97665-4051', 'Celular'),
		   (3, '7366-7893', 'Residencial'),
		   (3, '92961-9827', 'Celular'),
		   (4, '9926-2277', 'Residencial'),
		   (4, '93937-7702', 'Celular'),
		   (5, '5318-5400', 'Residencial'),
		   (5, '98601-9441', 'Celular'),
           (6, '2898-2875', 'Residencial'),
		   (6, '96085-8692', 'Celular'),
		   (7, '2444-3645', 'Residencial'),
		   (7, '97661-9853', 'Celular'),
		   (8, '9222-8681', 'Residencial'),
		   (8, '99819-2150', 'Celular'),
		   (9, '95486-6623', 'Residencial'),
		   (9, '98563-2714', 'Celular'),
		   (10, '2819-4732', 'Residencial'),
		   (10, '92379-4522', 'Celular');
       
-- Tabela clientes
INSERT INTO clientes (id_pessoa, data_registro) 
	VALUES (1, '2023-01-15'),
		   (2, '2023-02-20'),
		   (3, '2023-03-25'),
		   (4, '2023-04-30'),
		   (5, '2023-05-10');

-- Tabela departamentos
INSERT INTO departamentos (nome, descricao) 
	VALUES ('Vendas', 'Departamento responsável pelas vendas'),
		   ('Marketing', 'Departamento responsável pelo marketing'),
		   ('RH', 'Departamento de Recursos Humanos'),
		   ('TI', 'Departamento de Tecnologia da Informação'),
		   ('Financeiro', 'Departamento Financeiro');

INSERT INTO funcionarios (id_pessoa, id_departamento, salario, data_admissao) 
	VALUES (6, 1, 2300.00, '2022-01-10'),
		   (7, 2, 4200.00, '2021-03-15'),
		   (8, 3, 3000.00, '2020-07-20'),
		   (9, 4, 5000.00, '2019-11-25'),
		   (10, 5, 3750.00, '2021-06-30');
           
-- Tabela categorias
INSERT INTO categorias (nome) 
	VALUES ('Cafés Especiais'),
		   ('Cafés Tradicionais'),
		   ('Cafés Orgânicos'),
		   ('Cafés Descafeinados'),
		   ('Acessórios para Café');

-- Tabela produtos
INSERT INTO produtos (id_categoria, nome, descricao, preco) 
	VALUES (1, 'Café Arábica', 'Café 100% arábica de alta qualidade', 25.00),
		   (1, 'Café Bourbon', 'Café arábica bourbon', 30.00),
		   (2, 'Café Tradicional', 'Café tradicional para o dia a dia', 15.00),
		   (2, 'Café Extra Forte', 'Café extra forte', 18.00),
		   (3, 'Café Orgânico Premium', 'Café orgânico premium', 35.00),
		   (3, 'Café Orgânico Light', 'Café orgânico com torra leve', 32.00),
		   (4, 'Café Descafeinado', 'Café descafeinado', 20.00),
		   (4, 'Café Descafeinado Premium', 'Café descafeinado de alta qualidade', 28.00),
		   (5, 'Filtro de Papel', 'Filtro de papel para café', 5.00),
		   (5, 'Coador de Pano', 'Coador de pano reutilizável', 10.00);

-- Tabela pedidos
INSERT INTO pedidos (id_cliente, valor_total, data_pedido, status) 
	VALUES (1, 50.00, '2024-01-01 10:00:00', 'Em Processamento'),
		   (2, 45.00, '2024-01-02 11:00:00', 'Concluído'),
		   (3, 70.00, '2024-01-03 12:00:00', 'Enviado'),
		   (4, 35.00, '2024-01-04 13:00:00', 'Cancelado'),
		   (5, 90.00, '2024-01-05 14:00:00', 'Em Processamento'),
		   (1, 25.00, '2024-01-06 15:00:00', 'Concluído'),
		   (2, 120.00, '2024-01-07 16:00:00', 'Enviado'),
		   (3, 55.00, '2024-01-08 17:00:00', 'Cancelado'),
		   (4, 85.00, '2024-01-09 18:00:00', 'Em Processamento'),
		   (5, 100.00, '2024-01-10 19:00:00', 'Concluído');

-- Tabela pedido_tem_produto
INSERT INTO pedido_tem_produto (id_pedido, id_produto, quantidade) 
	VALUES (1, 1, 2),
		   (1, 5, 1),
		   (2, 2, 1),
		   (2, 8, 1),
		   (3, 3, 2),
		   (3, 6, 1),
		   (4, 4, 1),
		   (4, 7, 1),
		   (5, 5, 3),
		   (6, 6, 1),
		   (7, 7, 4),
		   (7, 9, 1),
		   (8, 8, 2),
		   (9, 9, 1),
		   (9, 10, 1),
		   (10, 10, 2);
