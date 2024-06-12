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

-- Seleciona todos os produtos em pedidos com quantidade maior que 2
SELECT p.id_produto, p.nome, p.descricao, p.preco, ptp.quantidade 
	FROM produtos p
	JOIN pedido_tem_produto ptp
		ON p.id_produto = ptp.id_produto
	WHERE ptp.quantidade > 2;

-- Seleciona todas as pessoas que são funcionários
SELECT pessoas.* 
	FROM pessoas
	JOIN funcionarios 
    ON pessoas.id_pessoa = funcionarios.id_pessoa;

-- Seleciona o departamento com o maior número de funcionários
SELECT departamentos.*, COUNT(funcionarios.id_funcionario) AS num_funcionarios 
	FROM departamentos
	INNER JOIN funcionarios 
		ON departamentos.id_departamento = funcionarios.id_departamento
	GROUP BY departamentos.id_departamento
	ORDER BY num_funcionarios DESC LIMIT 1;

-- Seleciona todos os pedidos e o valor total dos produtos em cada pedido
SELECT p.*, SUM(prod.preco * ptp.quantidade) AS valor_total_produtos 
	FROM pedidos p
	JOIN pedido_tem_produto ptp
		ON p.id_pedido = ptp.id_pedido
	JOIN produtos prod
		ON ptp.id_produto = prod.id_produto
	GROUP BY p.id_pedido;

-- Seleciona todas as pessoas que têm telefone residencial
SELECT pessoas.* 
	FROM pessoas
	JOIN telefones 
		ON pessoas.id_pessoa = telefones.id_pessoa
	WHERE telefones.tipo = 'Residencial';

-- Seleciona os produtos que nunca foram pedidos
SELECT * 
	FROM produtos 
	WHERE id_produto NOT IN (
		SELECT id_produto FROM pedido_tem_produto);

-- Seleciona os clientes que fizeram mais de 3 pedidos
SELECT c.*, COUNT(p.id_pedido) AS num_pedidos 
	FROM clientes c
		JOIN pedidos p
			ON c.id_cliente = p.id_cliente
		GROUP BY c.id_cliente
		HAVING num_pedidos > 3;

-- Seleciona os produtos mais pedidos
SELECT produtos.*, SUM(pedido_tem_produto.quantidade) AS total_quantidade 
	FROM produtos
	JOIN pedido_tem_produto 
		ON produtos.id_produto = pedido_tem_produto.id_produto
	GROUP BY produtos.id_produto
	ORDER BY total_quantidade DESC LIMIT 5;
