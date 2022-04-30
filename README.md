# Lista de Comandos Uteis para o Projeto 

**Ative o ambiente virtual**
- source automatizador_env/bin/activate

**Desative o ambiente virtual**
- deactivate

**Rodar Projeto**
- python3 manage.py runserver

**Comandos para executar dentro do Mysql**
- SHOW VARIABLES LIKE 'event%';
- SET GLOBAL event_scheduler = ON;
- SHOW EVENTS FROM automatizador; 

DELIMITER //
CREATE EVENT muda_satus
ON SCHEDULE EVERY 15 MINUTE
STARTS '2022-04-29'
DO
BEGIN
			UPDATE `automatizador`.`tasks`
			SET 
						`previous_status` = `status`
			WHERE
						`status`IN ('success','running');

      UPDATE `automatizador`.`tasks`
			SET 
						`status` = 'running', 
						`update_date` = NOW() 
			WHERE
							`status`IN ('success','running');        	 	
       
END//
DELIMITER;  


**Evento Mysql para rotina de erro**

DELIMITER //
CREATE EVENT atribui_erro
ON SCHEDULE EVERY 1 MINUTE
STARTS '2022-04-29 23:00:00'
DO
BEGIN
			UPDATE `automatizador`.`tasks`
			SET 
						`previous_status` = `status`
			WHERE
						`status`IN ('running')
                AND NOW()  > `update_date` + INTERVAL 5 MINUTE;  

      UPDATE `automatizador`.`tasks`
			SET 
						`status` = 'error', 
						`update_date` = NOW()
			WHERE
							`status` IN ('running')
        AND NOW()  > `update_date` + INTERVAL 5 MINUTE;               	 	
       
END//
DELIMITER;
