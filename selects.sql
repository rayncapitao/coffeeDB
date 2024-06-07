USE capulus;

-- Seleciona todos os clientes
SELECT * FROM clientes;

-- Seleciona todos os produtos com o preço maior que 20
SELECT * FROM produtos WHERE preco > 20;

-- Conta o número total de produtos
SELECT COUNT(*) AS total_de_produtos FROM produtos;

-- Calcula a média dos preços dos produtos
SELECT AVG(preco) AS media_preco_produtos FROM produtos;

-- Agrupa os produtos por categoria e conta quantos produtos em cada categoria
SELECT id_categoria, COUNT(*) AS num_produtos FROM produtos GROUP BY id_categoria;

-- Seleciona os clientes que registraram após 2023-01-01
SELECT * FROM clientes WHERE data_registro > '2023-01-01';

-- Seleciona todos os pedidos que foram feitos pelo mesmo cliente, baseado no id_cliente das duas tabelas
SELECT p.id_pedido, p.id_cliente, p.valor_total, p.data_pedido, status
	FROM pedidos p 
    JOIN clientes c
    ON p.id_cliente = c.id_cliente;

-- Seleciona todos os produtos e junta com informações da categoria
SELECT prod.*, cat.nome AS categoria_nome 
	FROM produtos AS prod
	JOIN categorias AS cat
    ON prod.id_categoria = cat.id_categoria;

-- Seleciona todos os pedidos de um cliente específico (id_cliente = 1)
SELECT * FROM pedidos 
	WHERE id_cliente = 1;

-- Seleciona os 5 produtos mais caros
SELECT * FROM produtos 
	ORDER BY preco DESC LIMIT 5;

-- Seleciona clientes com sobrenome 'Melo Barbosa'
SELECT * FROM pessoas 
	WHERE sobrenome = 'Melo Barbosa';

-- Seleciona produtos cujo nome contém 'Café'
SELECT * FROM produtos 
	WHERE nome LIKE '%Café%';

-- Conta o número de pedidos por status
SELECT status, COUNT(*) AS num_pedidos 
	FROM pedidos 
    GROUP BY status;

-- Seleciona clientes que não têm nenhum pedido
SELECT * FROM clientes 
	WHERE id_cliente NOT IN (
		SELECT id_cliente FROM pedidos
	);

-- Seleciona o pedido com o maior valor_total
SELECT * FROM pedidos 
	ORDER BY valor_total DESC LIMIT 1;

-- Seleciona todos os funcionários e junta com informações da pessoa
SELECT f.id_funcionario, p.nome, p.sobrenome, f.salario, f.data_admissao
	FROM funcionarios f
	JOIN pessoas p
    ON f.id_pessoa = p.id_pessoa;

-- Seleciona todos os telefones de um cliente específico (id_cliente = 1)
SELECT t.id_pessoa, t.telefone, t.tipo
	FROM telefones t
	JOIN clientes c
		ON t.id_pessoa = c.id_pessoa
		WHERE c.id_cliente = 1;

-- Seleciona todos os funcionários de um departamento específico (id_departamento = 1)
SELECT * 
	FROM funcionarios 
	WHERE id_departamento = 1;

SELECT f.id_departamento, p.nome, p.sobrenome, f.salario, p.cpf
	FROM funcionarios f
    INNER JOIN pessoas p
		ON f.id_pessoa = p.id_pessoa
		AND f.id_departamento = 1;

-- Conta o número de funcionários por departamento
SELECT id_departamento, COUNT(*) AS num_funcionarios
	FROM funcionarios 
    GROUP BY id_departamento;

-- Calcula o salário médio por departamento
SELECT id_departamento, ROUND(AVG(salario), 2) AS salario_medio 
	FROM funcionarios 
    GROUP BY id_departamento;

-- Seleciona todos os pedidos feitos em 2024
SELECT * 
	FROM pedidos 
    WHERE YEAR(data_pedido) = 2024;

# Ordena por id_cliente
SELECT * 
	FROM pedidos 
    WHERE YEAR(data_pedido) = 2024
	ORDER BY id_cliente ASC;

-- Seleciona todos os clientes, seu id_cliente, nome completo e o número de pedidos que cada um fez
SELECT cli.id_cliente, CONCAT(pes.nome, " ", pes.sobrenome) AS nome_completo, COUNT(ped.id_pedido) AS num_pedidos 
	FROM clientes cli
	LEFT JOIN pedidos ped 
		ON cli.id_cliente = ped.id_cliente
	INNER JOIN pessoas pes
		ON cli.id_pessoa = pes.id_pessoa
		GROUP BY cli.id_cliente;




