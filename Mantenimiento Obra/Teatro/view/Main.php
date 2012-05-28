<?php

require_once '../control/ObraControl.php';

abstract class Main {

    public static function run() {
        
        
        $opcion = isset($_POST['opcion']) ? $_POST['opcion'] : null;
        if($opcion!=null){
        switch ($opcion) {
            case "insert_obra":
                $id = null;
                $nombre = $_POST['nombre'];
                $autor = $_POST['autor'];
                $director = $_POST['director'];
                $actores = $_POST['actores'];
                $sala = $_POST['sala'];
                $precio = $_POST['precio'];
                $temporada = $_POST['temporada'];
                $resena = $_POST['resena'];
                $target_path = "../afiches/";
                $path_info =basename($_FILES['afiche']['name']);
                $ext =  '.'.pathinfo($path_info, PATHINFO_EXTENSION);
                $afiche = str_replace(" ", '_', $nombre).$ext;
                $target_path = $target_path . $afiche;
                if ((($_FILES['afiche']['type'] == "image/gif")
                        || ($_FILES['afiche']['type'] == "image/jpeg")
                        || ($_FILES['afiche']['type'] == "image/pjpeg")
                        || ($_FILES['afiche']['type'] == "image/png"))
                        && ($_FILES['afiche']['type'] < 20000)) {
                    if (move_uploaded_file($_FILES['afiche']['tmp_name'], $target_path)) {
                        ObraControl::insert($id, $nombre, $autor, $director, $actores, $sala, $precio, $temporada, $afiche, $resena);
                        header('location:Main.php');

                    } else {
                        echo "Error";
                    }
                }else
                    echo "Error";
                break;

            default:
                self::_showObras(ObraControl::getAll());
                break;
        }}
        else{
            $op = isset($_GET['op']) ? $_GET['op'] : null;
        echo $op;
        
          switch ($op) {
            case "a":
                self::_addObras();
                break;
            default :
                self::_showObras(ObraControl::getAll());
                break;

                }
        
        
    }
    }
    private static function _showObras($obras) {
        require_once 'html/ObraMantenimiento.html';
    }
     private static function _addObras() {
        require_once 'html/ObraNuevo.html';
    }

    private static function _verBarras($nombre=null) {
        require_once 'Barras.html';
    }

    private static function _verDots($numero=0, $puntos=null) {
        require_once 'puntos.html';
    }

    private static function _verInicio() {
        require_once 'Default.html';
    }

}

Main::run();
?>
