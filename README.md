# Lista de Comandos Uteis para o Projeto 
**Artigo UTIL**
- http://pythonclub.com.br/django-introducao-queries.html
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
      UPDATE `automatizador`.`task_groups`
SET `r` = '150',
 `g` = '20',
 `b` = '34',
 `update_date` = NOW()
WHERE
	id IN (
		SELECT
			*
		FROM
			(
				SELECT
					tg.id AS id
				FROM
					task_groups AS tg
				INNER JOIN tasks AS t ON t.task_group_id = tg.id
				WHERE
					t.`status` IN ('running')
				AND NOW() > t.`update_date` + INTERVAL 5 MINUTE
				GROUP BY
					tg.id
			) AS j
	); 
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
       UPDATE `automatizador`.`task_groups`
SET `r` = '32',
 `g` = '150',
 `b` = '23',
 `update_date` = NOW()
WHERE
	id NOT IN (
		SELECT
			*
		FROM
			(
				SELECT
					tg.id AS id
				FROM
					task_groups AS tg
				INNER JOIN tasks AS t ON t.task_group_id = tg.id
				WHERE
					t.`status` = 'error'
				GROUP BY
					tg.id
			) AS j
	);              	 	
       
END
DELIMITER;
