<?php
require_once '../control/UsuarioControl.php';
require_once '../control/ComentarioControl.php';
require_once '../control/HorarioControl.php';
require_once '../control/ObraControl.php';
require_once '../control/VotosControl.php';

class control {
    public function ejecutar(){
        $usuario = new UsuarioControl();
        $comentario = new ComentarioControl();
        $horario = new HorarioControl();
        $obra = new ObraControl();
        $votos = new VotosControl();
        
        $option = null;
        if($option == null){
            $horario->MantenimientoHorario();
            $this->_ejecutarHorario($horario);
        }
    }
    
    private function _ejecutarUsuario($usuario){
        require_once 'usuarioHTML.html';
    }
    
    private function _ejecutarComentario($comentario){
        require_once 'usuarioHTML.html';
    }
    
    private function _ejecutarHorario($horario){
        require_once 'usuarioHTML.html';
    }
    
    private function _ejecutarObra($obra){
        require_once 'usuarioHTML.html';
    }
    
    private function _ejecutarVotos($votos){
        require_once 'usuarioHTML.html';
    }
    
    
    
}

$view = new control();
$view->ejecutar();

?>
