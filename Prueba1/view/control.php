<?php
require_once '../control/UsuarioControl.php';

class control {
    public function ejecutar(){
        $usuario = new UsuarioControl();
        
        $string = 'HOLA';
        $option = null;
        if($option == null){
            $this->_ejecutarUsuario($string, $usuario);
        }
    }
    
    private function _ejecutarUsuario($string, $usuario){
        require_once 'usuarioHTML.html';
    }
}

$view = new control();
$view->ejecutar();

?>
