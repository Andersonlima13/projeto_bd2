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
