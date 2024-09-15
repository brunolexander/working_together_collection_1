CREATE DATABASE VEHICLE_WORKSHOP;
USE VEHICLE_WORKSHOP;

--Questoes a comentar
-- api dos correios para o endereco

CREATE TABLE IF NOT EXISTS tb_client( 
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    client_type SMALLINT NOT NULL,
    cpf VARCHAR(11),
    cnpj VARCHAR(14),
    email VARCHAR(100),
    phone VARCHAR(11) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP(),--system provides the date info
    updated_at DATETIME DEFAULT NULL--system provides the date inf
);


-- ADDRESS

CREATE TABLE IF NOT EXISTS tb_address(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    client_id INT NOT NULL,
    address_client VARCHAR(100) NOT NULL,
    address_number VARCHAR(10) NOT NULL,
    complement VARCHAR(100) NOT NULL,
    neighborhood VARCHAR(100) NOT NULL,
    fk_city_id INT NOT NULL,
    fk_state_id INT NOT NULL,
    fk_cep_id INT NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    FOREIGN KEY (fk_city_id) REFERENCES tb_city(id),
    FOREIGN KEY (fk_state_id) REFERENCES tb_state(id),
    FOREIGN KEY (fk_cep_id) REFERENCES tb_cep(id)
);

CREATE TABLE IF NOT EXISTS tb_city(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    city_name VARCHAR(100) NOT NULL,
    fk_state_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_state(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    state_name VARCHAR(100) NOT NULL,
    abbreviation VARCHAR(2) NOT NULL,
    fk_city_id INT NOT NULL,
    FOREIGN KEY(fk_city_id) REFERENCES tb_city(id)
);

CREATE TABLE IF NOT EXISTS tb_cep(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cep VARCHAR(8) NOT NULL, --mascara no front
    logradouro VARCHAR(100) NOT NULL,
    neighborhood VARCHAR(100) NOT NULL,
    fk_city_id INT NOT NULL,
    fk_state_id INT NOT NULL,
    FOREIGN KEY(fk_city_id) REFERENCES tb_city(id),
    FOREIGN KEY(fk_state_id) REFERENCES tb_state(id)
);

CREATE TABLE IF NOT EXISTS tb_job_positions(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    description VARCHAR(150) NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL
);


--WORKERS

CREATE TABLE IF NOT EXISTS tb_workers(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,--email criado pelo sistema
    phone VARCHAR(11) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    fk_id_user INT NOT NULL,
    fk_id_job_position INT NOT NULL,
    FOREIGN KEY (fk_id_user) REFERENCES tb_users(id),
    FOREIGN KEY (fk_id_job_position) REFERENCES tb_job_positions(id)
);

--SALARY

CREATE TABLE IF NOT EXISTS tb_salary(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_id_job_position id INT NOT NULL,
    fk_id_worker INT NOT NULL,
    salary_value DECIMAL(10,2) NOT NULL,
    initial_date DATE NOT NULL,
    final_date DATE DEFAULT NULL,
    FOREIGN KEY (fk_id_job_position) REFERENCES tb_job_positions(id),
    FOREIGN KEY (fk_id_worker) REFERENCES tb_workers(id)
);

CREATE TABLE IF NOT EXISTS tb_salary_increase(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fk_id_job_position INT NOT NULL,
    fk_id_worker INT NOT NULL,
    reason VARCHAR(200) NOT NULL,
    new_salary DECIMAL(10,2) NOT NULL,
    increase_date DATE NOT NULL,
    FOREIGN KEY (fk_id_job_position) REFERENCES tb_job_positions(id),
    FOREIGN KEY (fk_id_worker) REFERENCES tb_workers(id)
);


--USERS    

CREATE TABLE IF NOT EXISTS tb_users(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    user_password CHAR(64) NOT NULL, -- CHAR(32) NOT NULL (USANDO O MD5, QUE É 128BITS DE CRIPTOGRAFIA.)
    time_access DATETIME NOT NULL--CAPTURADO PELO SISTEMA OPERACIONAL.(PHP)
);


--VEICULOS

CREATE TABLE IF NOT EXISTS tb_vehicle(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    model VARCHAR(60),
    brand VARCHAR(60),
    year SMALL INT,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,   
    fk_id_client INT NOT NULL,
    plate VARCHAR(7) NOT NULL -- MASCARA NO FRONT PARA FORMATACAO SEM SALVAR O "-"
)


--JOAO

CREATE TABLE tb_product(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
product_name VARCHAR(100) NOT NULL,
value REAL(6,2) NOT NULL,
stored INT NOT NULL,
fk_category_product INT NOT NULL
);



CREATE TABLE category_product(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
category VARCHAR(30) NOT NULL
);

CREATE TABLE category_service(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
category VARCHAR(30) NOT NULL
);




CREATE TABLE dependent(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
full_name VARCHAR(100),
fk_id_client INT NOT NULL, -- if permited more than one dependent to client
relationship VARCHAR(30) NOT NULL,
cpf VARCHAR(11) NOT NULL,
phone VARCHAR(11) NOT NULL,
gender VARCHAR(1) NOT NULL,
created_at DATE NOT NULL,--system provides the date info
updated_at DATE NOT NULL,--system provides the date info

);


##em uma tabela relacionada por fk - codigos_pecas_para_reparacao (outra tabela relacionada por fk de uma tabela de pecas)

CREATE TABLE tb_service(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
description VARCHAR(500) NOT NULL,
fk_id_duration_service,
fk_id_client INT NOT NULL,
fk_id_employee INT NOT NULL,------------------ ######## TABLE GABRIEL
fk_category_service INT NOT NULL,
date_init DATE NOT NULL,
date_end DATE NOT NULL,
quantity INT NOT NULL,--------------- ???
value REAL(8,2) NOT NULL
);


CREATE TABLE tb_duration_service(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
fk_id_service INT NOT NULL,
date_init DATE NOT NULL,
date_end DATE NOT NULL
);
