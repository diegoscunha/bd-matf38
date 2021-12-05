DELIMITER ;;
CREATE TRIGGER `cad_unid_geracao_distribuida_AFTER_UPDATE` AFTER UPDATE ON `cad_unid_geracao_distribuida` FOR EACH ROW
BEGIN
	DECLARE nm_sigla_old CHAR(3);
    DECLARE nm_sigla_new CHAR(3);

	IF NEW.`id_cad_tipo_unid_geracao` != OLD.`id_cad_tipo_unid_geracao` THEN
		SET nm_sigla_old = (SELECT `nm_sigla` FROM `cad_tipo_unid_geracao` WHERE `id`= OLD.`id_cad_tipo_unid_geracao`);
		SET nm_sigla_new = (SELECT `nm_sigla` FROM `cad_tipo_unid_geracao` WHERE `id`= NEW.`id_cad_tipo_unid_geracao`);
        
		INSERT INTO `hist_unid_geracao_distribuida`
        (`id_cad_unid_geracao_distribuida`,`old_tipo_unid_geracao`,`new_tipo_unid_geracao`,`ds_historico`) 
        VALUES
        (NEW.`id`, OLD.`id_cad_tipo_unid_geracao`,NEW.`id_cad_tipo_unid_geracao`,CONCAT('TIPO ALTERADO DE [',nm_sigla_old, '] PARA [',nm_sigla_new,'].'));
    END IF;
END ;;
DELIMITER ;