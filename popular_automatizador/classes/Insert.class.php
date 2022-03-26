<?php 
class Insert{    
    public static function getTaskGorups()
    {
        $sql = "SELECT * FROM task_groups;";
        $select = DB::getConn()->prepare($sql);
        $select->execute();
        return $select->fetchAll(); 
    }

    public static function setTasks()
    {
        foreach(self::getTaskGorups() as $task_group)
        {
            for($i=1;$i<=10;$i++)
            {
                $tesk_group_id = $task_group['id'];
                $input = array('running','success','error','stop');
                $rand_keys = array_rand($input, 2);
                $status = $input[$rand_keys[0]];
                if($status == 'error')
                {
                    self::setUpdateTaskGorup($tesk_group_id);
                }
                $creation_date = date('Y-m-d H:i:s');                
                $sql = "INSERT INTO `automatizador`.`tasks` (                                
                    `name`,
                    `status`,
                    `creation_date`,
                    `update_date`,
                    `previous_status`,
                    `tesk_group_id`
                )
                VALUES
                    ( 
                        'Tarefa Número $i',
                        '$status',
                        '$creation_date',
                        '$creation_date',
                        'stop',
                        '$tesk_group_id'
                    );";
              $insert = DB::getConn()->prepare($sql);
              $insert->execute(); 
            }
            
            
        }

        return self::getTasks();
    }

    public static function getTasks()
    {
        $sql = "SELECT * FROM tasks;";
        $select = DB::getConn()->prepare($sql);
        $select->execute();
        $tasks = $select->fetchAll();
        if(!empty($tasks))
            return $tasks;
        
        return self::setTasks(); 
    }

    public static function setUpdateTaskGorup($tesk_group_id)
    {
        $update_date = date('Y-m-d H:i:s');
        $sql = "UPDATE `automatizador`.`task_groups`
                SET 
                 `r` = '150',
                 `g` = '20',
                 `b` = '34',
                 `update_date` = '$update_date'
                WHERE
                    `id` = '$tesk_group_id';
        ";
        $update = DB::getConn()->prepare($sql);
        return $update->execute(); 
    }


}