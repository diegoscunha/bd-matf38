DELIMITER ;;
CREATE TRIGGER `cad_unid_geracao_distribuida_AFTER_INSERT` AFTER INSERT ON `cad_unid_geracao_distribuida` FOR EACH ROW
BEGIN
    DECLARE nm_sigla_new CHAR(3);
    
	SET nm_sigla_new = (SELECT `nm_sigla` FROM `cad_tipo_unid_geracao` WHERE `id`= NEW.`id_cad_tipo_unid_geracao`);
        
	INSERT INTO `hist_unid_geracao_distribuida`
	(`id_cad_unid_geracao_distribuida`,`old_tipo_unid_geracao`,`new_tipo_unid_geracao`,`ds_historico`) 
	VALUES
	(NEW.`id`,NULL,NEW.`id_cad_tipo_unid_geracao`,CONCAT('TIPO CRIADO COM [',nm_sigla_new,'].'));
END ;;
DELIMITER ;