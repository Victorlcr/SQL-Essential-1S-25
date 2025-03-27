-- Criação do banco de dados chamado 'Escola'
CREATE DATABASE Escola;

USE Escola

-- Criação da tabela 'Curso' que irá armazenar informações dos cursos oferecidos pela escola
CREATE TABLE Curso (
    -- CodCurso: Coluna de tipo de dado INT (Números inteiros) que será a chave primária da tabela.
    -- A propriedade IDENTITY(1,1) faz com que o valor seja automaticamente incrementado, começando de 1.
    CodCurso INT IDENTITY(1,1) PRIMARY KEY,   -- CodCurso será a chave primária e auto-incrementada, ou seja, não iremos inserir nenhum dado manualmente nessa coluna
    
    -- NomeCurso: Coluna de tipo de dado VARCHAR (cadeia de caracteres) com um limite de 50 caracteres.
    -- Não pode ser NULL, ou seja, sempre será obrigatório informar o nome do curso.
    NomeCurso VARCHAR(50) NOT NULL,             -- Nome do curso, com até 50 caracteres e não pode ser NULL

	-- Ativo: Coluna de tipo de dado BIT (Booleano - Verdadeiro (1) ou Falso (0)), indica se o curso está ativo ou não
	Ativo BIT NOT NULL
);

-- Criação da tabela 'Aluno' que irá armazenar informações dos alunos da escola
CREATE TABLE Aluno (
    -- CodAluno: Coluna de tipo de dado INT (Números inteiros), chave primária da tabela e auto-incrementada.
    CodAluno INT IDENTITY(1,1) PRIMARY KEY,    -- CodAluno será a chave primária e auto-incrementada, ou seja, não iremos inserir nenhum dado manualmente nessa coluna
    
    -- Nome: Coluna de tipo de dado VARCHAR (cadeia de caracteres), que armazenará o nome do aluno, com até 30 caracteres.
    -- Não pode ser NULL.
    Nome VARCHAR(30) NOT NULL,                 -- Nome do aluno, com até 30 caracteres e não pode ser NULL
    
    -- Sobrenome: Coluna de tipo de dado VARCHAR (cadeia de caracteres), que armazenará o sobrenome do aluno, com até 50 caracteres.
    -- Não pode ser NULL.
    Sobrenome VARCHAR(50) NOT NULL,            -- Sobrenome do aluno, com até 50 caracteres e não pode ser NULL
    
    -- CodCurso: Coluna de tipo de dado INT que irá armazenar o código do curso do aluno.
    -- Referencia a chave primária da tabela 'Curso'.
    CodCurso INT NOT NULL,                    -- Referência ao curso do aluno, não pode ser NULL
    
    -- DataNasc: Coluna de tipo de dado DATE, que armazenará a data de nascimento do aluno.
    -- Pode ser NULL, caso a data não seja fornecida.
    DataNasc DATE,                            -- Data de nascimento do aluno, pode ser NULL
    
    -- Definição de uma restrição de chave estrangeira, vinculando a coluna CodCurso com a chave primária CodCurso da tabela Curso.
    -- A cláusula ON DELETE CASCADE garante que, se um curso for deletado, todos os alunos que estiverem matriculados nesse curso também serão deletados automaticamente.
    CONSTRAINT fk_aluno_curso FOREIGN KEY (CodCurso) REFERENCES Curso(CodCurso) ON DELETE CASCADE
);

-- Inserção de registros na tabela 'Curso', com os nomes dos cursos oferecidos pela escola.
INSERT INTO Curso (NomeCurso, Ativo) VALUES 
('Análise e Desenvolvimento de Sistemas', 1),  -- Curso 1
('Ciência de Dados', 1),                      -- Curso 2
('Defesa Cibernética', 1),                    -- Curso 3
('Eventos', 1),                               -- Curso 4
('Gestão Ambiental', 1),                      -- Curso 5
('Gestão Empresarial', 1),                    -- Curso 6
('Gestão de Logística Integrada', 1),         -- Curso 7
('Gestão de TI', 1),                          -- Curso 8
('Sistemas Embarcados', 1);                   -- Curso 9

-- Inserção de registros na tabela 'Aluno', com informações sobre alunos, como nome, sobrenome, código do curso e data de nascimento.
-- Para os alunos, a data de nascimento pode ser deixada como NULL, pois não é um dado obrigatório.
INSERT INTO Aluno (Nome, Sobrenome, CodCurso, DataNasc) VALUES 
('João', 'Silva', 5, '2005-09-10'),          -- Aluno 1
('Maria', 'Souza', 2, NULL),                 -- Aluno 2 (Data de nascimento não fornecida)
('Carlos', 'Oliveira', 9, NULL),             -- Aluno 3 (Data de nascimento não fornecida)
('Ana', 'Pereira', 1, '2004-05-15'),         -- Aluno 4
('Lucas', 'Costa', 4, '2003-11-22'),         -- Aluno 5
('Fernanda', 'Alves', 3, '2006-01-30'),      -- Aluno 6
('Roberta', 'Martins', 7, '2005-03-10'),     -- Aluno 7
('Felipe', 'Rodrigues', 6, '2002-07-25'),    -- Aluno 8
('Ricardo', 'Santos', 8, '2007-09-05'),      -- Aluno 9
('Juliana', 'Lima', 2, '2004-10-12'),        -- Aluno 10
('Marcelo', 'Nunes', 1, '2005-12-25'),       -- Aluno 11
('Patrícia', 'Carvalho', 5, '2006-04-20'),   -- Aluno 12
('Gustavo', 'Silveira', 9, '2003-06-15'),    -- Aluno 13
('Tatiane', 'Martins', 4, '2007-02-18'),     -- Aluno 14
('Adriano', 'Almeida', 6, '2005-09-05'),     -- Aluno 15
('Robson', 'Costa', 8, '2002-11-01'),        -- Aluno 16
('Simone', 'Mendes', 7, '2006-08-23'),       -- Aluno 17
('Thais', 'Ferreira', 3, '2004-12-10'),      -- Aluno 18
('Julio', 'Gomes', 5, '2006-07-08'),         -- Aluno 19
('Cláudia', 'Oliveira', 2, '2004-03-02'),    -- Aluno 20
('Bruno', 'Barros', 6, '2005-04-16'),        -- Aluno 21
('Luciana', 'Souza', 9, '2007-05-19'),       -- Aluno 22
('Paulo', 'Santos', 1, '2003-08-13'),        -- Aluno 23
('Bianca', 'Ribeiro', 4, '2006-09-28'),      -- Aluno 24
('Mariana', 'Pinto', 7, '2003-10-22'),       -- Aluno 25
('Leandro', 'Cavalcante', 8, '2007-01-11'),  -- Aluno 26
('Carla', 'Araújo', 9, '2002-09-07'),        -- Aluno 27
('Rafael', 'Santos', 2, '2006-11-19'),       -- Aluno 28
('Priscila', 'Silva', 5, '2004-02-17'),      -- Aluno 29
('Diego', 'Oliveira', 1, '2005-03-30'),      -- Aluno 30
('Marta', 'Pereira', 3, '2004-06-06'),       -- Aluno 31
('Rogério', 'Martins', 4, '2006-10-05'),     -- Aluno 32
('Kelly', 'Gomes', 7, '2002-01-20'),         -- Aluno 33
('Denise', 'Costa', 6, '2003-12-12');        -- Aluno 34

-- Atualização do nome do curso na tabela 'Curso'
UPDATE Curso
SET NomeCurso = 'Curso Fatec'  -- Define um novo nome para o curso, aplica a mudança em todos os cursos

-- Atualização do nome do curso na tabela 'Curso'
UPDATE Curso
SET NomeCurso = 'CD'  -- Define um novo nome para o curso
WHERE CodCurso = 2;    -- Aplica a mudança apenas ao curso cujo CodCurso é igual a 2

-- Exclusão de todos os cursos na tabela 'Curso'
DELETE FROM Curso

-- Exclusão de um curso na tabela 'Curso'
DELETE FROM Curso
WHERE CodCurso = 6; -- Remove da tabela todas as informações do curso que possui CodCurso igual a 6

-- Consulta para visualizar todos os cursos cadastrados na tabela 'Curso'
SELECT * FROM Curso;

-- Consulta para visualizar todos os alunos cadastrados na tabela 'Aluno'
SELECT * FROM Aluno;
