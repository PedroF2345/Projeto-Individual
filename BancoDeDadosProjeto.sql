-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS jogos_db;

-- Selecionar o banco de dados
USE jogos_db;

-- Criar a tabela usuario
CREATE TABLE IF NOT EXISTS usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(50),
    senha VARCHAR(50)
);

-- Criar a tabela jogo
CREATE TABLE IF NOT EXISTS jogo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descricao VARCHAR(300)
);

-- Criar a tabela jogo_jogado
CREATE TABLE IF NOT EXISTS jogo_jogado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    jogado CHAR(1) CHECK (jogado IN ('S', 'N')),
    fk_usuario INT,
    fk_jogo INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
    FOREIGN KEY (fk_jogo) REFERENCES jogo(id)
);

-- Inserir os dados de exemplo para os usuários
INSERT INTO usuario (nome, email, senha) VALUES 
('Usuário 1', 'usuario1@example.com', 'senha123'),
('Usuário 2', 'usuario2@example.com', 'senha123');

-- Inserir os dados de exemplo para os jogos
INSERT INTO jogo (titulo, descricao) VALUES 
('Minecraft', 'Um jogo de construção e aventura.'),
('GTA5', 'Um jogo de ação e aventura em mundo aberto.'),
('Call of Duty', 'Um jogo de tiro em primeira pessoa.'),
('Fortnite', 'Um jogo de sobrevivência e batalha real.'),
('Elden Ring', 'Um jogo de RPG de ação em mundo aberto.'),
('Lethal Company', 'Um jogo de tiro em primeira pessoa.'),
('Spider-Man 2', 'Um jogo de ação e aventura baseado no super-herói Homem-Aranha.'),
('Fallout', 'Um jogo de RPG de ação pós-apocalíptico.'),
('FIFA', 'Um jogo de simulação de futebol.');

-- Inserir os dados de exemplo para os jogos jogados e não jogados
INSERT INTO jogo_jogado (jogado, fk_usuario, fk_jogo) VALUES 
('S', 1, 1), -- Minecraft jogado pelo Usuário 1
('N', 1, 2), -- GTA5 não jogado pelo Usuário 1
('S', 2, 3), -- Call of Duty jogado pelo Usuário 2
('N', 2, 4), -- Fortnite não jogado pelo Usuário 2
('N', NULL, 5), -- Elden Ring não jogado por nenhum usuário
('N', NULL, 6), -- Lethal Company não jogado por nenhum usuário
('N', NULL, 7), -- Spider-Man 2 não jogado por nenhum usuário
('S', 1, 8), -- Fallout jogado pelo Usuário 1
('S', 2, 9); -- FIFA jogado pelo Usuário 2