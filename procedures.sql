USE capulus;

-- Procedure para adicionar uma nova pessoa no banco de dados
DELIMITER //
CREATE PROCEDURE addPessoa(
	nome VARCHAR(25), 
	sobrenome VARCHAR(75), 
	email VARCHAR(100), 
	cpf VARCHAR(14)
)
BEGIN
	INSERT INTO pessoas (nome, sobrenome, email, cpf) 
		VALUES (nome, sobrenome, email, cpf);
END //
DELIMITER ;

CALL addPessoa('João', 'Marques da Silva', 'JoaoMarquesDaSilva@gmail.com', '872.234.658-10');
DROP PROCEDURE addPessoa;
SELECT * FROM pessoas;