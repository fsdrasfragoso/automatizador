<?php 
class Insert{    
    static function getTaskGorups($colunas,$where, $titulo){
        $sql = "SELECT * FROM task_groups;";
        $select = DB::getConn()->prepare($sql);
        $select->execute();
        return $select->fetchAll(); 
    }
}