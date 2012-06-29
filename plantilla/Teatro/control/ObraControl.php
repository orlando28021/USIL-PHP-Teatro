<?php
require_once '../Model/Obra.php';
abstract class ObraControl {
    public static function insert($id, $nombre, $autor, $director, $actores, $sala, $precio, $temporada, $afiche, $resena){
        $obra = new Obra($id, $nombre, $autor, $director, $actores, $sala, $precio, $temporada, $afiche, $resena);
        $obra->insert();
    }
    public static function getAll(){
        $obra = new Obra();
        $lista=$obra->getAll();
        return $lista;
    }
}
?>
