/* 
USUÁRIO DBA COM TODAS AS PERMISSÕES
DBA RESPONSAVEL POR ADMINISTRAR O SERVIDOR DE BANCO DE DADOS
 */ 
CREATE USER `user_dba`@`localhost` IDENTIFIED BY 'ecd123';
GRANT ALL PRIVILEGES ON *.* TO `user_dba`@'localhost';

/*
USUÁRIO DA APLICAÇÃO WEB
*/
CREATE USER `app_web`@`localhost` IDENTIFIED BY 'ecd123';
GRANT SELECT, INSERT, DELETE, UPDATE, EXECUTE ON `geracao_distribuida`.* TO `app_web`@'localhost';

/*
USUÁRIO ANALISTA DE DADOS, SOMENTE COM PREMISSÃO PARA CONSULTA
*/
CREATE USER `analista_dados`@`localhost` IDENTIFIED BY 'ecd123';
GRANT SELECT ON `geracao_distribuida`.* TO `analista_dados`@'localhost';

-- RECARREGAR PRIVILEGIOS
FLUSH PRIVILEGES;