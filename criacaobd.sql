CREATE TABLE FUNCIONARIO (
    CPF VARCHAR(11) PRIMARY KEY, -- Chave primária, identificando o funcionário
    NOME VARCHAR(100) NOT NULL,
    DEPARTAMENTO VARCHAR(100) NOT NULL,
    IS_INSPETOR BOOLEAN NOT NULL, -- Indica se o funcionário é um inspetor ou não
    COD_INSPETOR VARCHAR(11) NULL, -- Referência opcional para o inspetor responsável
    PLANTAO BOOLEAN NOT NULL, -- Indica se o funcionário está de plantão
    UNIQUE (CPF),
    FOREIGN KEY (COD_INSPETOR) REFERENCES FUNCIONARIO(CPF) -- Relacionamento entre inspetores e funcionários
);


CREATE TABLE PREDIO (
    ID_PREDIO SERIAL PRIMARY KEY,
    ENDERECO VARCHAR(255) NOT NULL,
    RESPONSAVEL VARCHAR(11), -- CPF do responsável pelo prédio
    FOREIGN KEY (RESPONSAVEL) REFERENCES FUNCIONARIO(CPF) -- Referência ao funcionário responsável
);

CREATE TABLE CAMERA (
    ID_CAMERA SERIAL PRIMARY KEY,
    ID_PREDIO INT NOT NULL, -- Relacionamento com o prédio
    FOREIGN KEY (ID_PREDIO) REFERENCES PREDIO(ID_PREDIO) -- Relacionamento com a tabela PREDIO
);


CREATE TABLE EVENTO (
    ID_EVENTO SERIAL PRIMARY KEY,
    DESCRICAO TEXT NOT NULL,
    TIPO_EVENTO VARCHAR(100) NOT NULL,
    DATA_EVENTO TIMESTAMP NOT NULL -- Armazena a data e hora do evento
);

CREATE TABLE REGISTRO_MONITORAMENTO (
    ID_REGISTRO SERIAL PRIMARY KEY,
    PLANTAO BOOLEAN NOT NULL, -- Indica se o funcionário estava de plantão
    CPF_FUNCIONARIO VARCHAR(11) NOT NULL, -- Funcionário que fez o monitoramento
    ID_CAMERA INT NOT NULL, -- Câmera monitorada
    ID_EVENTO INT NOT NULL, -- Evento registrado
    FOREIGN KEY (CPF_FUNCIONARIO) REFERENCES FUNCIONARIO(CPF), -- Referência ao funcionário que fez o monitoramento
    FOREIGN KEY (ID_CAMERA) REFERENCES CAMERA(ID_CAMERA), -- Referência à câmera monitorada
    FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO) -- Referência ao evento registrado
);
