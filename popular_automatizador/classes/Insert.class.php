<?php 
class Insert{    
    public static function getTaskGorups(){
        $sql = "SELECT * FROM task_groups;";
        $select = DB::getConn()->prepare($sql);
        $select->execute();
        return $select->fetchAll(); 
    }
}