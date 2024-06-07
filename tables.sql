CREATE DATABASE capulus;
USE capulus;
# DROP DATABASE capulus;

CREATE TABLE pessoas (
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(25) NOT NULL,
    sobrenome VARCHAR(75) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL
);

CREATE TABLE telefones (
	id_telefone INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_pessoa INT NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    tipo VARCHAR(20),
    FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa)
);

CREATE TABLE clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_pessoa INT NOT NULL,
    data_registro DATE,
    FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa)
);

CREATE TABLE departamentos (
	id_departamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE funcionarios (
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_pessoa INT NOT NULL,
    id_departamento INT NOT NULL,
    salario DECIMAL(6, 2) NOT NULL,
    data_admissao DATE,
    FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa),
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

CREATE TABLE categorias (
	id_categoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
	id_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_categoria INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(6, 2) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_cliente INT NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    data_pedido DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE pedido_tem_produto (
	id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    PRIMARY KEY(id_pedido, id_produto)
);
