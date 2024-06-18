USE capulus;

-- Procedure para adicionar uma nova pessoa no banco de dados
DELIMITER //
CREATE PROCEDURE addPessoa(p_nome VARCHAR(25), p_sobrenome VARCHAR(75), p_email VARCHAR(100), p_cpf VARCHAR(14))
BEGIN
	INSERT INTO pessoas (p_nome, p_sobrenome, p_email, p_cpf) 
		VALUES (p_nome, p_sobrenome, p_email, p_cpf);
END //
DELIMITER ;

CALL addPessoa('João', 'Marques da Silva', 'JoaoMarquesDaSilva@gmail.com', '872.234.658-10');
DROP PROCEDURE addPessoa;
SELECT * FROM pessoas;

-- Procedure para listar os produtos por categoria
DELIMITER $$
CREATE PROCEDURE listProductsByCategoryID(p_id_categoria INT)
BEGIN
	DECLARE productCount INT;
    
    SELECT COUNT(id_produto) INTO productCount 
		FROM produtos 
        WHERE id_categoria = p_id_categoria;
    
    IF productCount = 0 THEN
		SELECT "Não há produtos na categoria informada." AS Erro;
	ELSE
		SELECT * 
			FROM produtos 
			WHERE id_categoria = p_id_categoria;
    END IF;
END $$
DELIMITER ;

CALL listProductsByCategoryID(2);
DROP PROCEDURE listProductsByCategoryID;
