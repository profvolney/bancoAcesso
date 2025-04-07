CREATE DATABASE ACESSO;
USE ACESSO;
-- Tabela de perfis (níveis de acesso)
CREATE TABLE perfis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    perfil_id INT NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (perfil_id) REFERENCES perfis(id)
);

-- Tabela de telas ou módulos da aplicação
CREATE TABLE telas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    chave_unica VARCHAR(100) NOT NULL UNIQUE -- Ex: "dashboard", "clientes", "relatorios"
);

-- Tabela de permissões
CREATE TABLE permissoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    perfil_id INT NOT NULL,
    tela_id INT NOT NULL,
    pode_visualizar BOOLEAN DEFAULT FALSE,
    pode_editar BOOLEAN DEFAULT FALSE,
    pode_excluir BOOLEAN DEFAULT FALSE,
    pode_criar BOOLEAN DEFAULT FALSE,
    UNIQUE (perfil_id, tela_id),
    FOREIGN KEY (perfil_id) REFERENCES perfis(id),
    FOREIGN KEY (tela_id) REFERENCES telas(id)
);


-- SELECT * FROM acesso.usuarios;
-- describe usuarios;

-- INSERT INTO acesso.usuarios (id, nome, email, senha_hash, perfil_id, ativo) 
-- VALUES (1,'root','root@root.com.br',SHA2('minhaSenha123', 256), 1, 1);

-- SELECT LENGTH('2c4881ac0b8d786b7119c0c0c31dc43ded39f59e45708c12e03136acdc5ff891');       